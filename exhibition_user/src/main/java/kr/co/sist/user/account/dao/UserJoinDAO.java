package kr.co.sist.user.account.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sist.user.account.vo.MemberVO;
import kr.co.sist.user.mybatis.MyBatisFramework;
@Repository
public class UserJoinDAO {
	//ȸ������
	public void joinUser(MemberVO mVO) {
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		ss.insert("kr.co.sist.user.memberInsert",mVO);
		ss.commit();
	}
	//������üũ
	public String idCheck(String userId) {
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		String id=ss.selectOne("kr.co.sist.user.idCheck",userId);
		System.out.println("idCheck dao"+id);
		return id;
	}
}