#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct WLDP_SECURE_SETTING_VALUE_TYPE {
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
    static WLDP_SECURE_SETTING_VALUE_TYPE_BOOLEAN => 0

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_SECURE_SETTING_VALUE_TYPE_ULONG => 1

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_SECURE_SETTING_VALUE_TYPE_BINARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_SECURE_SETTING_VALUE_TYPE_STRING => 3
}
