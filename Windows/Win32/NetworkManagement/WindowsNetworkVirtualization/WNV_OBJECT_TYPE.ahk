#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the object type of a given Windows Network Virtualization (WNV) notification when the WNV notification type is WnvObjectChangeType.
 * @see https://learn.microsoft.com/windows/win32/api/wnvapi/ne-wnvapi-wnv_object_type
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 */
export default struct WNV_OBJECT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The notification is about a change in a property of a provider address object.
     * @type {Integer (Int32)}
     */
    static WnvProviderAddressType => 0

    /**
     * @type {Integer (Int32)}
     */
    static WnvCustomerAddressType => 1

    /**
     * The maximum possible value for this enumeration type. This is not a legal value.
     * @type {Integer (Int32)}
     */
    static WnvObjectTypeMax => 2
}
