#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct FOREGROUND_WINDOW_LOCK_CODE {
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
    static LSFW_LOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LSFW_UNLOCK => 2
}
