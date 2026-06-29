#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSINTERFACE_MEDIA {
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
    static KSINTERFACE_MEDIA_MUSIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSINTERFACE_MEDIA_WAVE_BUFFERED => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSINTERFACE_MEDIA_WAVE_QUEUED => 2
}
