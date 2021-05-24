package servlet;

import java.io.IOException;
import java.io.PrintWriter;

public class Utils {

	/**
	 * 必須入力チェック：チェック対象となる変数にデータが代入されているかどうかをチェックする
	 * @param out　target　チェック対象文字列
	 * @throws IOException　チェック対象文字列がnullまたは空文字列の場合はfalse、それ以外はtrue
	 */
	public static boolean isRequired(String target) {
		return !(target == null || target.length() == 0);
	}

	public static void printHeader(PrintWriter out) throws IOException {
		out.println("<html><hrad><title>HelloServlet</title><body>");
	}

	public static void printFooter(PrintWriter out) {
		out.println("</body></html>");
	}

	public static void println(PrintWriter out, String target) {
		out.println(target);
	}
}