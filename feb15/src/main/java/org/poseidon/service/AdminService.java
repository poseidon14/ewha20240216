package org.poseidon.service;

import java.util.List;

import org.poseidon.dto.BoardDTO;
import org.poseidon.dto.SearchDTO;

public interface AdminService {

	List<BoardDTO> boardList(SearchDTO searchDTO);

	int totalRecordCount(SearchDTO searchDTO);

	int postDel(int no);

}
