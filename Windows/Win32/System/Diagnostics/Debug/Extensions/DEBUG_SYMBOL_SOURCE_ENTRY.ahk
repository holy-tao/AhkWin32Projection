#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_SYMBOL_SOURCE_ENTRY {
    #StructPack 8

    ModuleBase : Int64

    Offset : Int64

    FileNameId : Int64

    EngineInternal : Int64

    Size : UInt32

    Flags : UInt32

    FileNameSize : UInt32

    StartLine : UInt32

    EndLine : UInt32

    StartColumn : UInt32

    EndColumn : UInt32

    Reserved : UInt32

}
