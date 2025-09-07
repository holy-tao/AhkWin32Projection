#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the header for a menu template. A complete menu template consists of a header and one or more menu item lists.
 * @remarks
 * One or more <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-menuitemtemplate">MENUITEMTEMPLATE</a> structures are combined to form the menu item list.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-menuitemtemplateheader
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENUITEMTEMPLATEHEADER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Type: <b>WORD</b>
     * 
     * The version number. This member must be zero.
     * @type {Integer}
     */
    versionNumber {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The offset, in bytes, from the end of the header. The menu item list begins at this offset. Usually, this member is zero, and the menu item list follows immediately after the header.
     * @type {Integer}
     */
    offset {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
