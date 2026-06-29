#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct MEDIA_ACTIVITY_NOTIFY_TYPE {
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
    static MediaPlayback => 0

    /**
     * @type {Integer (Int32)}
     */
    static MediaRecording => 1

    /**
     * @type {Integer (Int32)}
     */
    static MediaCasting => 2
}
