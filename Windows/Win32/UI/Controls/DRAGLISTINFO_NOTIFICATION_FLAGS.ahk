#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DRAGLISTINFO_NOTIFICATION_FLAGS {
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
    static DL_BEGINDRAG => 1157

    /**
     * @type {Integer (UInt32)}
     */
    static DL_CANCELDRAG => 1160

    /**
     * @type {Integer (UInt32)}
     */
    static DL_DRAGGING => 1158

    /**
     * @type {Integer (UInt32)}
     */
    static DL_DROPPED => 1159
}
