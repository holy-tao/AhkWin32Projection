#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a stream item used by the PFNDPASTREAM callback function.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/ns-dpa_dsa-dpastreaminfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class DPASTREAMINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>int</b>
     * 
     * An index of the item in the DPA.
     * @type {Integer}
     */
    iPos {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>void*</b>
     * 
     * A void pointer to the item data.
     * @type {Pointer<Void>}
     */
    pvItem {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
