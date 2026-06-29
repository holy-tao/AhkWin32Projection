#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ANCHOR_CHANGE_HISTORY_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static TS_CH_PRECEDING_DEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TS_CH_FOLLOWING_DEL => 2
}
