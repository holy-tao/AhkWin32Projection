#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_MODULE_PARAMETERS {
    #StructPack 8

    Base : Int64

    Size : UInt32

    TimeDateStamp : UInt32

    Checksum : UInt32

    Flags : UInt32

    SymbolType : UInt32

    ImageNameSize : UInt32

    ModuleNameSize : UInt32

    LoadedImageNameSize : UInt32

    SymbolFileNameSize : UInt32

    MappedImageNameSize : UInt32

    Reserved : Int64[2]

}
