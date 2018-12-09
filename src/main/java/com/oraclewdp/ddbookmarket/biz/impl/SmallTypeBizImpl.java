package com.oraclewdp.ddbookmarket.biz.impl;

import java.util.List;

import com.oraclewdp.ddbookmarket.biz.SmallTypeBiz;
import com.oraclewdp.ddbookmarket.dao.SmallTypeDao;
import com.oraclewdp.ddbookmarket.dao.impl.SmallTypeJdbcImpl;
import com.oraclewdp.ddbookmarket.model.SmallType;

public class SmallTypeBizImpl implements SmallTypeBiz {

	@Override
	public boolean save(SmallType smallType) {
		SmallTypeDao smallTypeDao=new SmallTypeJdbcImpl();
		return smallTypeDao.save(smallType);
	}

	@Override
	public List<SmallType> findAllByBid(int bid) {
		SmallTypeDao smallTypeDao=new SmallTypeJdbcImpl();
		return smallTypeDao.findAllByBid(bid);
	}

	@Override
	public int findBidById(int sid) {
		SmallTypeDao smallTypeDao=new SmallTypeJdbcImpl();
		return smallTypeDao.findBidById(sid);
	}

}
