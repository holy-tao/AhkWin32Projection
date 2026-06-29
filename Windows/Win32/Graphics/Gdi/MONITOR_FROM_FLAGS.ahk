#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct MONITOR_FROM_FLAGS {
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
    static MONITOR_DEFAULTTONEAREST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MONITOR_DEFAULTTONULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MONITOR_DEFAULTTOPRIMARY => 1
}
