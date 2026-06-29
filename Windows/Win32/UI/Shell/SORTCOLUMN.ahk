#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SORTDIRECTION.ahk" { SORTDIRECTION }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Stores information about how to sort a column that is displayed in the folder view.
 * @remarks
 * Each column displayed in the folder view (for example, "details" view mode), is associated with a property that has a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> ID. When you want to sort the view by a particular property, you specify the property key for that property.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-sortcolumn
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SORTCOLUMN {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a></b>
     * 
     * The ID of the column by which the user will sort. A <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure. For example, for the "Name" column, the property key is PKEY_ItemNameDisplay.
     */
    propkey : PROPERTYKEY

    /**
     * Type: <b>SORTDIRECTION</b>
     */
    direction : SORTDIRECTION

}
