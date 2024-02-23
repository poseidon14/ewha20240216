package org.poseidon.controller;

import java.util.List;

import org.poseidon.dto.GalleryDTO;
import org.poseidon.service.GalleryService;
import org.poseidon.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class GalleryController {

	@Autowired
	private GalleryService galleryService;

	@Autowired
	private Util util;

	@GetMapping("/gallery")
	public String gallery(Model model) {
		List<GalleryDTO> list = galleryService.galleryList();
		model.addAttribute("list", list);
		return "gallery";
	}

	@GetMapping("/galleryInsert")
	public String galleryInsert() {
		if (util.getSession().getAttribute("mid") != null) {
			return "galleryInsert";
		} else {
			return "redirect:/login";
		}
	}

	@PostMapping("/galleryInsert")
	public String galleryInsert(GalleryDTO dto, @RequestParam("file1") MultipartFile upFile) {
		if (util.getSession().getAttribute("mid") != null) {
			// System.out.println(dto.getGtitle());
			// System.out.println(dto.getGcontent());
			// System.out.println(upFile.getOriginalFilename());
			// 파일 업로드 -> util
			String newFileName = util.fileUpload(upFile);
			dto.setGfile(newFileName);// UUID+

			int result = galleryService.galleryInsert(dto);
			return "redirect:/gallery";
		} else {
			return "redirect:/login";
		}

	}

}
