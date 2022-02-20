package com.spring.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;


@Service
public class Book {
	final String client_id = "p3EkwlpyD99frDpNN5th";
	final String client_secret = "_t4XeBaQvU";
	final String urladdr1= "https://openapi.naver.com/v1/search/book.xml?";
	final String urladdr2= "https://openapi.naver.com/v1/search/book_adv.xml?";
	public String search(String Query) {
		try {
			String query = URLEncoder.encode(Query,"UTF-8");
			 URL url = new URL(urladdr1+"query="+query);
			 HttpsURLConnection con= (HttpsURLConnection) url.openConnection();
			con.setDoOutput(true);
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", client_id);
			con.setRequestProperty("X-Naver-Client-Secret", client_secret);
			int code = con.getResponseCode();
			System.out.println(code);
			
		      BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		      String readline = null;
		      StringBuffer response = new StringBuffer();
		      while ((readline = br.readLine()) != null) {
		          response.append(readline);
		      }
		      br.close();
	      con.disconnect();
	      
	      System.out.println(xmlToJson(response.toString()));
	     
	      return xmlToJson(response.toString());
	      
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;		
	}
	
	public String xmlToJson(String str) {
		
		try {
			String xml = str;
			JSONObject jObject = XML.toJSONObject(xml);
			ObjectMapper mapper = new ObjectMapper();
			mapper.enable(SerializationFeature.INDENT_OUTPUT);
			Object json=mapper.readValue(jObject.toString(), Object.class);
			String output = mapper.writeValueAsString(json);
			System.out.println(output);
			return output;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
		
	}
}
