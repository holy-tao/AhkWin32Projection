#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array or list of int data items from a visual style.
 * @remarks
 * The lists are returned by <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-getthemeintlist">GetThemeIntList</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ns-uxtheme-intlist
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class INTLIST extends Win32Struct
{
    static sizeof => 1612

    static packingSize => 4

    /**
     * Type: <b>int</b>
     * 
     * Number of values in the list.
     * @type {Integer}
     */
    iValueCount {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int[MAX_INTLIST_COUNT]</b>
     * 
     * List of integers. The constant MAX_INTLIST_COUNT, by definition, is equal to 402 under Windows Vista, but only 10 under earlier versions of Windows.
     * @type {Array<Int32>}
     */
    iValues{
        get {
            if(!this.HasProp("__iValuesProxyArray"))
                this.__iValuesProxyArray := Win32FixedArray(this.ptr + 4, 402, Primitive, "int")
            return this.__iValuesProxyArray
        }
    }
}
