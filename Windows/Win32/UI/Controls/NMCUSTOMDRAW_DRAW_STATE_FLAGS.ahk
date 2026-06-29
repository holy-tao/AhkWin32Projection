#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMCUSTOMDRAW_DRAW_STATE_FLAGS {
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
    static CDIS_SELECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_GRAYED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_DISABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_CHECKED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_FOCUS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_DEFAULT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_HOT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_MARKED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_INDETERMINATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_SHOWKEYBOARDCUES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_NEARHOT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_OTHERSIDEHOT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_DROPHILITED => 4096
}
