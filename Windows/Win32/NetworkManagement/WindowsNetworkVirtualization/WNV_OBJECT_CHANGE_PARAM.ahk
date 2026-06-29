#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import "..\..\Networking\WinSock\DL_EUI48.ahk" { DL_EUI48 }
#Import ".\WNV_CUSTOMER_ADDRESS_CHANGE_PARAM.ahk" { WNV_CUSTOMER_ADDRESS_CHANGE_PARAM }
#Import "..\..\Networking\WinSock\NL_DAD_STATE.ahk" { NL_DAD_STATE }
#Import ".\WNV_CA_NOTIFICATION_TYPE.ahk" { WNV_CA_NOTIFICATION_TYPE }
#Import "..\..\Networking\WinSock\DL_EI48.ahk" { DL_EI48 }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import ".\WNV_OBJECT_TYPE.ahk" { WNV_OBJECT_TYPE }
#Import ".\WNV_IP_ADDRESS.ahk" { WNV_IP_ADDRESS }
#Import "..\..\Networking\WinSock\DL_OUI.ahk" { DL_OUI }
#Import ".\WNV_PROVIDER_ADDRESS_CHANGE_PARAM.ahk" { WNV_PROVIDER_ADDRESS_CHANGE_PARAM }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * Specifies the parameters of an event that causes the Windows Network Virtualization (WNV) driver to generate a WnvObjectChangeType type of notification.
 * @remarks
 * There is currently only one type of object defined and tracked in this structure: <b>WnvProviderAddressType</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wnvapi/ns-wnvapi-wnv_object_change_param
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 */
export default struct WNV_OBJECT_CHANGE_PARAM {
    #StructPack 4


    struct _ObjectParam {
        ProviderAddressChange : WNV_PROVIDER_ADDRESS_CHANGE_PARAM

        static __New() {
            DefineProp(this.Prototype, 'CustomerAddressChange', { type: WNV_CUSTOMER_ADDRESS_CHANGE_PARAM, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ne-wnvapi-wnv_object_type">WNV_OBJECT_TYPE</a></b>
     * 
     * The object type that causes the change notification.
     */
    ObjectType : WNV_OBJECT_TYPE

    /**
     * The parameters for the corresponding object type. If the object type is <b>WnvProviderAddressType</b>, this field points to the <a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_provider_address_change_param">WNV_PROVIDER_ADDRESS_CHANGE_PARAM</a> structure that describes the provider address object that generated an object change event.
     */
    ObjectParam : WNV_OBJECT_CHANGE_PARAM._ObjectParam

}
