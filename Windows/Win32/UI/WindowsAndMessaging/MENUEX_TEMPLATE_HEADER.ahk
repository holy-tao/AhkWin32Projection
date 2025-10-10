#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENUEX_TEMPLATE_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    wVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wOffset {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    dwHelpId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
