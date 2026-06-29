#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_AUTODIAL {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTODIAL_FAILIFSECURITYCHECK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTODIAL_FORCE_ONLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTODIAL_FORCE_UNATTENDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTODIAL_OVERRIDE_NET_PRESENT => 8
}
