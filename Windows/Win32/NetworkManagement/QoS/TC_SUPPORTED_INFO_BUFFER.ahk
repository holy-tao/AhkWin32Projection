#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ADDRESS_LIST_DESCRIPTOR.ahk" { ADDRESS_LIST_DESCRIPTOR }
#Import "..\Ndis\NETWORK_ADDRESS.ahk" { NETWORK_ADDRESS }
#Import "..\Ndis\NETWORK_ADDRESS_LIST.ahk" { NETWORK_ADDRESS_LIST }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct TC_SUPPORTED_INFO_BUFFER {
    #StructPack 8

    InstanceIDLength : UInt16

    InstanceID : WCHAR[256]

    InterfaceLuid : Int64

    AddrListDesc : ADDRESS_LIST_DESCRIPTOR

}
