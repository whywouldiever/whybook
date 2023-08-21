<template>
	<view class="container-records">
		<view class="items" v-for="(item,index) in historyList" :key="item.hid">
			<view class="bookinfo">
				<!-- 在图片的右上角放置一个删除图标 -->
				<view>
					<image class="delete-icon" @click="deleteImage(item.hid)" src="../../../static/image/delete.png"></image>
					<image class="cover" :src="item.image"></image>
				</view>

				<view class="name">{{ item.bookName }}</view>
			</view>

			<view class="records">
				<view class="time">
					<view class="txt">借阅时间：</view>
					<view class="val">{{item.begin_time}}</view>
				</view>
				<view class="time">
					<view class="txt">已借：</view>
					<view>{{ item.day }}天</view>
					<view class="btn" v-if="item.day > 3" @tap="renew">续借</view>
					<view class="expired" v-if="item.day <= 0">已逾期</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				historyList: null,
				bookList: null,
				showDelete: false, // 是否显示删除按钮
				currentUrl: "", // 当前图片的 URL
			};
		}

		/**
		 * 生命周期函数--监听页面加载
		 */
		,
		onLoad() {
			this.getHistoryDate();
		},

		methods: {
			
			//获取历史数据
			async getHistoryDate() {
				const that = this;
				wx.request({
					url: 'http://localhost:8001/history/allhistory', //本地服务器地址
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
							historyList: historyList
						})
					},
					fail: function(res) {
						console.log("失败");
					}
				})
			},
			// 删除图片
			deleteImage: function(hid) {
				console.log("hid="+hid);
				uni.showModal({
					title: '删除记录',
					content: '是否删除记录？',
					success:(res) => {
						if(res.confirm){
						uni.request({
							url: 'http://localhost:8001/history/historyid?hid='+hid,
							method: 'GET',
							success: (res) =>  	{
								console.log("删除成功");
								//this.againgetHistoryDate();
								uni.showToast({
									title: '删除成功',
									icon: 'success',
									duration: 2000,
								});
								wx.navigateTo({
									url:'/pages/booklist/booklist'
								})
							},
							fail: (res) => {
								console.log("删除失败");
							},
						});
						}
					},
					fail(res) {
						console.log("取消");
					}

				});
			},
			/**
			 * 续借
			 */
			renew: function() {
				
				uni.showModal({
					title: '续借申请',
					content: '是否申请续借？',
					success: (res) => {
						if(res.confirm){
						uni.showToast({
							title: '已提交给管理员',
							icon: 'success',
							duration: 2000
						});
					}
					}
				});
			}
		}
	};
</script>
<style>
	.container-records {
		padding: 10rpx 40rpx;
		margin: 10rpx;

	}

	.items {
		display: flex;
		height: 340rpx;
		margin-bottom: 40rpx;
		border: 1rpx solid #ccc;
	}

	.bookinfo {
		position: relative;
		margin-top: 10px;
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
	.delete-icon {
		width: 40rpx;
		height: 40rpx;
		position: absolute;
		right: 60rpx;
		left: 290px;
		z-index: 2;
	}

	.records {
		width: 600rpx;
		height: 180rpx;
		margin-top: 100rpx;
		margin-left: 40rpx;
	}

	.time {
		display: flex;
		align-items: center;
		margin-top: 30rpx;
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
		align-items: flex-end;
		margin-left: auto;
		margin-right: 10rpx;
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