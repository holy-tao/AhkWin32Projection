#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_USER_WEB_URL structure is used as the data item for the WM/UserWebURL complex metadata attribute.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_user_web_url
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_USER_WEB_URL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * Pointer to a wide-character null-terminated string containing the description of the Web site pointed to by the URL.
     * @type {Pointer<PWSTR>}
     */
    pwszDescription {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a wide-character null-terminated string containing the URL.
     * @type {Pointer<PWSTR>}
     */
    pwszURL {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
