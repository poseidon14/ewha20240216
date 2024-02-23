package org.poseidon.service;

import java.util.List;

import org.poseidon.dao.GalleryDAO;
import org.poseidon.dto.GalleryDTO;
import org.poseidon.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GalleryService {

	@Autowired
	private GalleryDAO galleryDAO;
	
	@Autowired
	private Util util;
	
	public int galleryInsert(GalleryDTO dto) {
		//세션 추가
		if(util.getSession().getAttribute("mid") != null) {
			dto.setMid((String) util.getSession().getAttribute("mid"));
			return galleryDAO.galleryInsert(dto);					
		} else {
			return 0;
		}
	}

	public List<GalleryDTO> galleryList() {
		return galleryDAO.galleryList();
	}
	
}
