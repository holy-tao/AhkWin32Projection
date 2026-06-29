#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct WLDP_WINDOWS_LOCKDOWN_RESTRICTION {
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
    static WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK => 1

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK_PERMANENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_RESTRICTION_MAX => 3
}
