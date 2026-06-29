#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct GET_FILTER_FILE_IDENTIFIER_INPUT {
    #StructPack 2

    AltitudeLength : UInt16

    Altitude : WCHAR[1]

}
