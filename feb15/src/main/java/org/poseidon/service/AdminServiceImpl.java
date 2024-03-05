package org.poseidon.service;

import java.util.List;

import org.poseidon.dao.AdminDAO;
import org.poseidon.dto.BoardDTO;
import org.poseidon.dto.SearchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl extends AbstractService implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public List<BoardDTO> boardList(SearchDTO searchDTO) {
		return adminDAO.boardList(searchDTO);
	}

	@Override
	public int totalRecordCount(SearchDTO searchDTO) {
		return adminDAO.totalRecordCount(searchDTO);
	}

	@Override
	public int postDel(int no) {
		return adminDAO.postDel(no);
	}

	@Override
	public BoardDTO detail(int no) {
		return adminDAO.detail(no);
	}
	

}
