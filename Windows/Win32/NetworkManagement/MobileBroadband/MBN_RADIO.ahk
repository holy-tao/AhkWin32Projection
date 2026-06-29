#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_RADIO enumerated type indicates whether the device radio is on or off.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_radio
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_RADIO {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The device radio is off.
     * @type {Integer (Int32)}
     */
    static MBN_RADIO_OFF => 0

    /**
     * The device radio is on.
     * @type {Integer (Int32)}
     */
    static MBN_RADIO_ON => 1
}
