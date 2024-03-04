package org.poseidon.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SearchDTO {
	private int pageNo, recordCountPerPage;
	private String searchTitle, search;
}
