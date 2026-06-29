#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct SYMBOL_INFO_EX {
    #StructPack 8

    SizeOfStruct : UInt32

    TypeOfInfo : UInt32

    Offset : Int64

    Line : UInt32

    Displacement : UInt32

    Reserved : UInt32[4]

}
