#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_OPEN_DRIVER_PARMS {
    #StructPack 8

    wDeviceID : UInt32

    lpstrParams : PWSTR

    wCustomCommandTable : UInt32

    wType : UInt32

}
