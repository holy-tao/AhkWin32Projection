#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct MODIFIERKEYS_FLAGS {
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
    static MK_LBUTTON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MK_RBUTTON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MK_SHIFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MK_CONTROL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MK_MBUTTON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MK_XBUTTON1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MK_XBUTTON2 => 64
}
