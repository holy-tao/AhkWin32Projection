#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPCFLAG_VISIBILITY {
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
    static WPCFLAG_WPC_VISIBLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_WPC_HIDDEN => 1
}
