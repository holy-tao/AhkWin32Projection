#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct MENUPOPUPPOPUPFLAGS {
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
    static MPPF_SETFOCUS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_INITIALSELECT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_NOANIMATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_KEYBOARD => 16

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_REPOSITION => 32

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_FORCEZORDER => 64

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_FINALSELECT => 128

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_TOP => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_LEFT => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_RIGHT => 1610612736

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_BOTTOM => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_POS_MASK => -536870912

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_ALIGN_LEFT => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static MPPF_ALIGN_RIGHT => 67108864
}
