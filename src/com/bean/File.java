package com.bean;

public class File {

	String fileName;
	String fileDes;
	String fileUrl;
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileDes() {
		return fileDes;
	}
	public void setFileDes(String fileDes) {
		this.fileDes = fileDes;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public File() {
		super();
	}
	@Override
	public String toString() {
		return "File [fileName=" + fileName + ", fileDes=" + fileDes
				+ ", fileUrl=" + fileUrl + "]";
	}
	
	
}
