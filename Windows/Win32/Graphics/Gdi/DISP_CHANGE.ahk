#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DISP_CHANGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static DISP_CHANGE_SUCCESSFUL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISP_CHANGE_RESTART => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISP_CHANGE_FAILED => -1

    /**
     * @type {Integer (Int32)}
     */
    static DISP_CHANGE_BADMODE => -2

    /**
     * @type {Integer (Int32)}
     */
    static DISP_CHANGE_NOTUPDATED => -3

    /**
     * @type {Integer (Int32)}
     */
    static DISP_CHANGE_BADFLAGS => -4

    /**
     * @type {Integer (Int32)}
     */
    static DISP_CHANGE_BADPARAM => -5

    /**
     * @type {Integer (Int32)}
     */
    static DISP_CHANGE_BADDUALVIEW => -6
}
