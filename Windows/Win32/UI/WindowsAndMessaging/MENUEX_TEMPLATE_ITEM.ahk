#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/menurc/menuex-template-item
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENUEX_TEMPLATE_ITEM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    uId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    wFlags {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {String}
     */
    szText {
        get => StrGet(this.ptr + 14, 0, "UTF-16")
        set => StrPut(value, this.ptr + 14, 0, "UTF-16")
    }
}
