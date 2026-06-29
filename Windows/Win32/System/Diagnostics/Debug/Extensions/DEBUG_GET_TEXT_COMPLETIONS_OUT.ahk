#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_GET_TEXT_COMPLETIONS_OUT {
    #StructPack 8

    Flags : UInt32

    ReplaceIndex : UInt32

    MatchCount : UInt32

    Reserved1 : UInt32

    Reserved2 : Int64[2]

}
