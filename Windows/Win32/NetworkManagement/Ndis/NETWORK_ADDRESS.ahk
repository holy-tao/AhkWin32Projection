#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NETWORK_ADDRESS {
    #StructPack 2

    AddressLength : UInt16

    AddressType : UInt16

    Address : Int8[1]

}
