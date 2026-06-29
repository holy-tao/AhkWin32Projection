#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_JIT_SYMBOLMAP {
    #StructPack 8

    SizeOfStruct : UInt32

    Address : Int64

    BaseOfImage : Int64

}
