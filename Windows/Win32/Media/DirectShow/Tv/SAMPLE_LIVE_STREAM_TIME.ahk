#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct SAMPLE_LIVE_STREAM_TIME {
    #StructPack 8

    qwStreamTime : Int64

    qwLiveTime : Int64

}
