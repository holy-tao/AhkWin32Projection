#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NET_IF_RCV_ADDRESS_TYPE.ahk" { NET_IF_RCV_ADDRESS_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NET_IF_RCV_ADDRESS_LH {
    #StructPack 4

    ifRcvAddressType : NET_IF_RCV_ADDRESS_TYPE

    ifRcvAddressLength : UInt16

    ifRcvAddressOffset : UInt16

}
