#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\BIDI_DATA.ahk" { BIDI_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BINARY_CONTAINER.ahk" { BINARY_CONTAINER }
#Import ".\BIDI_REQUEST_DATA.ahk" { BIDI_REQUEST_DATA }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BIDI_REQUEST_CONTAINER {
    #StructPack 8

    Version : UInt32

    Flags : UInt32

    Count : UInt32

    aData : BIDI_REQUEST_DATA[1]

}
