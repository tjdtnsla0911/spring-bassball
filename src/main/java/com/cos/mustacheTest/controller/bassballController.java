package com.cos.mustacheTest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.mustacheTest.Dto.positionDto;
import com.cos.mustacheTest.Dto.userListDto;
import com.cos.mustacheTest.Model.HomeBass;
import com.cos.mustacheTest.Model.User;
import com.cos.mustacheTest.Model.team;
import com.cos.mustacheTest.Repository.bassballRepository;

@Controller
public class bassballController {

	@Autowired
	bassballRepository bassballRepository;
	@GetMapping("/bassball")
	public String bassBall(Model model) {
		System.out.println("bass볼에왔니?");
		List<userListDto> user = bassballRepository.userList();
		System.out.println("받은 유저 =" +user);
		for(int i=0;i<=user.size()-1;i++) {
			if(user.get(i).isWhatNow()) {

				System.out.println("isWhatNow에왔음");
				user.get(i).setWhatNowChange("현역선수입니다");

			}else {
				user.get(i).setWhatNowChange("퇴출선수입니다");

			}
		}
		model.addAttribute("userList",user);
		return "bassball";

	}
	@DeleteMapping("/userDelete/{id}")
	public @ResponseBody List<userListDto> deleteUser(@PathVariable int id) {
		System.out.println("델레트 치러왔음");
		System.out.println("id = "+id);
		bassballRepository.DeleteUser(id);


		List<userListDto> user = bassballRepository.userList();
		System.out.println("델레트 무사히끝난듯");
		for(int i=0;i<=user.size()-1;i++) {
			if(user.get(i).isWhatNow()) {

				System.out.println("isWhatNow에왔음");
				user.get(i).setWhatNowChange("현역선수입니다");

			}else {
				user.get(i).setWhatNowChange("퇴출선수입니다");

			}
		}
		return user;
	}
	@DeleteMapping("/homeDelete/{id}")
	public @ResponseBody List<HomeBass> deleteHome(@PathVariable int id){
		System.out.println("홈 델레트치러옴");
		System.out.println("받은 id = "+id);
		bassballRepository.DeleteHome(id);
		System.out.println("델레트는무사히친듯");
		List<HomeBass> homebassList = bassballRepository.findAllHome();
		return homebassList;
	}
	@DeleteMapping("/teamDelete/{id}")
	public @ResponseBody List<team> deleteTeam(@PathVariable int id){
		System.out.println("팀 지우러옴");
		bassballRepository.DeleteTeam(id);
		List<team> teamList = bassballRepository.findAllTeam();
		return teamList;
	}

	@GetMapping("/savePlayer")
	public String savePlayer() {
		return "savePlayerGo";
	}

	@PostMapping("/toroku")
	public  String saveToroku(userListDto userListDto) {
		int getubId=0;
		if(userListDto.getTeamName()=="치바이글스"||
				userListDto.getTeamName().equals("치바이글스")) {
			System.out.println("if 치바 이글스 ");
			getubId=1;
		//	userListDto.setGroubId(1);
		}else if(userListDto.getTeamName()=="롯데자이언트"||
				userListDto.getTeamName().equals("롯데자이언트")) {
			System.out.println("if 롯데자이언트 ");
			getubId=2;
		//	userListDto.setGroubId(2);
		}else if(userListDto.getTeamName()=="뉴욕양키즈"||
				userListDto.getTeamName().equals("뉴욕양키즈")) {
			System.out.println("if 뉴욕양키즈 ");
			getubId=3;
		//	userListDto.setGroubId(3);
		}else if(userListDto.getTeamName()=="무소속"||
				userListDto.getTeamName().equals("무소속")) {
			System.out.println("if 무소속 ");
			getubId=4;
		//	userListDto.setGroubId(4);
		}
		userListDto.setGroubId(getubId);
		System.out.println("saveToroku에 왔습니다");
		System.out.println("값 = "+userListDto);
		bassballRepository.saveUser(userListDto);
		System.out.println("넣고나서 userListDto = "+userListDto);
		//bassballRepository.saveTeam(userListDto);

		return "redirect:/bassball";
	}
	@GetMapping("/saveTeam")
	public String saveTeam() {
		System.out.println("saveTeam에 왔습니까?");
		return "saveTimeGo";
	}
	@PostMapping("/saveTeamStart")
	public String saveTeamStart(userListDto userListDto) {
		System.out.println("userListDto 에 왔습니다");
		System.out.println("userListDto 에 userListDto = "+userListDto);
		bassballRepository.saveTeam(userListDto);

		return "redirect:/bassball";
	}
	@GetMapping("/teamList")
	public String teamList(Model model) {
		System.out.println("팀리스트 보러감");
		List<team> myTeamList = bassballRepository.findAllTeam();
		System.out.println("다뽑고나서 myTeanKist = "+myTeamList);
		model.addAttribute("myTeamList",myTeamList);
		return "timeAllList";
	}

	@GetMapping("/saveHome")
	public String stardiumSave() {
		System.out.println("야구장 등록하러옴");
		return "stardiumSaveForm";
	}
	@PostMapping("/saveMyHome")
	public String saveHomeHome(HomeBass homeBass) {
		System.out.println("야구장드록하러옴");
		System.out.println("homeBass = "+homeBass);
		bassballRepository.saveHome(homeBass);

		return "redirect:/homeLists";

	}
	@GetMapping("/homeLists")
	public String homeList(Model model) {
		System.out.println("homeLists");
		List<HomeBass> bomeList =bassballRepository.findAllHome();
		model.addAttribute("bomeList",bomeList);
		return "homeList";
	}
	@GetMapping("/bunyaList")
	public String bunyaList(Model model) {
		System.out.println("분야별로 뽑으러옴");
		List<positionDto> bunya = bassballRepository.findAllBunya();
		System.out.println("뽑아온 bunya = "+bunya);
		model.addAttribute("bunya",bunya);
		return "bunyatheTeam";


	}



}


