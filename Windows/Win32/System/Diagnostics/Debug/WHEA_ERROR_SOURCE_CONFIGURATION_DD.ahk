#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_ERROR_SOURCE_CONFIGURATION_DD {
    #StructPack 8

    Initialize : IntPtr

    Uninitialize : IntPtr

    Correct : IntPtr

}
