<template>
    <view style="height: 100%">
        <view class="container1">
            <!-- 图书搜索 -->
            <view class="search-bar">
                <input type="text" v-model="keyword" placeholder="请输入书名、作者名" @input="onInput" />
                <image @tap="scanCode" class="imag" src="/static/image/scan.png"></image>
            </view>
			<view class="content">
			
			<view style="height: 100%">
			    <!-- tabBar部分 -->
			    <view class="tabBar">
			        <view :class="'tabItem ' + (selectedTab == 0 ? 'active' : '')" data-tab="0" @tap="handleChangeTab">全部</view>
			        <view :class="'tabItem ' + (selectedTab == 1 ? 'active' : '')" data-tab="1" @tap="handleChangeTab">文学</view>
			        <view :class="'tabItem ' + (selectedTab == 2 ? 'active' : '')" data-tab="2" @tap="handleChangeTab">小说</view>
					<view :class="'tabItem ' + (selectedTab == 3 ? 'active' : '')" data-tab="3" @tap="handleChangeTab">编程</view>
					<view :class="'tabItem ' + (selectedTab == 4 ? 'active' : '')" data-tab="4" @tap="handleChangeTab">玄幻</view>
			    </view>
			    <!-- scrollView部分 -->
			    <scroll-view class="scrollView" :scroll-x="true" :scroll-left="scrollLeft" @scroll="handleScroll">
					<!-- 第一个view，展示全部图书 -->
					<view class="scrollItem">
						<view class="right" id="bg">
						    <block v-for="(item, index) in bookList" :key="item.bid">
						        <view class="container_small" @tap="tiaozhuan(item)" :data-bid="item.bid">
						            <image :src="item.image" class="image"></image>
						            <view class="text">{{ item.bookName }}</view>
						            <view id="author">{{ item.author }}</view>
						        </view>
						    </block>
						</view>
					</view>
					<!-- 第二个view，展示历史类图书 -->
					<view class="scrollItem">
						<view class="right" id="bg">
						    <block v-for="(item, index) in bookList" :key="item.bid" v-if="item.tid==1">
						        <view class="container_small" @tap="tiaozhuan(item)" :data-bid="item.bid">
						            <image :src="item.image" class="image"></image>
						            <view class="text">{{ item.bookName }}</view>
						            <view id="author">{{ item.author }}</view>
						        </view>
						    </block>
						</view>
					</view>
					<!-- 第三个view，展示文学类图书 -->
					<view class="scrollItem">
						<view class="right" id="bg">
						    <block v-for="(item, index) in bookList" :key="item.bid" v-if="item.tid==2">
						        <view class="container_small" @tap="tiaozhuan(item)" :data-bid="item.bid">
						            <image :src="item.image" class="image"></image>
						            <view class="text">{{ item.bookName }}</view>
						            <view id="author">{{ item.author }}</view>
						        </view>
						    </block>
						</view>
					</view>
					<!-- 第四个view，展示编程类图书 -->
					<view class="scrollItem">
						<view class="right" id="bg">
						    <block v-for="(item, index) in bookList" :key="item.bid" v-if="item.tid==3">
						        <view class="container_small" @tap="tiaozhuan(item)" :data-bid="item.bid">
						            <image :src="item.image" class="image"></image>
						            <view class="text">{{ item.bookName }}</view>
						            <view id="author">{{ item.author }}</view>
						        </view>
						    </block>
						</view>
					</view>
			       <!-- 第五个view，展示玄幻小说图书 -->
			       <view class="scrollItem">
			       	<view class="right" id="bg">
			       	    <block v-for="(item, index) in bookList" :key="item.bid" v-if="item.tid==4">
			       	        <view class="container_small" @tap="tiaozhuan(item)" :data-bid="item.bid">
			       	            <image :src="item.image" class="image"></image>
			       	            <view class="text">{{ item.bookName }}</view>
			       	            <view id="author">{{ item.author }}</view>
			       	        </view>
			       	    </block>
			       	</view>
			       </view>
			    </scroll-view>
			</view>
			</view>
        </view>
    </view>
