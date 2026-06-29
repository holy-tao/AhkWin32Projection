#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SFBS_FLAGS {
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
    static SFBS_FLAGS_ROUND_TO_NEAREST_DISPLAYED_DIGIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SFBS_FLAGS_TRUNCATE_UNDISPLAYED_DECIMAL_DIGITS => 2
}
