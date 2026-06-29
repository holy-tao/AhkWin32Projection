#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct SCRIPTFONTCONTF {
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
    static SCRIPTCONTF_FIXED_FONT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTCONTF_PROPORTIONAL_FONT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTCONTF_SCRIPT_USER => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTCONTF_SCRIPT_HIDE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTCONTF_SCRIPT_SYSTEM => 262144
}
