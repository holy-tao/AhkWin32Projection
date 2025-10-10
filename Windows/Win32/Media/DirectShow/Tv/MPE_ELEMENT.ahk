#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The MPE_ELEMENT structure contains information from a multi-protocol encapsulation (MPE) element.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2structs/ns-mpeg2structs-mpe_element
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPE_ELEMENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Packet identifier (PID).
     * @type {Integer}
     */
    pid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Component tag.
     * @type {Integer}
     */
    bComponentTag {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Pointer to the next <b>MPE_ELEMENT</b> structure in the list, or <b>NULL</b> if this element is the end of the list.
     * @type {Pointer<MPE_ELEMENT>}
     */
    pNext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
