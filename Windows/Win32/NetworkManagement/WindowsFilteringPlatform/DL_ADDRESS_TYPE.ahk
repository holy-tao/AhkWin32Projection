#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DL_ADDRESS_TYPE enumerated type.
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ne-fwpmtypes-dl_address_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class DL_ADDRESS_TYPE{

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
