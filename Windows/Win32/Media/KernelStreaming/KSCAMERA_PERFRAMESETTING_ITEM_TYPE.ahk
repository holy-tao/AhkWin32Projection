#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_PERFRAMESETTING_ITEM_TYPE {
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
    static KSCAMERA_PERFRAMESETTING_ITEM_EXPOSURE_TIME => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_FLASH => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_EXPOSURE_COMPENSATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_ISO => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_FOCUS => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_PHOTOCONFIRMATION => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_CUSTOM => 7
}
