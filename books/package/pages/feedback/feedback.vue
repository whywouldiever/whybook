<template>
    <view class="feedback-container">
        <textarea class="feedback-input"  v-model="inputValue" placeholder="请输入您的意见和建议"></textarea>
        <button class="submit-btn" @tap="submitFeedback">提交</button>
    </view>
</template>

<script>
export default {
    data() {
        return {
			inputValue:''
		};
    },
    methods: {
        submitFeedback() {
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
			uni.request({
			  url: 'http://localhost:8001/problem',
			  method : 'POST',
			  data: {
				content:this.inputValue,
				uid:'3',
				page:'10',
				title:'三国演义',
				link:'15982707339',
				status:1,
				time:formattedTime
			  },
			  header: {
			    'content-type': 'application/json'
			  },
			  success: function (res) {
			    console.log(res.data);
				
				uni.showToast({
					title: '提交成功！',
					icon: 'success',
					duration: 2000
				});
			  },
			  fail: function (err) {
			    console.error(err)
			  }
			})

        }
    }
};
</script>
<style>
.feedback-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
.feedback-input {
    width: 600rpx;
    height: 300rpx;
    border: 1rpx solid #ccc;
    border-radius: 5rpx;
    padding: 20rpx;
    font-size: 28rpx;
    margin-bottom: 20rpx;
}
.submit-btn {
    width: 200rpx;
    height: 80rpx;
    line-height: 80rpx;
    text-align: center;
    background-color: #0086ff;
    color: #fff;
    border-radius: 40rpx;
}
</style>
