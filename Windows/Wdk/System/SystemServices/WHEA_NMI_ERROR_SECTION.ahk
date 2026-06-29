#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_NMI_ERROR_SECTION {
    #StructPack 8

    Data : Int8[8]

    Flags : IntPtr

}
