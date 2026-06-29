#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_MEMORY_CORRECTABLE_ERROR_HEADER {
    #StructPack 2

    Version : UInt16

    Count : UInt16

}
