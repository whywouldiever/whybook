<template>
    <view style="width: 100vw; height: 100vh; display: flex; justify-content: center; border: 1px solid #cccccc">
        <map
            :style="'width: 100%;height: 100%; position: ' + position + ';  border-radius: 20px;'"
            id="map"
            :latitude="latitude"
            :longitude="longitude"
            :polyline="polyline"
            :show-location="true"
            :markers="markers"
            :circles="circles"
            :enable-building="true"
            :enable-rotate="false"
            :enable-poi="true"
            :show-scale="true"
            skew="10"
            :enable-overlooking="true"
            @regionchange="regioncchangeMap"
            @markertap="markertap"
            @controltap="controlTap"
        ></map>
        <view class="search" @tap="getLocation">
            <text class="iconfont icon-dingwei" style="font-size: 25px"></text>
        </view>
        <view class="popup" v-if="popupShow">
            <view class="title">{{ name }}</view>
            <view class="address">{{ address }}</view>
            <view class="distance">距离 {{ distance }} 米</view>
            <view class="time">营业时间：{{ time }}</view>
            <button size="mini" class="btn" @tap="collect">进入书柜</button>
            <button size="mini" open-type="share" class="btn" @tap="handleShareTap">分享</button>
            <button size="mini" class="btn" @tap="showRoute">路线</button>
            <button size="mini" class="btn" @tap="navigate">导航</button>
            <button size="mini" class="btn" @tap="close">取消</button>
        </view>
        <view class="search-wrapper">
            <input class="search-input" type="text" placeholder="请输入位置" :value="keyword" @input="bindKeywordInput" confirm-type="search" @confirm="search" />
            <image @tap="search" class="search-btn" src="/static/image/search.png"></image>
        </view>
    </view>
</template>

