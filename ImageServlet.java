package com.tap;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.jdbc.Blob;
import com.tap.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/image")
public class ImageServlet extends HttpServlet {

	private static final String DEFAULT_IMAGE_PATH = "/images/default.jpg"; // relative to src/main/webapp

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String menuIdParam = request.getParameter("id");

		if (menuIdParam == null || menuIdParam.isEmpty()) {
			sendDefaultImage(response);
			return;
		}

		int menuId = Integer.parseInt(menuIdParam);

		try (Connection conn = DBConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement("SELECT image_blob FROM menu WHERE menu_id = ?")) {

			stmt.setInt(1, menuId);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				Blob imageBlob = (Blob) rs.getBlob("image_blob");

				if (imageBlob != null) {
					response.setContentType("image/jpeg");
					try (InputStream in = imageBlob.getBinaryStream(); OutputStream out = response.getOutputStream()) {
						byte[] buffer = new byte[4096];
						int bytesRead;
						while ((bytesRead = in.read(buffer)) != -1) {
							out.write(buffer, 0, bytesRead);
						}
					}
					return;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// If image not found or error occurred, send default
		sendDefaultImage(response);
	}

	private void sendDefaultImage(HttpServletResponse response) throws IOException {
		response.setContentType("image/jpeg");

		// Get real path of default.jpg inside webapp/images/
		String defaultImagePath = getServletContext().getRealPath(DEFAULT_IMAGE_PATH);
		try (InputStream in = new FileInputStream(defaultImagePath); OutputStream out = response.getOutputStream()) {

			byte[] buffer = new byte[4096];
			int bytesRead;
			while ((bytesRead = in.read(buffer)) != -1) {
				out.write(buffer, 0, bytesRead);
			}
		}
	}
}
