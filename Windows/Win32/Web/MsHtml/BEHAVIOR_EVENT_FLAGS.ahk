#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct BEHAVIOR_EVENT_FLAGS {
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
    static BEHAVIOREVENTFLAGS_BUBBLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOREVENTFLAGS_STANDARDADDITIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_EVENT_FLAGS_Max => 2147483647
}
