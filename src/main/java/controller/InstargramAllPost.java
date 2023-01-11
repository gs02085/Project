package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.SellerDaoImpl;
import dto.Customer;
import dto.Seller;
import dto.SellerFarm;
import dto.SellerInstagram;


@Controller
public class InstargramAllPost {

	private SellerDaoImpl sellerDao;

	public InstargramAllPost setcustomerDao(SellerDaoImpl sellerDao) {
		this.sellerDao = sellerDao;
		return this;
	}

	@RequestMapping(value = "seller/instagramAll")
	public String form(HttpSession session, Model model) {

		try {
			// 개인 인스타 그램 게시물 리스트
			List<SellerInstagram> post = sellerDao.InstagramPost();
			List<String> image = new ArrayList();
			SellerInstagram profileImage = null;
			List<Integer> replycount = new ArrayList<Integer>();
			for (SellerInstagram instagram : post) {
				// 이미지사진을 넣은 것
				image = sellerDao.instagramImages(instagram.getPostnumber());
				instagram.setPostimages(image);
				// url 정보를 넣은 것
				profileImage = sellerDao.InstagramProfile(instagram.getEmail());
				instagram.setUrl(profileImage.getUrl());

				// 댓글 갯수를 넣은것
				if (sellerDao.getPostRelyCount(instagram.getPostnumber()) == null) {
					replycount.add(0);
				} else {
					replycount.add(sellerDao.getPostRelyCount(instagram.getPostnumber()));
				}

			}
			// 인스타 주말농장 리스트

			List<Seller> sellerlist = sellerDao.SellerList();
			List<SellerFarm> farmpost = new ArrayList<SellerFarm>();
			List<Integer> replycount2 = new ArrayList<Integer>();

			for (Seller framseller : sellerlist) {
				farmpost = sellerDao.Sconfirmfarm(framseller.getEmail());
				framseller.setFarmList(farmpost);
			}

			int count = 0;
			for (int i = 0; i < sellerlist.size(); i++) {
				count = 0;
				// System.out.println(sellerlist.get(i).getFramList().size());
				for (int j = 0; j < sellerlist.get(i).getFarmList().size(); j++) {
					// 이미지사진을 넣은 것
					image = sellerDao.getfarmImage(sellerlist.get(i).getFarmList().get(j).getFseq(),
							sellerlist.get(i).getEmail());
					sellerlist.get(i).getFarmList().get(j).setPostimages(image);
					// url 정보를 넣은 것
					profileImage = sellerDao.InstagramProfile(sellerlist.get(i).getEmail());
					sellerlist.get(i).getFarmList().get(j).setUrl(profileImage.getUrl());
					// 주말농장 댓글 갯수넣은것

					if (sellerDao.getfarmReplyCount(sellerlist.get(i).getFarmList().get(j).getFseq()) == null) {
						count += 0;
					} else {
						count += sellerDao.getfarmReplyCount(sellerlist.get(i).getFarmList().get(j).getFseq());

						;
					}
				}
				replycount2.add(count);
			}

			model.addAttribute("posting", post);
			model.addAttribute("posting2", sellerlist);
			model.addAttribute("replycount1", replycount);
			model.addAttribute("replycount2", replycount2);

			return "seller/InstramList";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "";
		}
	}

	// 게시물 선택할시
	@RequestMapping(value = "seller/instagramSelectPost")
	public String form2(HttpSession session, Model model, HttpServletRequest requset) {

		try {
			SellerInstagram user = sellerDao.InstagramProfile(requset.getParameter("email"));
			;
			Seller loginSeller = (Seller) session.getAttribute("authInfo");

			// 개인 인스타 그램 게시물 리스트
			SellerInstagram post = sellerDao.getpostSelect(requset.getParameter("email"),
			Integer.valueOf(requset.getParameter("postnumber")));
			List<String> image = new ArrayList();
			SellerInstagram profileImage = null;

			// 이미지사진을 넣은 것
			image = sellerDao.instagramImages(post.getPostnumber());
			post.setPostimages(image);
			// url 정보를 넣은 것
			profileImage = sellerDao.InstagramProfile(post.getEmail());
			post.setUrl(profileImage.getUrl());

			// 댓글 갯수 정보 넣은것
			int replycount = sellerDao.getPostRelyCount(post.getPostnumber());

			List<SellerInstagram> replyList = sellerDao.getPostRely(post.getPostnumber());

			model.addAttribute("authInfo", loginSeller);
			model.addAttribute("user", user);
			model.addAttribute("posting", post);
			model.addAttribute("replycount", replycount);
			model.addAttribute("replyList", replyList);

			return "seller/InstramListSelect";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "";
		}

	}

