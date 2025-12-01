#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DS_SELECTION.ahk

/**
 * The DS_SELECTION_LIST structure contains data about the objects the user selected from an object picker dialog box.
 * @see https://learn.microsoft.com/windows/win32/api/objsel/ns-objsel-ds_selection_list
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_SELECTION_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the number of elements in the <b>aDsSelection</b> array.
     * @type {Integer}
     */
    cItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the number of elements returned in the <b>pvarFetchedAttributes</b> member of each 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-ds_selection">DS_SELECTION</a> structure.
     * @type {Integer}
     */
    cFetchedAttributes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-ds_selection">DS_SELECTION</a> structures, one for each object selected by the user. The <b>cItems</b> member indicates the number of elements in this array.
     * @type {Array<DS_SELECTION>}
     */
    aDsSelection{
        get {
            if(!this.HasProp("__aDsSelectionProxyArray"))
                this.__aDsSelectionProxyArray := Win32FixedArray(this.ptr + 8, 1, DS_SELECTION, "")
            return this.__aDsSelectionProxyArray
        }
    }
}
