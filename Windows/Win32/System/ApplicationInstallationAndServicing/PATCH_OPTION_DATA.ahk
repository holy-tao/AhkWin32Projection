#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PATCH_INTERLEAVE_MAP.ahk" { PATCH_INTERLEAVE_MAP }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PATCH_OPTION_DATA {
    #StructPack 8

    SizeOfThisStruct : UInt32

    SymbolOptionFlags : UInt32

    NewFileSymbolPath : PSTR

    OldFileSymbolPathArray : PSTR.Ptr

    ExtendedOptionFlags : UInt32

    SymLoadCallback : IntPtr

    SymLoadContext : IntPtr

    InterleaveMapArray : IntPtr

    MaxLzxWindowSize : UInt32

}
