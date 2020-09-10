package com.cos.mustacheTest.Model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class HomeBass {
	int id;
	String homename;
	Timestamp homeCreateDate;

}
