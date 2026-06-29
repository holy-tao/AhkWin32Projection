#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PHYSICAL_MEMORY_RUN32 {
    #StructPack 4

    BasePage : UInt32

    PageCount : UInt32

}
