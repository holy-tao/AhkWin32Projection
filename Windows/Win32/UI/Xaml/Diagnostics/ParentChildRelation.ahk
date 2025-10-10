#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Associates a parent object with a child object.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/ns-xamlom-parentchildrelation
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class ParentChildRelation extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A handle to the parent object.
     * @type {Integer}
     */
    Parent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to the child object.
     * @type {Integer}
     */
    Child {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The index of <b>Child</b> in the <b>Children</b> collection of <b>Parent</b>.
     * @type {Integer}
     */
    ChildIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
