#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TVITEM_MASK {
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
    static TVIF_CHILDREN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_DI_SETITEM => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_HANDLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_PARAM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_SELECTEDIMAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_STATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_TEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_EXPANDEDIMAGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_INTEGRAL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_STATEEX => 256
}
