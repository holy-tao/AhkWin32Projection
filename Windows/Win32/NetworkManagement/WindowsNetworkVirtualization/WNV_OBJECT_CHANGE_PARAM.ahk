#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\WNV_IP_ADDRESS.ahk
#Include .\WNV_PROVIDER_ADDRESS_CHANGE_PARAM.ahk
#Include ..\..\Networking\WinSock\DL_OUI.ahk
#Include ..\..\Networking\WinSock\DL_EI48.ahk
#Include ..\..\Networking\WinSock\DL_EUI48.ahk
#Include .\WNV_CUSTOMER_ADDRESS_CHANGE_PARAM.ahk

/**
 * Specifies the parameters of an event that causes the Windows Network Virtualization (WNV) driver to generate a WnvObjectChangeType type of notification.
 * @remarks
 * 
 * There is currently only one type of object defined and tracked in this structure: <b>WnvProviderAddressType</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wnvapi/ns-wnvapi-wnv_object_change_param
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 * @version v4.0.30319
 */
class WNV_OBJECT_CHANGE_PARAM extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ne-wnvapi-wnv_object_type">WNV_OBJECT_TYPE</a></b>
     * 
     * The object type that causes the change notification.
     * @type {Integer}
     */
    ObjectType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {WNV_PROVIDER_ADDRESS_CHANGE_PARAM}
     */
    ProviderAddressChange{
        get {
            if(!this.HasProp("__ProviderAddressChange"))
                this.__ProviderAddressChange := WNV_PROVIDER_ADDRESS_CHANGE_PARAM(8, this)
            return this.__ProviderAddressChange
        }
    }

    /**
     * @type {WNV_CUSTOMER_ADDRESS_CHANGE_PARAM}
     */
    CustomerAddressChange{
        get {
            if(!this.HasProp("__CustomerAddressChange"))
                this.__CustomerAddressChange := WNV_CUSTOMER_ADDRESS_CHANGE_PARAM(8, this)
            return this.__CustomerAddressChange
        }
    }
}
