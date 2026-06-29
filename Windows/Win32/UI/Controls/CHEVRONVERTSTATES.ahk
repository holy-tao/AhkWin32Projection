#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct CHEVRONVERTSTATES {
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
    static CHEVSV_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static CHEVSV_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static CHEVSV_PRESSED => 3
}
