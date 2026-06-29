#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct SEARCHMEMORY {
    #StructPack 8

    SearchAddress : Int64

    SearchLength : Int64

    FoundAddress : Int64

    PatternLength : UInt32

    Pattern : IntPtr

}
