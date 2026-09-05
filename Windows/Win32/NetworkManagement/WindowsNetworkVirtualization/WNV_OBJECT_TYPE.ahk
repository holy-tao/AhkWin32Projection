#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the object type of a given Windows Network Virtualization (WNV) notification when the WNV notification type is WnvObjectChangeType.
 * @see https://learn.microsoft.com/windows/win32/api/wnvapi/ne-wnvapi-wnv_object_type
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 */
class WNV_OBJECT_TYPE extends Win32Enum {

    /**
     * The notification is about a change in a property of a provider address object.
     * Native name: WnvProviderAddressType
     * @type {Integer (Int32)}
     */
    static ProviderAddressType => 0

    /**
     * Native name: WnvCustomerAddressType
     * @type {Integer (Int32)}
     */
    static CustomerAddressType => 1

    /**
     * The maximum possible value for this enumeration type. This is not a legal value.
     * Native name: WnvObjectTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 2
}
