#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRECORESULTTIMES {
    #StructPack 8

    ftStreamTime : FILETIME

    ullLength : Int64

    dwTickCount : UInt32

    ullStart : Int64

}
