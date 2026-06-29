#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PHYSICAL_ADDRESS_UNIT {
    #StructPack 8

    PhysicalAddress : Int64

    Length : UInt32

}
