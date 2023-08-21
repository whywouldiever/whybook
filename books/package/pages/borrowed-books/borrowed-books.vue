<template>
	    <view id="bg">
        <block v-for="item in historyList"  :key="item.hid">
            <view class="container_small" @tap="tiaozhuan(item)" :data-bid="item.hid">
                <image :src="item.image" class="image"></image>
                <view class="text">{{ item.bookName }}</view>
                <view id="author">{{ item.author }}</view>
            </view>
        </block>
    </view>

</template>

<script>
const app = getApp();
export default {
    data() {
        return {
			navIndex:0,
			bookList:null,
			historyList:null,
        };
    },
    onLoad: function () {
		this.getHistoryDate();
		setTimeout(function () {
			console.log('start pulldown');
		}, 400);
		uni.startPullDownRefresh();
    },
		computed:{
			cateObj(){
				console.log(this.historyList[this.navIndex]);
				return this.historyList[this.navIndex]
			}
		},
    methods: {
		//下拉刷新
		onPullDownRefresh() {
			console.log('refresh');
			setTimeout(function () {
				uni.stopPullDownRefresh();
			}, 400);
		},
		changeIndex(index){
			this.navIndex=index;
		},
		//获取图书数据
		async getBooksDate(){
			    const that = this;
			    wx.request({
			      url: 'http://localhost:8001/books', //本地服务器地址
			      data: { //data中的参数值就是传递给后台的数据
			        transInfo: '小程序端给后台的数据'
			      },
			      method: 'GET',
			      header: {
			        'content-type': 'application/json' //默认值
			      },
			      success: function(res) { //res就是接收后台返回的数据
			        console.log(res);
					  const bookList = res.data.bookList;
					  console.log(bookList);
					  that.setData({
						bookList:bookList
					  })
					
			      },
			      fail: function(res) {
			        console.log("失败");
			      }
			    })
		
		},	
		//获取历史数据
		async getHistoryDate(){
			    const that = this;
			    wx.request({
			      url: 'http://localhost:8001/history/allborrowed', //本地服务器地址
			      data: { //data中的参数值就是传递给后台的数据
			        transInfo: '小程序端给后台的数据'
			      },
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
	        tiaozhuan(bookItem) {
				console.log(bookItem)
	            wx.navigateTo({
	                url:'/package/pages/bookinformation1/bookinformation1?bookItem='+encodeURIComponent(JSON.stringify(bookItem))
	            });
	        },


    }
};
</script>
<style>
#bg {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    text-align: center;
}
.container_small {
    display: inline-block;
    width: 150px;
    height: 240px;
    margin: 15px;
    border-radius: 5px;
    background-color: white;
}
.image {
    width: 140px;
    height: 200px;
    border: 1px solid gray;
    border-radius: 5px;
    border-style: solid;
}
.text {
    font-size: 18px;
    font-family: '仿宋';
    display: -webkit-box;
    overflow: hidden;
    text-overflow: ellipsis;
    word-wrap: break-word;
    white-space: normal !important;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    font-weight: bold;
}
#author {
    display: inline-block;
    font-size: 14px;
    color: #666;
}
</style>
