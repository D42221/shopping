package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	// データベースの代わりにこのユーザ名とパスワードを正しいとする
	private static final String USER = "student";
	private static final String PASS = "himitu";

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		// リクエストパラメータの読み込み
		String action = request.getParameter("action");
		if (action.equals("login")) {
			// ログイン時はユーザ名とパスワードを取得する
			// パラメータのエラーチェックは省略
			String name = request.getParameter("name");
			String passWord = request.getParameter("pw");

			if (name.equals(USER) && passWord.equals(PASS)) { // ユーザ名とパスワードが一致したら
				// セッション管理を行う
				HttpSession session = request.getSession();
				// ログイン済みの属性を設定する
				session.setAttribute("name", USER);
				session.setAttribute("isLogin", "true");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
				dispatcher.forward(request, response);

			}
		} else if (action.equals("logout")) {
			// すでに作成されているセッション領域を取得する。新しくは作成しない
			HttpSession session = request.getSession(false);
			if (session != null) {
				// セッション領域を無効にする
				session.invalidate();
				out.println("<html><head><title>ShowCart</title></head><body>");
				out.println("<h1>ログアウトしました</h1>");
			}
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
