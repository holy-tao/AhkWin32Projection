#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    pwszDescription{
        get {
            if(!this.HasProp("__pwszDescription"))
                this.__pwszDescription := PWSTR(this.ptr + 0)
            return this.__pwszDescription
        }
    }

    /**
     * Pointer to a wide-character null-terminated string containing the text.
     * @type {PWSTR}
     */
    pwszText{
        get {
            if(!this.HasProp("__pwszText"))
                this.__pwszText := PWSTR(this.ptr + 8)
            return this.__pwszText
        }
    }
}
