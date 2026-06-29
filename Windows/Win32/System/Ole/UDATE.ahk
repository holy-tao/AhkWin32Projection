#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct UDATE {
    #StructPack 2

    st : SYSTEMTIME

    wDayOfYear : UInt16

}
