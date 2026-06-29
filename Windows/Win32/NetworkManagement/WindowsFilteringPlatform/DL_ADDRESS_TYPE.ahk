#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DL_ADDRESS_TYPE enumeration (fwpmtypes.h) specifies the type of datalink layer address.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-dl_address_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct DL_ADDRESS_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies a unicast datalink layer address.
     * @type {Integer (Int32)}
     */
    static DlUnicast => 0

    /**
     * Specifies a multicast datalink layer address.
     * @type {Integer (Int32)}
     */
    static DlMulticast => 1

    /**
     * Specifies a broadcast datalink layer address.
     * @type {Integer (Int32)}
     */
    static DlBroadcast => 2
}
