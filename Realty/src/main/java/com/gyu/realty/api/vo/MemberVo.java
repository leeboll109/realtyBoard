package com.gyu.realty.api.vo;

public class MemberVo {
	private String account_id;
	private String accoun_pw;
	private String nickname;
	private String account_type;
	private String quit;
	
	public String getAccountId() {
		return account_id;
	}

	public String getAccountPw() {
		return accoun_pw;
	}

	public String getNickname() {
		return nickname;
	}

	public String getAccountType() {
		return account_type;
	}

	public String getQuit() {
		return quit;
	}
	
	public void setAccountId(String accountId) {
		this.account_id = accountId;
	}
	
	public void setAccountPw(String accountPw) {
		this.accoun_pw = accountPw;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setAccountType(String accountType) {
		this.account_type = accountType;
	}
	
	
	public void setQuit(String quit) {
		this.quit = quit;
	}
}
