#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ERROR_RECORD {
    #StructPack 8

    Header : IntPtr

    SectionDescriptor : IntPtr[1]

}
