package co.aram.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.aram.prj.comm.Command;
import co.aram.prj.member.service.MemberService;
import co.aram.prj.member.service.MemberVO;
import co.aram.prj.member.serviceImpl.MemberServiceImpl;

public class AjaxAuthorUpdate implements Command {
	private String result;
	
	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 회원권한 변경
		MemberService memberDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("id"));
		vo.setAuthor(request.getParameter("author"));
		int n = memberDao.memberAuthorUpdate(vo);
		if(n != 0) {
			result = "yes";
		}else {
			result = "no";
		}
		return "ajax:" + result; // 스트링들.. 
	}

}
