#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct TEMP_BP_NOTE {
    #StructPack 4

    Seg : UInt16

    Offset : UInt32

    bPM : BOOL

}
