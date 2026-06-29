#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ICMP4_TIME_EXCEED_CODE {
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
    static ICMP4_TIME_EXCEED_TRANSIT => 0

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_TIME_EXCEED_REASSEMBLY => 1
}