<script>
// 获取应用实例
const app = getApp();
export default {
    data() {
        return {
            longitude: 104.677877,
            latitude: 28.812819,
            popupShow: false,

            // 弹框是否显示
            name: '西华大学宜宾校区图书馆',
            address: '四川省宜宾市翠屏区临港经济开发区大学城路三段1号西华大学宜宾校区',
            distance: '500',
            time: '暂无营业时间',
            collected: false,
            // 是否已经收藏
            markers: [],
            keyword: '',
            popupData: '',
            polyline: [],
            position: '',
            circles: []
        };
    }
    /**
     * 生命周期函数--监听页面加载
     */,
    onLoad: function () {
        let that = this;
        uni.getLocation({
            type: 'wgs84',
            success: function (res) {
                that.setData({
                    longitude: res.longitude,
                    latitude: res.latitude
                });
				this.data.markers=[{
					id: 0,
					longitude: res.longitude,
					latitude: res.latitude,
					iconPath: '/static/image/location.png',
					width: 20,
					height: 20
				}]
            },
            fail: function () {
                uni.showToast({
                    title: 'Failed to get location',
                    icon: 'none'
                });
            }
        });
    },
    methods: {
        getLocation: function () {
            var that = this;
            console.log('回到自己位置');
            uni.getLocation({
                type: 'wgs84',
                success: (res) => {
                    console.log(res.longitude);
                    console.log(res.latitude);
                    that.setData({
                        latitude: res.latitude,
                        longitude: res.longitude
                    });
                }
            });
        },

        markertap() {
            this.setData({
                popupShow: true
            });
        },
        regioncchangeMap() {
            console.log('视野发生变化');
        },
        draw() {
            console.log('花园');
            uni.getLocation({
                type: 'wgs84',
                success: function (res) {
                    return new Array({
                        latitude: res.latitude,
                        longitude: res.longitude,
                        radius: 200
                    });
                }
            });
        },
        search: function () {
            let that = this;
            uni.request({
                url:
                    'https://apis.map.qq.com/ws/place/v1/search?key=MS3BZ-5H2WM-VL26G-6UGDR-RENM7-F4FDD&boundary=nearby(' +
                    that.latitude +
                    ',' +
                    that.longitude +
                    ',1000)&keyword=' +
                    that.keyword +
                    '&page_size=20',
                success(res) {
                    let markers = [];
                    res.data.data.forEach((item) => {
                        markers.push({
                            latitude: item.location.lat,
                            longitude: item.location.lng,
                            iconPath: '/static/image/location.png',
                            width: 30,
                            height: 30,
                            callout: {
                                content: item.title,
                                color: '#333',
                                fontSize: 14,
                                borderRadius: 10,
                                bgColor: '#fff',
                                padding: 10,
                                display: 'ALWAYS',
                                textAlign: 'center'
                            },
                            data: item
                        });
                    });
                    that.setData({
                        markers: markers
                    });
                }
            });
        },
        // 绑定搜索框输入事件
        bindKeywordInput: function (e) {
            this.setData({
                keyword: e.detail.value
            });
        },
		    // 点击地图时触发的函数
		    markerTap: function (e) {
		      const latitude = e.detail.latitude;
		      const longitude = e.detail.longitude;
		      // 调用地图API根据坐标获得位置信息...
		      // 弹出信息提示
		      uni.showToast({
		        title: `您点击了 (${longitude}, ${latitude})`,
		        icon: "none",
		      });
		    },
        // 点击进入图书柜按钮触发事件
        collect: function () {
			wx.navigateTo({
				url:'../../package/library/library'
			})
        },
        // 点击分享按钮触发事件
        handleShareTap() {
            uni.showShareMenu({
                withShareTicket: true,
                success: function () {
                    console.log('showShareMenu success');
                    return {
                        title: '分享标题',
                        path: '/pages/share/share?latitude=' + this.latitude + '&longitude=' + this.longitude
                    };
                },
                fail: function () {
                    console.log('showShareMenu fail');
                }
            });
        },
        showRoute(e) {
            var _this = this;
            //通过wx.request发起HTTPS接口请求
            uni.request({
                //地图WebserviceAPI驾车路线规划接口 请求路径及参数（具体使用方法请参考开发文档）
                url:'https://apis.map.qq.com/ws/direction/v1/driving/?key=MS3BZ-5H2WM-VL26G-6UGDR-RENM7-F4FDD&from=28.812803,104.677864&to=28.813105,104.681446',
                success(res) {
                    var result = res.data.result;
                    var route = result.routes[0];
                    var coors = route.polyline;
                    var pl = []; //坐标解压（返回的点串坐标，通过前向差分进行压缩）
                    var kr = 1000000;
                    for (var i = 2; i < coors.length; i++) {
                        coors[i] = Number(coors[i - 2]) + Number(coors[i]) / kr;
                    }
                    //将解压后的坐标放入点串数组pl中
                    for (var i = 0; i < coors.length; i += 2) {
                        pl.push({
                            latitude: coors[i],
                            longitude: coors[i + 1]
                        });
                    }
                    _this.setData({
                        // 将路线的起点设置为地图中心点
                        latitude: pl[0].latitude,
                        longitude: pl[0].longitude,
                        // 绘制路线
                        polyline: [
                            {
                                points: pl,
                                color: '#58c16c',
                                width: 6,
                                borderColor: '#2f693c',
                                borderWidth: 1
                            }
                        ]
                    });
                }
            });
        },
        // 点击导航按钮触发事件
        navigate: function () {
            uni.showActionSheet({
                itemList: ['打开高德地图', '打开百度地图'],
                success: (res) => {
                    if (res.tapIndex === 0) {
                        uni.openLocation({
                            latitude: this.latitude,
                            longitude: this.longitude,
                            name: '我的位置',
                            scale: 15
                        });
                    } else if (res.tapIndex === 1) {
                        uni.showModal({
                            title: '提示',
                            content: '是否下载并打开百度地图APP？',
                            success: (res) => {
                                if (res.confirm) {
                                    uni.navigateTo({
                                        url: 'https://www.baidu.com'
                                    });
                                }
                            }
                        });
                    }
                }
            });
        },
        // 点击取消按钮触发事件
        close: function () {
            this.setData({
                popupShow: false,
				markers:null
            });
        }
    }
};
</script>
<style>
/* pages/index1/index1.wxss */
@font-face {
    font-family: 'iconfont';
    src: url('data:font/woff2;charset=utf-8;base64,d09GMgABAAAAAAMwAA4AAAAAB1wAAALXAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP0ZGVE0cGh4GYACCQggEEQgKgjSCMgsKAAE2AiQDEAQgBYUCBzIbVwbIngV2kxuMh7cuclZtxuMg4+H7ub7OfXnpziRDAPbbAQaL0N8NUHlaZL9sGRWQm3Vk1Nr2MO0k0fQWGZpYaS+iJD6SoARKp1IKiRr4759YWWb//73jPyv7ItcbLq/bor3wnzBa0wKZQAl+a20a6/gE6WRhFnPGDc7b5QQhWWsh4PMnplTw05IXb/y5CXpiMEhCoRAyEnIp7ihJV9N7uA1eH3+YHxVJWeCT1hw6SPj83Ad7IJ3/OxTf6SAAMBZBgQIjEdClKjBSzViQZcHPfRa/O+yhAKJFACIhgX8cAVzM+HQF8X8JZFChhU3gDICM2Sog5zxzQPRuyl55U1PW5+svgPKm6H7u2jN8ZttQC8qdZ5vm888/30i8/nzEl5BtcwMR79CBa52QaI1d//zzDrPXbXXn7fevf/hu9zsfXHvvLeOf6/vcX+NW3qM4+vq8vXJtWa5d2ZzQe8HIBb0nKMRALO7mSlzrI9zLdcxEaqKwbu1dB53u3MyU8iLpokOCY1latCTNDs988Sl/Hc+kp2u7M2H4owsfHS0UJ5sAeDXM6Xqtnf0131b5naYoEnGiC7oUa7fiH4yJTyYIzh5o7ts97Pq7arLOMd8U8rBiFqgkEDTo+I4SPqXcP4ZcMh4oUfJQIFulBhJqNf43G0B/PwEYYI2AUFmFgKTtMAIKlW4BsspdAUqN1wVoqXwrQG1GdCGgMSDuKETugcmgQ+hrC0lvm6HQl0tl7gGlwd7Q0tcXapv8uzUmxxE7ARkvEpUkY4Kcpk7kcih1ERzT43CJw3kNhDA5D8U6MlXMwgvgN7Zqg1cPaW4iC4T03DEWhYF1XPvzZs+NSi3u7JAFddwklFBxIhHFmCLgso0dk5CUWSyuMY/7MwaZKELBFUDi8VMqd+KEsvLD+664/DL+DPw+OCIS8WzQaErKQYqYpxnLciwzzuBwZDMNnG2o4RIZIUVqj+OBVNYBAAAA')
            format('woff2'),
        url('data:font/woff;charset=utf-8;base64,d09GRgABAAAAAAUQAA4AAAAAB1wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABGRlRNAAAE9AAAABoAAAAcljWB/0dERUYAAATUAAAAHgAAAB4AKQAKT1MvMgAAAbQAAABGAAAAYDxESd5jbWFwAAACDAAAAD4AAAFCAA/pumN2dCAAAAJMAAAABAAAAAQAIgKIZ2FzcAAABMwAAAAIAAAACP//AANnbHlmAAACXAAAAQcAAAE0I+8qNmhlYWQAAAFEAAAALwAAADYj6p8gaGhlYQAAAXQAAAAdAAAAJAf3BIVobXR4AAAB/AAAABAAAAAQDwABFmxvY2EAAAJQAAAACgAAAAoAxABUbWF4cAAAAZQAAAAfAAAAIAESAIhuYW1lAAADZAAAAUYAAAKCXoIBAnBvc3QAAASsAAAAIAAAADLP6m7eeNpjYGRgYADizhRmvXh+m68M3CwMIPDAY201nFZiYGCRZNYFcjkYmECiAO4RB+gAeNpjYGRgYG7438AQw8oAAiySDIwMqIAFAEj/AocAAAB42mNgZGBgYGHwA2IQYAJiLiBkYPjPoAcSAAARlgGbAHjaY2BhZWCcwMDKwMDUyXSGgYGhH0IzvmYwYuQAijKwMjNgBQFprikMB57xP+NnbvjfwMDAfIcBSDIwIilRYGAEAGaCDJ4AAAUAACIAAAAABQAAAAUAAPR42mNgYGBmgGAZBkYGELAB8hjBfBYGBSDNAoRA/jP+//8hpOQXqEoGRjYGGJOBkQlIMDGgAkaGYQ8ATLYHrwAAACICiAAAACoAKgAqAJoAAHjaZc2/SsNQFAbwc87NPxwuBm4rgga8N7RDMcJNrENinDQRsUMLPoKvYNtJWtz1Nbolu2/QzdVXaCfBRYu5xUFwORx+fN85QCABUNMCGLgQVQgnWe1asNKVY79nNaNmhYoZtg3XroNfWY3GY//I78a+kri7Xi5p8X0n6R7Agg/wrH12DD3I4QJumw8qou5p0pHOIXJylXREO8WA9lqirfvnmNNZrPtJB2UPm6QBHaDgyJQIUOeYRCg5tthn6A3nA3EgBvOhp7gQXP2BsIHNE5FVjK8QryfP07IY3zzK9DKV24Gv/3uz0bbHQ280M7B5w+KhsO3mRjl9mZS4o37bMlUA8ANOmz1HAHjafZDNSsNAFIXP9E9tQcSC61kVQUh/lqW7Qt25cFHXbTpJW5JMmEwLXbp15QO49TF8AJ9BcOWDeBqvCBWakMs3595zZiYALvEJhZ+njWthhVPcCVdwgli4Sv1RuEZ+Ea6jhTfhBvUP4SZu1Ei4hbZ6ZoKqnXHVKdP2rHCBkXAF53gQrlK3wjXyk3AdV3gVblB/F25iii/hFjpqiTEcDGbwrAtozLFjXSFkboaorB4YOzPzZqHnO70KbRbZjOK/qb/WPeNibJAw2nFp4k0yc0ctR1pTpjkUHNm3NPoI0KNsXLGyme4HvaP2W9qzMuLwngW2POaAqqdR83O0p6SJxBheISFr5GVvTSWkHjDWZMb9/pViGw+8j3TkbKon3NYkidW5s2sTeg4vyz1yDNHlGx2kB+XhU455nw+73UgCgtCm+AYPanCHAAB42mNgYoAALjDJyIAOWMCiTIxM7CmZeenlqZkADpgDBgAAAAH//wACAAEAAAAMAAAAFgAAAAIAAQADAAMAAQAEAAAAAgAAAAB42mNgYGBkAIKrS9Q5QPQDj7XVMBoAPyUGSgAA')
            format('woff');
    font-weight: normal;
    font-style: normal;
    font-display: swap;
}

