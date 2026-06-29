#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMPSubscriptionDownloadState {
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
    static wmpsdlsDownloading => 0

    /**
     * @type {Integer (Int32)}
     */
    static wmpsdlsPaused => 1

    /**
     * @type {Integer (Int32)}
     */
    static wmpsdlsProcessing => 2

    /**
     * @type {Integer (Int32)}
     */
    static wmpsdlsCompleted => 3

    /**
     * @type {Integer (Int32)}
     */
    static wmpsdlsCancelled => 4
}
