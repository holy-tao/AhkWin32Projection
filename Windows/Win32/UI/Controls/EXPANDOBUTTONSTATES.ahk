#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct EXPANDOBUTTONSTATES {
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
    static TDLGEBS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TDLGEBS_HOVER => 2

    /**
     * @type {Integer (Int32)}
     */
    static TDLGEBS_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static TDLGEBS_EXPANDEDNORMAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static TDLGEBS_EXPANDEDHOVER => 5

    /**
     * @type {Integer (Int32)}
     */
    static TDLGEBS_EXPANDEDPRESSED => 6

    /**
     * @type {Integer (Int32)}
     */
    static TDLGEBS_NORMALDISABLED => 7

    /**
     * @type {Integer (Int32)}
     */
    static TDLGEBS_EXPANDEDDISABLED => 8
}
