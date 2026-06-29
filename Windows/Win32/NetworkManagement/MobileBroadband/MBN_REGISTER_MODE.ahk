#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_REGISTER_MODE enumerated type indicates the network selection mode of a device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_register_mode
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_REGISTER_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No network selection mode is defined.
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_MODE_NONE => 0

    /**
     * The device automatically selects the network to which to register .
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_MODE_AUTOMATIC => 1

    /**
     * The device tries to register to a given network.
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_MODE_MANUAL => 2
}
