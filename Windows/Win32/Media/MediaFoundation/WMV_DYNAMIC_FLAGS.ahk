#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct WMV_DYNAMIC_FLAGS {
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
    static WMV_DYNAMIC_BITRATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WMV_DYNAMIC_RESOLUTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static WMV_DYNAMIC_COMPLEXITY => 4
}
