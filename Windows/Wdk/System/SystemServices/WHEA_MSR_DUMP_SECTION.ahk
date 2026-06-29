#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_MSR_DUMP_SECTION {
    #StructPack 4

    MsrDumpBuffer : Int8

    MsrDumpLength : UInt32

    MsrDumpData : Int8[1]

}
