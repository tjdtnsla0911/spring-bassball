package com.cos.mustacheTest.Dto;

import java.sql.Time;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class userListDto {
	int id;
	String name;
	String position;
	String teamName;
	Timestamp userCreateDate;
	Timestamp createDate;
	int groubId;
	int rank;
	boolean whatNow;

	String whatNowChange;

}
