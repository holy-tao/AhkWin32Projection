#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Sets the video usage for a video encoder.
 * @remarks
 * This property is also used with [H.264 UVC 1.5 camera encoders](camera-encoder-h264-uvc-1-5.md).
 * 
 * [CODECAPI\_AVEncVideoTemporalLayerCount](codecapi-avencvideotemporallayercount.md), CODECAPI\_AVEncVideoUsage, and [CODECAPI\_AVEncCommonRateControlMode](/windows/desktop/DirectShow/avenccommonratecontrolmode-property) are static encoder properties. Once set, these will only take effect after a set media type is called on the camera s output pin.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideousage
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVEncVideoUsage {
    #StructPack 1

}
