package com.koreait.apart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.apart.model.ApartmentInfoDTO;
import com.koreait.apart.model.ApartmentInfoDomain;
import com.koreait.apart.model.ApartmentInfoEntity;

@Mapper
public interface HomeMapper {
	int insApart(ApartmentInfoDTO p);
	List<ApartmentInfoDomain> selApart(ApartmentInfoEntity p);
}
