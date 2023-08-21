<template>
    <view class="container">
        <view class="map-container">
            <map id="myMap" :longitude="longitude" :latitude="latitude" :markers="markers" :polyline="polyline" show-location />
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            latitude: 0,
            longitude: 0,
            markers: [],
            polyline: []
        };
    },
    onLoad: function (options) {
        this.setData({
            latitude: options.start.split(',')[0],
            longitude: options.start.split(',')[1],
            markers: [
                {
                    latitude: options.start.split(',')[0],
                    longitude: options.start.split(',')[1],
                    iconPath: '/images/map-marker-start.png',
                    width: 32,
                    height: 32
                },
                {
                    latitude: options.end.split(',')[0],
                    longitude: options.end.split(',')[1],
                    iconPath: '/images/map-marker-end.png',
                    width: 32,
                    height: 32
                }
            ],
            polyline: JSON.parse(options.polyline)
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
    width: 100%;
    height: 100%;
}
</style>
