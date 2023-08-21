<template>
    <view class="container-about">
        <view class="top">
            <image class="icon" src="/static/image/book.png"></image>
            <view class="title">自动图书借阅</view>
        </view>
        <view class="bottom">
            <view class="text">
                在当今社会，互联网已经开始成为时代的主流，随着4G、5G等技术的蓬勃发展，人们的生活也越来越依赖网络技术。互联网移动服务也应运而生，它的出现快速的重新定义了人们获取信息和服务的方式，仅仅依靠手机就能跨越地区和日期，以最高效的方式帮助人们。与此同时图书馆作为移动服务技术主要的实践场所之一，也作为大学必不可少的存在，每天都有大量学生前来借阅图书以及进行自习，为了帮助学生和管理员提高效率，降低学生因为图书借阅和座位占座而产生矛盾，于是将互联网移动服务和图书馆相结合制作了基于微信小程序的图书馆管理系统。
            </view>
        </view>
        <view class="support">
            <text class="support-text">自助图书 © 技术支持</text>
        </view>
    </view>
</template>

<script>
// pages/about/about.js
export default {
    data() {
        return {};
    }
    /**
     * 生命周期函数--监听页面加载
     */,
    onLoad(options) {},
    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady() {},
    /**
     * 生命周期函数--监听页面显示
     */
    onShow() {},
    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide() {},
    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload() {},
    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh() {},
    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom() {},
    /**
     * 用户点击右上角分享
     */
    onShareAppMessage() {},
    methods: {}
};
</script>
<style>
.container-about {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100%;
    width: 100%;
    background-color: #f8f8f8;
}

.top {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin: 60rpx;
}

.icon {
    width: 120rpx;
    height: 120rpx;
}

.title {
    font-size: 36rpx;
    font-weight: bold;
    margin-top: 24rpx;
}

.bottom {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.text {
    font-size: 14px;
    font-family: '黑体';
    color: #333333;
    text-align: left;
    margin: 10rpx;
    text-indent: 2em;
}

.support {
    position: fixed;
    bottom: 16rpx;
}

.support-text {
    font-size: 24rpx;
    color: #999999;
}
</style>
