package com.example.site.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString @Setter
public class Member {
	  private int memIdx; 
	  private String memID;  
	  private String memPassword;
	  private String memName;
	  private int memAge; // <-null, 0
	  private String memGender;   
	  private String memEmail;
	  private String memProfile; //사진정보
	 
	
	  
	  public Member() {
		
	}


	public Member(String memID, String memPassword, String memName, int memAge, String memGender, String memEmail,
			MultipartFile file1) {
		
		this.memID = memID;
		this.memPassword = memPassword;
		this.memName = memName;
		this.memAge = memAge;
		this.memGender = memGender;
		this.memEmail = memEmail;
		
	}


	public int getMemIdx() {
		return memIdx;
	}


	public String getMemID() {
		return memID;
	}


	public String getMemPassword() {
		return memPassword;
	}


	public String getMemName() {
		return memName;
	}


	public int getMemAge() {
		return memAge;
	}


	public String getMemGender() {
		return memGender;
	}


	public String getMemEmail() {
		return memEmail;
	}


	public String getMemProfile() {
		return memProfile;
	}


	
	  
	
	  
	  
	 
	  
}
