<template>
    <view class="container">
        <view class="book-info">
            <image class="book-cover" :src="bookObj.image"></image>
            <view class="book-detail">
                <view class="book-title">{{ bookObj.bookName }}</view>
                <view class="book-author">{{ bookObj.author }}</view>
                <view class="book-publisher">{{ bookObj.press }}</view>
                <view class="book-status">剩余{{bookObj.rest }}本，已借{{bookObj.borrowed }}本</view>
                <button class="borrow-btn" @tap="borrowBook">借阅</button>
            </view>
        </view>
        <view class="book-intro">
            <view class="intro-title">图书简介</view>
            <view class="intro-text" :style="isExpanded ? '' : 'max-height: 96rpx; overflow: hidden;'">{{ bookObj.introduction }}</view>
            <view @tap="toggleIntro" class="intro-toggle">{{ isExpanded ? '收起' : '更多' }}</view>
        </view>
        <view class="related-books">
            <view class="related-title">相关推荐</view>
            <image class="related-cover" :src="relaimage"></image>
            <view class="related-info">{{ relatitle }}</view>
			<!-- //<view>{{borrowedList.length}}</view> -->
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            isExpanded: false,
			bookObj:{},
			relaimage: '../../static/image/santi.jpg',
			relatitle: '《三体》'
        };
    },
    onLoad: function (options) {
        //onLoad函数参数options接收其他页面跳转进入这个页面传递的url参数
		const data = JSON.parse(decodeURIComponent(options.bookItem));
		this.bookObj= data;
		 console.log(data);
		
    },
    methods: {
        toggleIntro() {
            this.setData({
                isExpanded: !this.isExpanded
            });
        },
        borrowBook() {
			//获取当前时间
			const formatNumber = n => {
			     n = n.toString()
			     return n[1] ? n : '0' + n
			   }
			   const date = new Date();
			   const year = date.getFullYear();
			   const month = date.getMonth() + 1;
			   const day = date.getDate();
			   const hours = date.getHours();
			   const minutes = date.getMinutes();
			   const seconds = date.getSeconds();
			   const formattedTime = `${year}-${formatNumber(month)}-${formatNumber(day)} ${formatNumber(hours)}:${formatNumber(minutes)}:${formatNumber(seconds)}`;
            uni.showModal({
                title: '借阅申请',
                content: '是否申请借书？',
                success: (res) => {
					if(res.confirm){
					uni.request({
					  url: 'http://localhost:8001/history',
					  method : 'POST',
					  data: {
						bid:this.bookObj.bid,
					    bookName:this.bookObj.bookName,
						name:'李四',
						account:'lisi',
						uid:'3',
						day:'30',
						status:'2',
						image:this.bookObj.image,
						begin_time:formattedTime
						
					  },
					  header: {
					    'content-type': 'application/json'
					  },
					  success: function (res) {
					    console.log(res.data);
						
						uni.showToast({
							title: '借书成功',
							icon: 'success',
							duration: 2000
						});
					  },
					  fail: function (err) {
					    console.error(err)
					  }
					})
					}
                },
				
            });
        }
    }
};
</script>
<style>
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 30px;
    margin-top: 20rpx;
}

.book-info {
    display: flex;
    align-items: center;
}

.book-cover {
    width: 200rpx;
    height: 280rpx;
    margin-right: 80rpx;
}

.book-detail {
    display: flex;
    flex-direction: column;
    justify-content: center;
    height: 280rpx;
}

.book-title {
    font-size: 32rpx;
    font-weight: bold;
    margin-bottom: 10rpx;
}

.book-publisher,
.book-author,
.book-status {
    font-size: 24rpx;
    margin-bottom: 10rpx;
}

.borrow-btn {
    width: 140rpx;
    height: 56rpx;
    background-color: #4caf50;
    color: #fff;
    font-size: 24rpx;
    border-radius: 10rpx;
    cursor: pointer;
}

.book-intro {
    display: flex;
    flex-direction: column;
    margin-top: 40rpx;
    width: 700rpx;
}

.intro-title {
    font-size: 32rpx;
    font-weight: bold;
    margin-bottom: 20rpx;
}

.intro-text {
    font-size: 24rpx;
    line-height: 40rpx;
    text-align: justify;
    margin-bottom: 20rpx;
}

.intro-toggle {
    font-size: 24rpx;
    text-decoration: underline;
    cursor: pointer;
}

.related-books {
    display: flex;
    flex-direction: column;
    margin-top: 40rpx;
    width: 700rpx;
}

.related-title {
    font-size: 32rpx;
    font-weight: bold;
    margin-bottom: 20rpx;
}

.related-book {
    display: flex;
    align-items: center;
    margin-bottom: 20rpx;
}

.related-cover {
    width: 120rpx;
    height: 150rpx;
    margin-right: 30rpx;
}

.related-info {
    font-size: 24rpx;
}
</style>
