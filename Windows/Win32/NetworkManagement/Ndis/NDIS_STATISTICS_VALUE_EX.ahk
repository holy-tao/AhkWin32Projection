#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_STATISTICS_VALUE_EX {
    #StructPack 4

    Oid : UInt32

    DataLength : UInt32

    Length : UInt32

    Data : Int8[1]

}
