#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RsvpObjHdr.ahk

/**
 * The POLICY_DATA structure contains policy data for RSVP messages.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-policy_data
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class POLICY_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Policy object header, in the form of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvpobjhdr">RsvpObjHdr</a> structure.
     * @type {RsvpObjHdr}
     */
    PolicyObjHdr{
        get {
            if(!this.HasProp("__PolicyObjHdr"))
                this.__PolicyObjHdr := RsvpObjHdr(this.ptr + 0)
            return this.__PolicyObjHdr
        }
    }

    /**
     * Offset to the beginning of Policy Elements from the beginning of Policy Data.
     * @type {Integer}
     */
    usPeOffset {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    usReserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
