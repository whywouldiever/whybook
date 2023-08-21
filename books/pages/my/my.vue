<template>
    <view style="height: 100%">
        <view class="login">
            <button class="login_btn" v-if="!userInfo" type="primary" @tap="login">授权登录</button>
            <view v-else class="root">
                <navigator hover-class="none" url="/package/pages/personal/personal" open-type="navigate">
                    <image class="touxiang" :src="userInfo.avatarUrl"></image>
                </navigator>
                <text class="name">{{ userInfo.nickName }}</text>
                <button class="loginout" @tap="loginOut" size="mini">退出登录</button>
            </view>
        </view>

        <!-- 未登录不显示 -->
        <view v-if="userInfo">
            <navigator url="/package/pages/borrowed-books/borrowed-books">
                <view class="item">
                    <image class="imag" src="/static/image/book.png"></image>
                    <text>在借图书</text>
                    <view class="right_arrow"></view>
                </view>
            </navigator>
            <navigator url="/package/pages/borrowedbook-records/borrowedbook-records">
                <view class="item">
                    <image class="imag" src="/static/image/notes.png"></image>
                    <text>借书记录</text>
                    <view class="right_arrow"></view>
                </view>
            </navigator>
            <navigator url="/package/pages/returnedbook-records/returnedbook-records">
                <view class="item">
                    <image class="imag" src="/static/image/notes_return.png"></image>
                    <text>还书记录</text>
                    <view class="right_arrow"></view>
                </view>
            </navigator>
            <navigator url="/package/pages/ranking-list/ranking-list">
                <view class="item">
                    <image class="imag" src="/static/image/rank.png"></image>
                    <text>排行榜</text>
                    <view class="right_arrow"></view>
                </view>
            </navigator>
        </view>
        <view class="about">
            <navigator url="/package/pages/about/about">
                <view class="item">
                    <!-- iocn图标 -->
                    <image class="imag" src="/static/image/about.png"></image>
                    <text>关于我们</text>
                    <view class="right_arrow"></view>
                </view>
            </navigator>
            <navigator url="/package/pages/feedback/feedback">
                <view class="item">
                    <image class="imag" src="/static/image/feedback.png"></image>
                    <text>反馈建议</text>
                    <view class="right_arrow"></view>
                </view>
            </navigator>
        </view>
    </view>
</template>

<script>
// pages/my/my.js
export default {
    data() {
        return {
            userInfo: {
                avatarUrl: '',
                nickName: ''
            }
        };
    },
    onLoad() {
        let user = uni.getStorageSync('user');
        console.log('进入小程序的my界面', user);
        this.setData({
            userInfo: user
        });
    },
    methods: {
        login() {
            uni.getUserProfile({
                desc: '完善用户信息',
                success: (res) => {
                    let user = res.userInfo;
                    //缓存用户信息到本地
                    uni.setStorageSync('user', user);
                    console.log('授权成功', user);
                    this.setData({
                        userInfo: user
                    });
                },
                fail: (res) => {
                    console.log('授权失败', res);
                }
            });
        },
        //退出登录
        loginOut() {
            this.setData({
                userInfo: ''
            });
            uni.setStorageSync('user', null);
        }
    }
};
</script>
<style>
/* pages/my/my.wxss */
.login {
    height: 180px;
}
.login_btn {
    margin-top: 60px;
}
.loginout {
    margin-top: 10px;
    margin-bottom: 20px;
    font-size: 12px;
    text-align: center;
    display: inline;
    color: black;
    background-color: pink;
}
.root {
    width: 100%;
    height: 300px;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.touxiang {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin-top: 20px;
    margin-bottom: 10px;
}
.right_arrow {
    border: solid black;
    border-width: 0 2px 2px 0;
    padding: 2px;
    position: absolute;
    right: 15px;
    transform: rotate(-45deg);
    -webkit-transform: rotate(-45deg);
}
.item {
    display: flex;
    padding: 15px;
    background: white;
    align-items: center;
    border-bottom: 1px solid gainsboro;
}
.imag {
    width: 16px;
    height: 16px;
    margin-right: 9px;
}
.button {
    width: 100%;
    background: white;
    border: none;
    text-align: left;
    padding: 0px;
    margin: 0px;
    line-height: 1.3;
    font-size: 16px;
}
.button::after {
    border: none;
    border-radius: 0;
}
</style>