</template>
<script>
	const app = getApp()
	export default {
	    data() {
	        return {
				keyword:'',//搜索关键字
				navIndex:0,//下标
				bookList:null,//图书列表
				Object:{},
				// 控制scrollView的滚动偏移量
				scrollLeft: 0,
				// 当前选中的tab
				selectedTab: 0
	        };
	    },
	    onLoad() {
				this.getBooksDate();
	    },
	    onPullDownRefresh() {
	        if (getCurrentPages().length != 0) {
	            getCurrentPages()[getCurrentPages().length - 1].onLoad();
	        }
	        setTimeout(function () {
	            uni.stopPullDownRefresh();
	        }, 300);
	    },
	    // 页面上拉触底事件
	    onReachBottom: function () {
	        console.log('下拉到底部加载更多');
	    },
		//计算方法
		computed:{
			cateObj(){
				console.log(this.bookList[this.navIndex]);
				return this.bookList[this.navIndex]
			}
		},
	    methods: {
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
			// tab切换事件
			handleChangeTab(e) {
			    const tabIndex = e.currentTarget.dataset.tab;
			    const scrollLeft = tabIndex * uni.getSystemInfoSync().windowWidth;
			    this.setData({
			        selectedTab: tabIndex,
			        scrollLeft
			    });
			},
			// scrollView滚动事件
			handleScroll(e) {
			    const currentScrollLeft = e.detail.scrollLeft;
			    const scrollViewWidth = uni.getSystemInfoSync().windowWidth;
			    const selectedTab = Math.round(currentScrollLeft / scrollViewWidth);
			    if (selectedTab !== this.selectedTab) {
			        this.setData({
			            selectedTab,
			            scrollLeft: selectedTab * scrollViewWidth
			        });
			    }
			},
			// 搜索框处理函数
			onInput() {
				const that = this;
				const keyword = this.keyword.trim(); //搜索关键字
					wx.request({
				      url: 'http://localhost:8001/books/search', //本地服务器地址
				      data: { //data中的参数值就是传递给后台的数据
				        keyword : this.keyword
				      },
				      method: 'GET',
				      header: {
				        'content-type': 'application/json' //默认值
				      },
				      success: function(res) { //res就是接收后台返回的数据
						 that.setData({
						 	bookList:res.data.list
						 })
				      },
				      fail: function(res) {
				        console.log("暂时没有你要搜索的图书");
				      }
				    })
			},
			//点击扫一扫图标
	        scanCode: function (event) {
	            this.setData({
	                a: this.bookList[event.currentTarget.dataset.bid - 1]
	            });
	            uni.scanCode({
	                success: (res) => {
	                   wx.navigateTo({
	                       url:'../pages/bookinformation/bookinformation?bookItem='+encodeURIComponent(JSON.stringify(bookItem))
	                   });
	                }
	            });
	        },
			//点击进入图书详情页
	        tiaozhuan(bookItem) {
	            wx.navigateTo({
	                url:'../../pages/bookinformation/bookinformation?bookItem='+encodeURIComponent(JSON.stringify(bookItem))
	            });
	        },
	    }
	};
</script>
<style>
/* 轮播图样式 */
.swiper-container {
    height: 200px;
}
.item {
    height: 100%;
    width: 100%;
    line-height: 150px;
    text-align: center;
}
.itemImage {
    width: 100%;
    display: flex;
}
swiper-item:nth-child(1) .item {
    background-color: springgreen;
}
swiper-item:nth-child(2) .item {
    background-color: steelblue;
}
swiper-item:nth-child(3) .item {
    background-color: tomato;
}
.tabBar {
    display: flex;
    justify-content: space-around;
    align-items: center;
    height: 100rpx;
    background-color: #ffffff;
    border-bottom: 1rpx solid #f5f5f5;
}
.tabItem {
    font-size: 28rpx;
    color: #333333;
}
.scrollView {
    width: 100vw;
    white-space: nowrap;
    overflow: hidden;
}
.scrollItem {
    display: inline-block;
    width: 100vw;
}
.scrollItem-A {
    background-color: #f2f2f2;
}
.scrollItem-B {
    background-color: #d9d9d9;
}
.scrollItem-C {
    background-color: #bfbfbf;
}
/* 图片样式 */
input {
    border: 1px solid #eee;
    padding: 5px;
    margin: 5px;
    width: 80%;
    border-radius: 10px;
}
.search-bar {
    display: flex;
    justify-content: space-between;
    text-align: left;
	background-color: #ffffff;
	position: sticky;
	top: 0;
	z-index: 999;
}
.imag {
    width: 34px;
    height: 34px;
    margin-top: 5px;
    margin-right: 12px;
}

.tab-item {
    font-size: 28rpx;
    color: #333333;
    padding: 0 24rpx;
    line-height: 90rpx;
    text-align: center;
}

.active {
    color: #0086ff;
    border-bottom: 1rpx solid #0086ff;
}

#bg {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    text-align: center;
}
.container_small {
    display: inline-block;
    width: 140px;
    height: 220px;
    margin: 10px 20px 30px 15px;
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
    font-size: 14px;
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
    margin-bottom: 40px;
}
</style>
