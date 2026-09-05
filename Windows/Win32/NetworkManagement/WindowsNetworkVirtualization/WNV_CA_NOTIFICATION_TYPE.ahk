#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 */
class WNV_CA_NOTIFICATION_TYPE extends Win32Enum {

    /**
     * Native name: WnvCustomerAddressAdded
     * @type {Integer (Int32)}
     */
    static CustomerAddressAdded => 0

    /**
     * Native name: WnvCustomerAddressDeleted
     * @type {Integer (Int32)}
     */
    static CustomerAddressDeleted => 1

    /**
     * Native name: WnvCustomerAddressMoved
     * @type {Integer (Int32)}
     */
    static CustomerAddressMoved => 2

    /**
     * Native name: WnvCustomerAddressMax
     * @type {Integer (Int32)}
     */
    static CustomerAddressMax => 3
}
