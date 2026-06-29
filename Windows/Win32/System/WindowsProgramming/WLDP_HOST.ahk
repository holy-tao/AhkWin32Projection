#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct WLDP_HOST {
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
    static WLDP_HOST_RUNDLL32 => 0

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_SVCHOST => 1

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_MAX => 2
}
