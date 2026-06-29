#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_DECODE_ERROR {
    #StructPack 4

    SizeOfStruct : UInt32

    Code : UInt32

    TreatAsStatus : BOOL

    Source : CHAR[64]

    Message : CHAR[260]

}
