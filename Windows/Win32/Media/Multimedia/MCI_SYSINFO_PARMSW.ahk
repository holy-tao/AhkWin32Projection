#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @charset Unicode
 */
export default struct MCI_SYSINFO_PARMSW {
    #StructPack 8

    dwCallback : IntPtr

    lpstrReturn : PWSTR

    dwRetSize : UInt32

    dwNumber : UInt32

    wDeviceType : UInt32

}
