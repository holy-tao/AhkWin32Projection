#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct IMAGE_FLAGS {
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
    static LR_CREATEDIBSECTION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LR_DEFAULTCOLOR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LR_DEFAULTSIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LR_LOADFROMFILE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LR_LOADMAP3DCOLORS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LR_LOADTRANSPARENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LR_MONOCHROME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LR_SHARED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LR_VGACOLOR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LR_COPYDELETEORG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LR_COPYFROMRESOURCE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LR_COPYRETURNORG => 4
}
