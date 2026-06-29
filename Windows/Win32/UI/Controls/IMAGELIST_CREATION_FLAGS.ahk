#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct IMAGELIST_CREATION_FLAGS {
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
    static ILC_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ILC_COLOR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ILC_COLORDDB => 254

    /**
     * @type {Integer (UInt32)}
     */
    static ILC_COLOR4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ILC_COLOR8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ILC_COLOR16 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ILC_COLOR24 => 24

    /**
     * @type {Integer (UInt32)}
     */
    static ILC_COLOR32 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ILC_PALETTE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ILC_MIRROR => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ILC_PERITEMMIRROR => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ILC_ORIGINALSIZE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static ILC_HIGHQUALITYSCALE => 131072
}
