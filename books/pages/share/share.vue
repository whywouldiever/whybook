<template>
    <view class="container">
        <text>将以下位置分享给好友：</text>
        <view class="map-container">
            <map id="myMap" :latitude="latitude" :longitude="longitude" :markers="markers" />
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            latitude: 0,
            longitude: 0,
            markers: []
        };
    },
    onLoad: function (options) {
        this.setData({
            latitude: options.latitude,
            longitude: options.longitude,
            markers: [
                {
                    latitude: options.latitude,
                    longitude: options.longitude,
                    title: '我的位置',
                    iconPath: '/static/image/position.png'
                }
            ]
        });
    }
};
</script>
<style>
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100%;
}

.map-container {
    width: 300px;
    height: 300px;
    margin: 20px;
}
</style>
