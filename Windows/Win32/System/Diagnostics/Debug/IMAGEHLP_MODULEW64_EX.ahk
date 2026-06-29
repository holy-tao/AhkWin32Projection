#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGEHLP_MODULEW64.ahk" { IMAGEHLP_MODULEW64 }
#Import ".\SYM_TYPE.ahk" { SYM_TYPE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_MODULEW64_EX {
    #StructPack 8

    Module : IMAGEHLP_MODULEW64

    RegionFlags : UInt32

}
