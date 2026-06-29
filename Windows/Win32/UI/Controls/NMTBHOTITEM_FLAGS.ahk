#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMTBHOTITEM_FLAGS {
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
    static HICF_ACCELERATOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HICF_ARROWKEYS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HICF_DUPACCEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HICF_ENTERING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HICF_LEAVING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HICF_LMOUSE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HICF_MOUSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HICF_OTHER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HICF_RESELECT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HICF_TOGGLEDROPDOWN => 256
}
