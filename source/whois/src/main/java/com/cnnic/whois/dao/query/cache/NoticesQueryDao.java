package com.cnnic.whois.dao.query.cache;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cnnic.whois.bean.QueryParam;
import com.cnnic.whois.bean.QueryType;
@Repository("cacheNoticesQueryDao")
public class NoticesQueryDao extends AbstractCacheQueryDao {
	@Override
	protected List<String> getCacheKeySplits(QueryParam param) {
		return super.getHandleCacheKeySplits(param);
	}

	@Override
	public QueryType getQueryType() {
		return QueryType.NOTICES;
	}

	@Override
	public boolean supportType(QueryType queryType) {
		return QueryType.NOTICES.equals(queryType);
	}

	@Override
	protected boolean needInitCache() {
		return true;
	}

	@Override
	protected void initCache() {
		super.initCacheWithOneKey("$mul$notices", "noticesId");
	}
}