#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct RADIOBUTTONSTATES {
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
    static RBS_UNCHECKEDNORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static RBS_UNCHECKEDHOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static RBS_UNCHECKEDPRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static RBS_UNCHECKEDDISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static RBS_CHECKEDNORMAL => 5

    /**
     * @type {Integer (Int32)}
     */
    static RBS_CHECKEDHOT => 6

    /**
     * @type {Integer (Int32)}
     */
    static RBS_CHECKEDPRESSED => 7

    /**
     * @type {Integer (Int32)}
     */
    static RBS_CHECKEDDISABLED => 8
}
