#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BIDI_DATA.ahk" { BIDI_DATA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\BINARY_CONTAINER.ahk" { BINARY_CONTAINER }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BIDI_RESPONSE_DATA {
    #StructPack 8

    dwResult : UInt32

    dwReqNumber : UInt32

    pSchema : PWSTR

    data : BIDI_DATA

}
