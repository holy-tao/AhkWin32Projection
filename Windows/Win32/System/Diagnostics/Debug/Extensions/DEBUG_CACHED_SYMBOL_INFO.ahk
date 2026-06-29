#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_CACHED_SYMBOL_INFO {
    #StructPack 8

    ModBase : Int64

    Arg1 : Int64

    Arg2 : Int64

    Id : UInt32

    Arg3 : UInt32

}
