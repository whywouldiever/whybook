<template>
    <view class="container">
        <view class="avatar info">
            <view class="item">
                <view class="label">头像</view>
                <view class="value touxiang" @tap="changeavatar"><open-data type="userAvatarUrl"></open-data></view>
            </view>
            <view class="item">
                <view class="label">昵称</view>
                <view class="value"><open-data type="userNickName" lang="zh_CN"></open-data></view>
            </view>
        </view>
        <view class="info">
            <view class="item" @tap="modifyGender">
                <view class="label">性别</view>
                <view class="value">{{ genderText }}</view>
            </view>
            <picker mode="date" :value="birthday" start="1900-01-01" :end="today" @change="changeBirthday">
                <view class="item">
                    <view class="label">生日</view>
                    <view class="value">{{ birthday }}</view>
                </view>
            </picker>
                <view class="item" @tap="searchSchool">
                    <view class="label">大学</view>
                    <view class="value">{{ university }}</view>
                </view>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            avatarUrl: '',
            nickName: '',
            gender: 1,

            // 0-未知，1-男，2-女
            genderText: '男',

            birthday: '',
            university: '',
            today: '',
            collections: '',
            signature: '',
            bgPic: '',
            userInfo: ''
        };
    },
	onLoad(options) {
		this.university=JSON.parse(options.university)
		console.log(university)
	},
    onShow: function () {
        this.setData({
            avatarUrl: getApp().globalData.userInfo.avatarUrl,
            nickName: getApp().globalData.userInfo.nickName,
            gender: getApp().globalData.userInfo.gender || 1,
            genderText: getApp().globalData.userInfo.gender == 1 ? '男' : '女',
            birthday: getApp().globalData.userInfo.birthday || '',
            collections: getApp().globalData.collections || [],
            signature: getApp().globalData.signature || ''
        });
        var date = new Date();
        this.setData({
            today: date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate()
        });
    },
    methods: {
        getAvatar() {
            if (app.globalData.userInfo) {
                console.log('获取成功');
                this.setData({
                    bgPic: app.globalData.userInfo.avatarUrl
                });
                this.assignPicChoosed();
            } else {
                // 在没有 open-type=getUserInfo 版本的兼容处理
                uni.getUserInfo({
                    success: (res) => {
                        app.globalData.userInfo = res.userInfo;
                        console.log('已获取');
                        this.setData({
                            userInfo: res.userInfo,
                            bgPic: res.userInfo.avatarUrl
                        });
                        this.assignPicChoosed();
                    }
                });
            }
        },

        changeavatar: function (e) {
            let that = this;
            uni.chooseMedia({
                count: 1,
                success(res) {
                    // tempFilePath可以作为img标签的src属性显示图片
                    // console.log(res.tempFilePaths)  打印选择的图片路径
                    var avatarUrl = 'userInfo.avatarUrl';
                    that.setData({
                        [avatarUrl]: res.tempFilePaths
                    });
                }
            });
        },

        modifyGender: function () {
            var that = this;
            uni.showActionSheet({
                itemList: ['男', '女'],
                success: function (res) {
                    that.setData({
                        gender: res.tapIndex + 1,
                        genderText: res.tapIndex == 0 ? '男' : '女'
                    });
                }
            });
        },

        changeBirthday: function (e) {
            this.setData({
                birthday: e.detail.value
            });
        },

        searchSchool() {
            wx.navigateTo({
				url:'../search/search'
			})
        }
    }
};
</script>
<style>
.container {
    margin-top: 20px;
    padding: 20px;
    display: flex;
    flex-direction: column;
}
.avatar {
    display: flex;
    align-items: center;
    margin-bottom: 30rpx;
    text-align: center;
}
.avatar open-data {
    border-radius: 10px;
    width: 80px;
    height: 80px;
    margin-right: 20rpx;
}
.info {
    width: 100%;
    display: flex;
    flex-direction: column;
    font-size: 28rpx;
}
.touxiang {
    width: 50px;
    height: 50px;
    border-radius: 10px;
}
.item {
    width: 100%;
    display: flex;
    justify-content: space-between;
    padding: 20rpx 0;
    border-bottom: 1rpx solid #f0f0f0;
}
.item:last-child {
    border-bottom: none;
}
.label {
    color: #999;
    display: flex;
    align-items: center;
    justify-content: center;
}
.value {
    color: #333;
    border-radius: 10px;
}
</style>
