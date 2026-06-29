#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SMINFOMASK {
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
    static SMIM_TYPE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SMIM_FLAGS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SMIM_ICON => 4
}
