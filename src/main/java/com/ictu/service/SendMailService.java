package com.ictu.service;

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.stereotype.Service;

import com.ictu.dto.MailInfo;

@Service
public interface SendMailService {

	void run();

	void queue(String to, String subject, String body);

	void queue(MailInfo mail);

	void send(MailInfo mail) throws MessagingException, IOException;

	String sendMail(String to, String subject, String body);

}