	// 농장게시물 선택할시
	@RequestMapping(value = "seller/instagramSelectfarm")
	public String form3(HttpSession session, Model model, HttpServletRequest requset) {

		try {
			SellerInstagram user = sellerDao.InstagramProfile(requset.getParameter("email"));
			;
			Seller loginperson = (Seller) session.getAttribute("authInfo");

			List<String> image = new ArrayList();
			SellerInstagram profileImage = null;

			// 인스타 주말농장 리스트

			Seller farmseller = new Seller();
			//받은 파라미터로 해당 판매자 조회
			farmseller.setEmail(requset.getParameter("email"));
			List<SellerFarm> farmpost = new ArrayList<SellerFarm>();

			//판매자를 조회한 후 판매자의 해당 농장을 조회 
			farmpost = sellerDao.Sconfirmfarm(farmseller.getEmail());
			//판매자에 해당 농장내역을 넣어줌 
			farmseller.setFarmList(farmpost);
			int replycount = 0;

			SellerFarm replyList = new SellerFarm();
			for (int j = 0; j < farmseller.getFarmList().size(); j++) {
				// 이미지사진을 넣은 것(인스타 게시물 사진 리스트)
				image = sellerDao.getfarmImage(farmseller.getFarmList().get(j).getFseq()
						, farmseller.getEmail());
				farmseller.getFarmList().get(j).setPostimages(image);
				// url 정보를 넣은 것(판매자 주말농장 프로필 사진)
				profileImage = sellerDao.InstagramProfile(farmseller.getEmail());
				farmseller.getFarmList().get(j).setUrl(profileImage.getUrl());

				//댓글 갯수
				replycount = sellerDao.getfarmReplyCount(farmseller.getFarmList().get(j).getFseq());

				//댓글 상세
				for (SellerFarm si : sellerDao.getfarmReply(farmseller.getFarmList().get(j).getFseq())) {
					replyList.replyList(si);

				}

			}

			model.addAttribute("replyList", replyList);
			model.addAttribute("authInfo", loginperson);
			model.addAttribute("user", user);
			model.addAttribute("posting2", farmseller);
			model.addAttribute("replycount", replycount);

			return "seller/InstramListSelect";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "";
		}

	}

	@RequestMapping(value = "seller/postAddreply")
	public String form4(HttpSession session, Model model, HttpServletRequest requset) {
		if (session.getAttribute("cAuthInfo") == null && session.getAttribute("authInfo") == null) {
			return "redirect:Slogin";
		}
		Seller loginuser=new Seller();
		Customer cloginuser=new Customer();
		String email="";

		if(session.getAttribute("cAuthInfo") == null) {
		 loginuser = (Seller) session.getAttribute("authInfo");
		 email=loginuser.getEmail();
		}else {
			cloginuser=(Customer) session.getAttribute("cAuthInfo");
			email=cloginuser.getEmail();
		}

		try {
			SellerInstagram reply = new SellerInstagram();
			reply.setContent(requset.getParameter("content"));

			

			sellerDao.SAddinstaRely(Integer.valueOf(requset.getParameter("postnumber")), email,
					requset.getParameter("content"));

			return "redirect:" + requset.getHeader("Referer");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "";
		}

	}

	@RequestMapping(value = "seller/farmAddreply")
	public String form5(HttpSession session, Model model, HttpServletRequest requset) {
		if (session.getAttribute("cAuthInfo") == null && session.getAttribute("authInfo") == null) {
			return "redirect:Slogin";
		}
		Seller loginuser=new Seller();
		Customer cloginuser=new Customer();
		String email="";

		if(session.getAttribute("cAuthInfo") == null) {
		 loginuser = (Seller) session.getAttribute("authInfo");
		 email=loginuser.getEmail();
		}else {
			cloginuser=(Customer) session.getAttribute("cAuthInfo");
			email=cloginuser.getEmail();
		}

		try {
			SellerInstagram reply = new SellerInstagram();
			reply.setContent(requset.getParameter("content"));
			reply.setEmail(email);

//		 System.out.println(reply.getContent());
//		 System.out.println(requset.getParameter("fseq"));

		
				sellerDao.SAddfarmRely(Integer.valueOf(requset.getParameter("fseq")), reply.getEmail(),
						reply.getContent());
			

			return "redirect:" + requset.getHeader("Referer");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "";
		}

	}

	
//	@RequestMapping(value = "seller/aa" ,method = {RequestMethod.POST,RequestMethod.GET})
	@PostMapping("seller/aa")
	@ResponseBody
	public  HashMap<String,Object>  form6(@RequestBody HashMap<String,Object> A ) {
		System.out.println("들어왔다앙");
		HashMap<String,Object> returnMap =new HashMap<String, Object>();
		System.out.println(A.get("email"));
		// A.get("email")
		returnMap.put("email","tt");
		returnMap.put("content", "a");
		
		return returnMap;
	}
	
}
