#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NETWORK_ADDRESS_LIST {
    #StructPack 8

    AddressCount : Int32

    AddressType : UInt16

    Address : IntPtr[1]

}
