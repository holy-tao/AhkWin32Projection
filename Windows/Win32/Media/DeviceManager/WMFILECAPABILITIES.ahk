#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The WMFILECAPABILITIES structure describes the MIME type.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmfilecapabilities
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMFILECAPABILITIES {
    #StructPack 8

    /**
     * MIME type.
     */
    pwszMimeType : PWSTR

    dwReserved : UInt32

}
