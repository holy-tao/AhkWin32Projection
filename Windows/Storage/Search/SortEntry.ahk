#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk

/**
 * An entry in the [SortOrder](queryoptions_sortorder.md) list the specifies a property and ordering that is used to sort query results.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentry
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class SortEntry extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The name of the property to use for sorting, like [System.Author](/windows/desktop/properties/props-system-author). The property must be registered on the system.
     * 
     * For more information, see the [Windows Property System](/windows/desktop/properties/windows-properties-system).
     * @type {HSTRING}
     */
    PropertyName{
        get {
            if(!this.HasProp("__PropertyName"))
                this.__PropertyName := HSTRING(0, this)
            return this.__PropertyName
        }
    }

    /**
     * True to sort content in the query results in ascending order based on the property name, or false to sort content in descending order.
     * @type {Boolean}
     */
    AscendingOrder {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
