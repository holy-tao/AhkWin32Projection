#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct WDBGEXTS_MODULE_IN_RANGE {
    #StructPack 8

    Start : Int64

    End : Int64

    FoundModBase : Int64

    FoundModSize : UInt32

}
