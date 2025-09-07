#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RsvpObjHdr structure provides an object header for an RSVP message.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-rsvpobjhdr
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RsvpObjHdr extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Object length, in bytes.
     * @type {Integer}
     */
    obj_length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Object class. Must be one of the following:
     * @type {Integer}
     */
    obj_class {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Object C-Type. Must be one of the following:
     * @type {Integer}
     */
    obj_ctype {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
