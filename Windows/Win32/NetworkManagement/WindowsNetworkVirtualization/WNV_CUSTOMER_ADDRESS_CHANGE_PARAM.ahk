#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import ".\WNV_CA_NOTIFICATION_TYPE.ahk" { WNV_CA_NOTIFICATION_TYPE }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Networking\WinSock\DL_EI48.ahk" { DL_EI48 }
#Import ".\WNV_IP_ADDRESS.ahk" { WNV_IP_ADDRESS }
#Import "..\..\Networking\WinSock\DL_EUI48.ahk" { DL_EUI48 }
#Import "..\..\Networking\WinSock\DL_OUI.ahk" { DL_OUI }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 */
export default struct WNV_CUSTOMER_ADDRESS_CHANGE_PARAM {
    #StructPack 4

    MACAddress : DL_EUI48

    CAFamily : ADDRESS_FAMILY

    CA : WNV_IP_ADDRESS

    VirtualSubnetId : UInt32

    PAFamily : ADDRESS_FAMILY

    PA : WNV_IP_ADDRESS

    NotificationReason : WNV_CA_NOTIFICATION_TYPE

}
