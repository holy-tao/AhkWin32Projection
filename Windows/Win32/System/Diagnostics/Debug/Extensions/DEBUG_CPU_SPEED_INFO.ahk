#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_CPU_SPEED_INFO {
    #StructPack 4

    SizeOfStruct : UInt32

    CurrentSpeed : UInt32

    RatedSpeed : UInt32

    NameString : WCHAR[256]

}
