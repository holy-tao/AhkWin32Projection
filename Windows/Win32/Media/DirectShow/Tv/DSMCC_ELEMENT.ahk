#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The DSMCC_ELEMENT structure contains information from a DSM-CC element.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-dsmcc_element
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DSMCC_ELEMENT extends Win32Struct
{
    static sizeof => 24

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
     * Carousel identifier.
     * @type {Integer}
     */
    dwCarouselId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Transaction identifier.
     * @type {Integer}
     */
    dwTransactionId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to the next <b>DSMCC_ELEMENT</b> structure in the list, or <b>NULL</b> if this element is the end of the list.
     * @type {Pointer<DSMCC_ELEMENT>}
     */
    pNext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
