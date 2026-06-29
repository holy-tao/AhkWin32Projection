#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BIDI_DATA.ahk" { BIDI_DATA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\BINARY_CONTAINER.ahk" { BINARY_CONTAINER }
#Import ".\BIDI_RESPONSE_DATA.ahk" { BIDI_RESPONSE_DATA }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BIDI_RESPONSE_CONTAINER {
    #StructPack 8

    Version : UInt32

    Flags : UInt32

    Count : UInt32

    aData : BIDI_RESPONSE_DATA[1]

}
