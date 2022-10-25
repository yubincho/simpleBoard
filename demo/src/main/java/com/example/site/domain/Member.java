package com.example.site.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class Member {
	  private int memIdx; 
	  private String memID;  
	  private String memPassword;
	  private String memName;
	  private int memAge; // <-null, 0
	  private String memGender;   
	  private String memEmail;
	  private String memProfile; //사진정보
	  private List<AuthVO> authList;
	
	  
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

	public String getMemID() {
        return memID; 
    }

	
	
	
	  
	  
	 
	  
}
