#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The USB_UNICODE_NAME structure contains a Unicode string that specifies a symbolic link name.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_unicode_name
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_UNICODE_NAME {
    #StructPack 4

    /**
     * The length, in bytes, of the string.
     */
    Length : UInt32

    /**
     * A pointer to the string.
     */
    String : WCHAR[1]

}
