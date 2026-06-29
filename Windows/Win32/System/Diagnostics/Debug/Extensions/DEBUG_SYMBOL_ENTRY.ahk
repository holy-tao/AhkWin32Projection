#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_SYMBOL_ENTRY {
    #StructPack 8

    ModuleBase : Int64

    Offset : Int64

    Id : Int64

    Arg64 : Int64

    Size : UInt32

    Flags : UInt32

    TypeId : UInt32

    NameSize : UInt32

    Token : UInt32

    Tag : UInt32

    Arg32 : UInt32

    Reserved : UInt32

}
