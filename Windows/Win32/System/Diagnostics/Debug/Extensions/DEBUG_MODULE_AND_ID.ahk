#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_MODULE_AND_ID {
    #StructPack 8

    ModuleBase : Int64

    Id : Int64

}
