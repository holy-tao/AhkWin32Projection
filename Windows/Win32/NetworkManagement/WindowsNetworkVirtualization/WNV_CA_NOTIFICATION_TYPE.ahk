#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 * @version v4.0.30319
 */
class WNV_CA_NOTIFICATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WnvCustomerAddressAdded => 0

    /**
     * @type {Integer (Int32)}
     */
    static WnvCustomerAddressDeleted => 1

    /**
     * @type {Integer (Int32)}
     */
    static WnvCustomerAddressMoved => 2

    /**
     * @type {Integer (Int32)}
     */
    static WnvCustomerAddressMax => 3
}
