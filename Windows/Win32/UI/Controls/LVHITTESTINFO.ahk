#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information about a hit test.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-lvhittestinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LVHITTESTINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * The position to hit test, in client coordinates.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(this.ptr + 0)
            return this.__pt
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * Receives the index of the matching item. Or if hit-testing a subitem, this value represents the subitem's parent item.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.70</a>. Receives the index of the matching subitem. When hit-testing an item, this member will be zero.
     * @type {Integer}
     */
    iSubItem {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Windows Vista</a>. Group index of the item hit (read only). Valid only for owner data. If the point is within an item that is displayed in multiple groups then <b>iGroup</b> will specify the group index of the item.
     * @type {Integer}
     */
    iGroup {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
