#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DL_ADDRESS_TYPE enumeration (fwpmtypes.h) specifies the type of datalink layer address.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-dl_address_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class DL_ADDRESS_TYPE extends Win32Enum {

    /**
     * Specifies a unicast datalink layer address.
     * Native name: DlUnicast
     * @type {Integer (Int32)}
     */
    static Unicast => 0

    /**
     * Specifies a multicast datalink layer address.
     * Native name: DlMulticast
     * @type {Integer (Int32)}
     */
    static Multicast => 1

    /**
     * Specifies a broadcast datalink layer address.
     * Native name: DlBroadcast
     * @type {Integer (Int32)}
     */
    static Broadcast => 2
}
