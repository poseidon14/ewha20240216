package org.poseidon.controller;

import java.util.List;

import javax.annotation.Resource;

import org.poseidon.dto.BoardDTO;
import org.poseidon.dto.SearchDTO;
import org.poseidon.service.AdminService;
import org.poseidon.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

//administrator = admin
//root
@Controller
@RequestMapping("/admin")
public class AdminController {

	// http://localhost/web/admin/index
	// 경로----------------------

	@Resource(name="adminService")
	private AdminService adminService;
	
	@Autowired
	private Util util;
	
	
	@GetMapping("/")
	public String index() {
		return "admin/index";
	}

	@GetMapping("/index")
	public String index2() {
		return "admin/index";
	}

	//20240304 
	@GetMapping("/board")
	public String board(
			@RequestParam(name="pageNo", defaultValue = "1") String pageNo,
			@RequestParam(name="perPage", defaultValue = "1", required = false) String perPage,
			@RequestParam(name="searchTitle", required = false) String searchTitle,			
			@RequestParam(name="search", required = false) String search,			
			Model model) {
		//페이징 + 검색 + 한 화면에 보이는 게시글 수 변경 
		//전체 글 수에도 DTO보내기
		SearchDTO searchDTO = new SearchDTO();
		searchDTO.setSearchTitle(searchTitle);
		searchDTO.setSearch(search);
		
		//전체 글 수 뽑기
		int totalRecordCount = adminService.totalRecordCount(searchDTO);
		
		//전자정부 페이징
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(util.str2Int(pageNo));
		paginationInfo.setRecordCountPerPage(util.str2Int(perPage) * 10);//10 20 30 40 50 100
		paginationInfo.setPageSize(10);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		
		//검색에서 사용할 값 추가
		searchDTO.setPageNo(paginationInfo.getFirstRecordIndex());
		searchDTO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<BoardDTO> list = adminService.boardList(searchDTO);
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("perPage", perPage);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("search", search);
		
		return "admin/board";
	}
	
	//20240304
	@GetMapping("/postDel")
	public String postDel(@RequestParam("no") int no) {
		int result = adminService.postDel(no);
		return "redirect:/admin/board";
	}
	
	
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}

	@GetMapping("/join")
	public String join() {
		return "admin/join";
	}
	
	//20240305 psd 
	@GetMapping("/detail")
	public String detail(@RequestParam("no") int no, Model model) {
		// 데이터 베이스에서 받아오세요.
		BoardDTO detail = adminService.detail(no);
		// 모델에 붙여주세요.
		model.addAttribute("detail", detail);
		return "admin/detail";
	}

}

/*
 * 20240305 psd
 *              세션           쿠키
 * 사용 예)     로그인			쇼핑 정보, 장바구니, 자동 로그인 
 * 저장위치     서버			브라우져
 * 속도         느림            빠름
 * 보안         높음            낮음
 * 
 * 
 * 세션과 쿠키의 차이점 
 * 
 * 쿠키/세션은 캐쉬와 다릅니다.			
 * 
 * 쿠키는 이름, 값, 유효시간, 도메인, 경로등을 저장합니다.
 * 클라이너트에 총 300개의 쿠키를 저장할 수 있습니다., 
 * 쿠키는 도메인당 20개만 가질 수 있습니다.
 * 쿠키 크기는 4096byte(4KB)까지만 저장할 수 있습니다. 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 3/5회의 결과
 * 
 * 5월 졸업과정인 우리 과정도 포함입니다.
 * 현 수업하고 있는 과목은? 안드로이드 앱 프로그래밍
 * 수업했던 과목은?
 * 
 * 2시 이후 들어오면 외출처리 시킨답니다. 2시 전까지 들어오세요.
 * 
 * 601호는 50~정각까지 쉬는시간입니다. 쉬는 시간 이외에 밖에 나가면 외출처리 합니다.
 * 
 * 
 * 
 * 
 * 
 * 
 * */
