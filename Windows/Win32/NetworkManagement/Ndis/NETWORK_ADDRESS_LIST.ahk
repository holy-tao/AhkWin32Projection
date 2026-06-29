#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NETWORK_ADDRESS.ahk" { NETWORK_ADDRESS }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NETWORK_ADDRESS_LIST {
    #StructPack 4

    AddressCount : Int32

    AddressType : UInt16

    Address : NETWORK_ADDRESS[1]

}
