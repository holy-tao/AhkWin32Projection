#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct FORTCMD {
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
    static FORTCMD_LOGON => 1

    /**
     * @type {Integer (Int32)}
     */
    static FORTCMD_LOGOFF => 2

    /**
     * @type {Integer (Int32)}
     */
    static FORTCMD_CHG_PERSONALITY => 3
}
