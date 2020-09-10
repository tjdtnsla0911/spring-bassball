package com.cos.mustacheTest.Model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class User{
int id;
String name;
String position;
Timestamp userCreateDate;
int groubId;

}
