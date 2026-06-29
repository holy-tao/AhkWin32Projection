#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct IF_PHYSICAL_ADDRESS_LH {
    #StructPack 2

    Length : UInt16

    Address : Int8[32]

}
