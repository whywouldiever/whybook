<template>
    <view class="container">
        <view class="table-header">
            <view class="table-header-item table-header-title">图书名称</view>
            <view class="table-header-item table-header-publisher">出版社</view>
            <view class="table-header-item table-header-isbn">作者</view>
            <view class="table-header-item table-header-borrowed">已借</view>
            <view class="table-header-item table-header-balance">待借</view>
        </view>
        <view v-for="(item, index) in bookList" :key="index">
            <view class="table-row">
                <view class="table-item table-title">{{ item.bookName }}</view>
                <view class="table-item table-publisher">{{ item.press }}</view>
                <view class="table-item table-isbn">{{ item.author }}</view>
                <view class="table-item table-borrowed">{{ item.borrowed }}</view>
                <view class="table-item table-balance">{{ item.rest-item.borrowed }}</view>
            </view>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            bookList: null,// 图书列表
        };
    },
    onLoad() {
		this.getBooksDate();
    },
    methods: {
		//获取图书数据
		async getBooksDate(){
			    const that = this;
			    wx.request({
			      url: 'http://localhost:8001/books', //本地服务器地址
			      method: 'GET',
			      header: {
			        'content-type': 'application/json' //默认值
			      },
			      success: function(res) { //res就是接收后台返回的数据
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
		}
    }
};
</script>
<style>
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 30px 0;
}

.table-header {
    display: flex;
    justify-content: space-between;
    width: 100%;
    background-color: #0086ff;
    color: #ffffff;
    font-size: 28rpx;
    padding: 20rpx;
    border-radius: 10rpx;
}

.table-header-item {
    flex: 1;
    text-align: center;
}

.table-header-title {
    flex: 1;
    text-align: center;
}

.table-header-borrowed {
    flex: 0.5;
    text-align: center;
}
.table-header-returned {
    flex: 0.5;
    text-align: center;
}
.table-header-balance {
    flex: 0.5;
    text-align: center;
}
.table-row {
    display: flex;
    justify-content: space-between;
    width: 350px;
    padding: 20rpx 0;
    border-bottom: 1rpx solid #cccccc;
}
.table-title {
    font-size: 12px;
}
.table-item {
    flex: 1;
    text-align: center;
}
.table-publisher {
    font-size: 12px;
}
.table-isbn {
    flex: 1;
    font-size: 12px;
    text-align: center;
}
.table-borrowed {
    flex: 0.5;
    font-size: 12px;
    text-align: center;
}
.table-returned {
    flex: 0.5;
    font-size: 12px;
    text-align: center;
}
.table-balance {
    flex: 0.5;
    font-size: 12px;
    text-align: center;
}
.table-title {
    flex: 1;
    text-align: left;
}
</style>
