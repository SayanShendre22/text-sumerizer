package com.example.sumerizer_text.controler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.lang.model.util.Elements;
import javax.swing.text.Document;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.sumerizer_text.vsFiles.SummaryTool;



@Controller
public class MainControler {
	
	
	int totalWords(String s) {
		
		 String str = s;
		 
	        int count = 1;
	 
	        for (int i = 0; i < str.length() - 1; i++)
	        {
	            if ((str.charAt(i) == ' ') && (str.charAt(i + 1) != ' '))
	            {
	                count++;
	            }
	        }
	        
	        return count;
	        
	}
	
	double ReadingTime(double words) {
		double count = words;
		double time;
		time = count/200d;
        return time;
	}
	
	String UrlText(String u)throws Exception {
		
				URL test = new URL("https://journaldev.com");
				URLConnection uc = test.openConnection();
				uc.addRequestProperty("User-Agent", "Mozilla/4.0");
				BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream()));
				String inputLine;
				StringBuilder sb = new StringBuilder();
				while ((inputLine = in.readLine()) != null) {
					sb.append(inputLine);
					System.out.println(inputLine);
				}
				in.close();
				System.out.println("HTML Data:" + sb.toString());
				return sb.toString();
					
			}
	
	
	
	
	@RequestMapping("/")
	public String home() {
		System.out.println("This is home sayan");
		return "index";
	}    
	
	@RequestMapping("/contact")
	public String contact() {
		System.out.println("This is contact");
		return "contact";
	}   
	
	
	@RequestMapping(path="/analyze", method= RequestMethod.POST)
	public String analyze(@RequestParam("rawtext") String RawText,@RequestParam("N") int n, Model model) {
		System.out.println("This is analyze");
		
		double OT,ST,OW,SW;
		
		File file = new File("../sumerizer_text/src/main/java/samples/input.txt");
		
		try {
			file.createNewFile();
			FileWriter fw =new FileWriter("../sumerizer_text/src/main/java/samples/input.txt");
			fw.write(RawText);
			fw.close();
;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		SummaryTool summary = new SummaryTool();
		summary.init();
		summary.extractSentenceFromContext();
		summary.groupSentencesIntoParagraphs();
//		summary.printSentences();
		summary.createIntersectionMatrix();

		summary.createDictionary();
		summary.createSummary(n);
		String FunalSum= summary.printSummary();
		
		
		
		OW=totalWords(RawText);
		SW=totalWords(FunalSum);
		
		OT=ReadingTime(OW);
		ST=ReadingTime(SW);
//		summary.printStats();

//		System.out.print(RawText);
		
//		System.out.print(FunalSum);
		
		model.addAttribute("originalText",RawText);
		model.addAttribute("Sumerzed_text", FunalSum);
		model.addAttribute("orignial_time", OT);
		model.addAttribute("final_reading_time", ST);
		model.addAttribute("originl_words", OW);
		model.addAttribute("final_words", SW);
		
		return "index";
	}
	
	
	@RequestMapping(path="/analyze_url", method= RequestMethod.POST)
	public String analyze(@RequestParam("user_url") String UserUrl, Model model) {
	
	try {
		String urlS =UrlText(UserUrl);
		System.out.print(urlS);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
//	model.addAttribute("final_words");
	
	return "index";
	
	}

	
	
}
