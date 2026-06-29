#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct ICS_TARGETTYPE {
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
    static ICSTT_NAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static ICSTT_IPADDRESS => 1
}
