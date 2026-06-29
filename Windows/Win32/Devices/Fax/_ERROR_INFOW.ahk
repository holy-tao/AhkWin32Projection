#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct _ERROR_INFOW {
    #StructPack 4

    dwSize : UInt32

    dwGenericError : UInt32

    dwVendorError : UInt32

    szExtendedErrorText : WCHAR[255]

}
