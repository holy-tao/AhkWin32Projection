#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_SECURITY_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static RTCSECT_AUDIO_VIDEO_MEDIA_ENCRYPTION => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCSECT_T120_MEDIA_ENCRYPTION => 1
}
