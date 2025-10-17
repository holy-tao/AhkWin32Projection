#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * Stores information about how to sort a column that is displayed in the folder view.
 * @remarks
 * 
  * Each column displayed in the folder view (for example, "details" view mode), is associated with a property that has a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> ID. When you want to sort the view by a particular property, you specify the property key for that property.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ns-shobjidl_core-sortcolumn
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SORTCOLUMN extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a></b>
     * 
     * The ID of the column by which the user will sort. A <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure. For example, for the "Name" column, the property key is PKEY_ItemNameDisplay.
     * @type {PROPERTYKEY}
     */
    propkey{
        get {
            if(!this.HasProp("__propkey"))
                this.__propkey := PROPERTYKEY(0, this)
            return this.__propkey
        }
    }

    /**
     * Type: <b>SORTDIRECTION</b>
     * @type {Integer}
     */
    direction {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
