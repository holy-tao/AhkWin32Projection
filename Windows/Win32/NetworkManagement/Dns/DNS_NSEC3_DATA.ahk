#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_NSEC3_DATA {
    #StructPack 2

    chAlgorithm : Int8

    bFlags : Int8

    wIterations : UInt16

    bSaltLength : Int8

    bHashLength : Int8

    wTypeBitMapsLength : UInt16

    chData : Int8[1]

}
