#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct CO_ADDRESS_FAMILY {
    #StructPack 4

    AddressFamily : UInt32

    MajorVersion : UInt32

    MinorVersion : UInt32

}
