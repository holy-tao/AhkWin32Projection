#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\PATCH_INTERLEAVE_MAP.ahk" { PATCH_INTERLEAVE_MAP }
#Import ".\PPATCH_SYMLOAD_CALLBACK.ahk" { PPATCH_SYMLOAD_CALLBACK }

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

    SymLoadCallback : PPATCH_SYMLOAD_CALLBACK

    SymLoadContext : IntPtr

    InterleaveMapArray : IntPtr

    MaxLzxWindowSize : UInt32

}
