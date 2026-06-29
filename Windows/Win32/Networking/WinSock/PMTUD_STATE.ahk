#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct PMTUD_STATE {
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
    static IP_PMTUDISC_NOT_SET => 0

    /**
     * @type {Integer (Int32)}
     */
    static IP_PMTUDISC_DO => 1

    /**
     * @type {Integer (Int32)}
     */
    static IP_PMTUDISC_DONT => 2

    /**
     * @type {Integer (Int32)}
     */
    static IP_PMTUDISC_PROBE => 3

    /**
     * @type {Integer (Int32)}
     */
    static IP_PMTUDISC_MAX => 4
}
