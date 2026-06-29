#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @charset Unicode
 */
export default struct MCI_OPEN_PARMSW {
    #StructPack 8

    dwCallback : IntPtr

    wDeviceID : UInt32

    lpstrDeviceType : PWSTR

    lpstrElementName : PWSTR

    lpstrAlias : PWSTR

}
