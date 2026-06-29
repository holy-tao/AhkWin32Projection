#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_RADIO_STATUS {
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
    static Ndis802_11RadioStatusOn => 0

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11RadioStatusHardwareOff => 1

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11RadioStatusSoftwareOff => 2

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11RadioStatusHardwareSoftwareOff => 3

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11RadioStatusMax => 4
}
