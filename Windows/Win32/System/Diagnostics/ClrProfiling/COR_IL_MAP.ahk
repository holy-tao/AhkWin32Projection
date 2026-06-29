#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_IL_MAP {
    #StructPack 4

    oldOffset : UInt32

    newOffset : UInt32

    fAccurate : BOOL

}
