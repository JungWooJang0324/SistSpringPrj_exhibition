package kr.co.sist.user.myInfo.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sist.user.account.vo.MemberVO;
import kr.co.sist.user.mybatis.MyBatisFramework;

@Repository
public class IdPassFindDAO {
	
	//���̵�ã��
	public MemberVO findId(MemberVO mVO) {
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		return ss.selectOne("kr.co.sist.user.findId",mVO);
	}
	//��й�ȣã��
	public MemberVO findPassword(MemberVO mVO) {
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		return ss.selectOne("kr.co.sist.user.findPassword",mVO);
	}
	//��й�ȣ ����
	public void updatePassword(MemberVO mVO) {
		SqlSession ss=MyBatisFramework.getInstance().getMyBatisHandler();
		try {
		ss.update("kr.co.sist.user.updatePassword",mVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		ss.commit();
		if(ss!=null) {ss.close();}		
		
	}
}
