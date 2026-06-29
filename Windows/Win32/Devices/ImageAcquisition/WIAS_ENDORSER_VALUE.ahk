#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIAS_ENDORSER_VALUE {
    #StructPack 8

    wszTokenName : PWSTR

    wszValue : PWSTR

}
