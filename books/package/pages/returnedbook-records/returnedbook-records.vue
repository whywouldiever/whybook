<template>
    <view class="container-records">
		<view class="items" v-for="(item,index) in historyList" :key="item.bid">
        <view class="bookinfo">
            <image class="cover" :src="item.image"></image>
            <view class="name">{{ item.bookName }}</view>
        </view>
		
        <view class="records time">
            <view class="txt">还书时间：</view>
            <picker mode="date" :start="today" :end="maxDate" :value="returnDate" @change="bindDateChange">
                <view class="val">{{item.end_time}}</view>
            </picker>
        </view>

		</view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            historyList:null
        };
    }
    /**
     * 生命周期函数--监听页面加载
     */,
    onLoad () {
		this.getHistoryDate();
		
    },
    methods: {
		//获取图书数据
		async getHistoryDate(){
			    const that = this;
			    wx.request({
			      url: 'http://localhost:8001/history/returnhistory', //本地服务器地址
			      method: 'GET',
			      header: {
			        'content-type': 'application/json' //默认值
			      },
			      success: function(res) { //res就是接收后台返回的数据
					  const historyList = res.data.historyList;
					  console.log(historyList);
					  that.setData({
						historyList:historyList
					  })
			      },
			      fail: function(res) {
			        console.log("失败");
			      }
			    })
		},
    }
};
</script>
<style>
.container-records {
  padding: 10rpx 40rpx;
  margin: 10rpx;
  
}
.items{
	display: flex;
	height: 340rpx;
	margin-bottom: 40rpx;
	border: 1rpx solid #ccc;
}
.bookinfo {
	margin-top: 5px;
	margin-left: 5px;
	width: 160rpx;
	height: 240rpx;
    align-items: center;
}

.cover {
    width: 180rpx;
    height: 260rpx;
    margin-right: 24rpx;
}

.name {
    font-size: 23rpx;
	text-align: center;
    color: #333333;
}

.records {
    width: 600rpx;
    height: 180rpx;
    margin-top: 100rpx;
	margin-left: 40rpx;
}
.time {
    align-items: center;
}

.txt {
    font-size: 28rpx;
    color: #999999;
}

.val {
    font-size: 28rpx;
    color: #333333;
}

.danger {
    color: #ff0000;
}

.btn {
	width: 60rpx;
	height: 40rpx;
	margin-left: 80rpx;
	margin-top: 20rpx;
    align-items: flex-end;
    border: 2rpx solid #0086ff;
    border-radius: 8rpx;
    font-size: 28rpx;
    color: #0086ff;
    padding: 16rpx 24rpx;
	
}

.btn:active {
    background-color: #dddddd;
}

.expired {
    font-size: 28rpx;
    color: #ff0000;
}
</style>
