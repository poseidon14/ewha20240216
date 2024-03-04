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

}
