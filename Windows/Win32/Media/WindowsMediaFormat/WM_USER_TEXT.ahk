#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_USER_TEXT structure is used as the data item for the WM/Text complex metadata attribute.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_user_text
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_USER_TEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * Pointer to a wide-character null-terminated string containing the description of the text entry.
     * @type {Pointer<PWSTR>}
     */
    pwszDescription {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a wide-character null-terminated string containing the text.
     * @type {Pointer<PWSTR>}
     */
    pwszText {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
