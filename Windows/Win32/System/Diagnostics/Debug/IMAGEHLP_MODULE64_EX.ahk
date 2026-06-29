#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGEHLP_MODULE64.ahk" { IMAGEHLP_MODULE64 }
#Import ".\SYM_TYPE.ahk" { SYM_TYPE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_MODULE64_EX {
    #StructPack 8

    Module : IMAGEHLP_MODULE64

    RegionFlags : UInt32

}