.iconfont {
    font-family: 'iconfont' !important;
    font-size: 16px;
    font-style: normal;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.icon-dingwei:before {
    content: '\e60f';
}

.search {
    position: absolute;
    right: 20px;
    bottom: 50px;
    width: 30px;
    height: 30px;
    background-color: #ffffff;
    border-radius: 50%;
    border: 1px solid #cccccc;
    display: flex;
    justify-content: center;
    align-items: center;
}
.map-wrapper {
    width: 100%;
    height: 100%;
    position: relative;
}

.popup {
    position: absolute;
    bottom: 0;
    width: 100%;
    background-color: #fff;
    padding: 16rpx;
    box-sizing: border-box;
}

.title {
    font-size: 32rpx;
    color: #333;
    font-weight: bold;
    margin-bottom: 8rpx;
}

.address {
    font-size: 28rpx;
    color: #666;
    margin-bottom: 8rpx;
}

.distance {
    font-size: 28rpx;
    color: #999;
    margin-bottom: 16rpx;
}
.time {
    font-size: 28rpx;
    color: #999;
    margin-bottom: 16rpx;
}

.search-wrapper {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    background-color: #fff;
    padding: 12rpx 16rpx;
    z-index: 1;
    box-sizing: border-box;
    display: flex;
    align-items: center;
}

.search-input {
    border: 1rpx solid #ccc;
    border-radius: 6rpx;
    font-size: 30rpx;
    padding: 10rpx;
    flex: 1;
    margin-right: 16rpx;
}

.search-btn {
    background-color: #fff;
    border: none;
    height: 30px;
}

.search-btn {
    width: 34px;
    height: 34px;
    margin-top: 5px;
    margin-right: 12px;
}
.btn {
    flex: auto;
    display: flex;
    border: none;
    background-color: #0086ff;
    color: #fff;
    font-size: 30rpx;
    border-radius: 6rpx;
    margin-right: 12rpx;
}

.btn:last-of-type {
    margin-right: 0;
}

.btn:active {
    background-color: #005ead;
}
</style>
