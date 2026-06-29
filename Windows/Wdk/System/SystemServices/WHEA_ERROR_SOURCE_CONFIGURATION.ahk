#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ERROR_SOURCE_CONFIGURATION {
    #StructPack 8

    Flags : UInt32

    Correct : IntPtr

    Initialize : IntPtr

    CreateRecord : IntPtr

    Recover : IntPtr

    Uninitialize : IntPtr

    Reserved : IntPtr

}
