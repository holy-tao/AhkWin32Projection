#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct SET_BOUNDS_RECT_FLAGS {
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
    static DCB_ACCUMULATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DCB_DISABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DCB_ENABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DCB_RESET => 1
}
