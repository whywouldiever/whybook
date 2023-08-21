<template>
  <view class="container">
    <view class="search-box">
      <input
        v-model="keyword"
        placeholder="输入学校名称"
        class="search-input"
      />
      <image @tap="search" class="search-btn" src="/static/image/search.png"></image>
    </view>
    <view class="result">
      <view v-if="searchResult.length === 0" class="empty">
        暂无结果
      </view>
      <view v-else class="list" >
        <view class="item" v-for="(university, index) in searchResult" :key="index" @tap="save">
          {{ university.name }}
        </view>
      </view>
    </view>
	 <!-- <button size="mini" class="btn" @tap="save">保存</button> -->
  </view>
</template>
<script>
export default {
  data() {
    return {
      keyword: '', // 用户输入的学校名称关键词
      university: [
        { name: '清华大学' },
        { name: '北京大学' },
        { name: '复旦大学' },
        { name: '上海交通大学' },
        { name: '浙江大学' },
        { name: '南京大学' },
        { name: '武汉大学' },
        { name: '中国人民大学' },
        { name: '中山大学' },
        { name: '西华大学' }
      ],
      searchResult: [] // 查询结果
    }
  },
  methods: {
    search() {
      // 进行搜索操作
      this.searchResult = this.university.filter(university => {
        return university.name.includes(this.keyword)
      })
    },
	save() {
	  uni.reLaunch({
		url: '../personal/personal?university=' + JSON.stringify(this.searchResult)
	  })
	}
  }
}
</script>
<style>
	.container {
	  padding: 20rpx;
	}
	
	.search-box {
	  display: flex;
	  align-items: center;
	  margin-bottom: 20rpx;
	}
	
	.search-input {
	  flex: 1;
	  margin-right: 20rpx;
	  height: 60rpx;
	  padding: 0 20rpx;
	  border: 1px solid #ccc;
	  border-radius: 5rpx;
	}
	
.search-btn {
    width: 34px;
    height: 34px;
    margin-top: 5px;
    margin-right: 12px;
}
	
	.result .empty {
	  text-align: center;
	  color: #999;
	  font-size: 28rpx;
	  margin-top: 100rpx;
	}
	
	.result .list .item {
	  height: 100rpx;
	  line-height: 100rpx;
	  border-bottom: 1px solid #eee;
	  font-size: 32rpx;
	  padding: 0 20rpx;
	}
	.btn {
	  height: 80rpx;
	  line-height: 80rpx;
	  text-align: center;
	  background-color: #0086ff;
	  color: #fff;
	  border: none;
	  border-radius: 5rpx;
	  font-size: 32rpx;
	}
</style>
