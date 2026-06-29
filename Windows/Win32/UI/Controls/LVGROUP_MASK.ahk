#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVGROUP_MASK {
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
    static LVGF_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_HEADER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_FOOTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_STATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_ALIGN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_GROUPID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_SUBTITLE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_TASK => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_DESCRIPTIONTOP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_DESCRIPTIONBOTTOM => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_TITLEIMAGE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_EXTENDEDIMAGE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_ITEMS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_SUBSET => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LVGF_SUBSETITEMS => 65536
}
