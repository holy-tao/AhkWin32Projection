#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SLGP_FLAGS {
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
    static SLGP_SHORTPATH => 1

    /**
     * @type {Integer (Int32)}
     */
    static SLGP_UNCPRIORITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static SLGP_RAWPATH => 4

    /**
     * @type {Integer (Int32)}
     */
    static SLGP_RELATIVEPRIORITY => 8
}
