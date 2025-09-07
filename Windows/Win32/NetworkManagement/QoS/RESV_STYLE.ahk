#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RsvpObjHdr.ahk

/**
 * The RESV_STYLE structure contains information about RSVP RESV style.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-resv_style
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RESV_STYLE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * RSVP object header, in the form of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvpobjhdr">RsvpObjHdr</a> structure.
     * @type {RsvpObjHdr}
     */
    style_header{
        get {
            if(!this.HasProp("__style_header"))
                this.__style_header := RsvpObjHdr(this.ptr + 0)
            return this.__style_header
        }
    }

    /**
     * 
     * @type {Integer}
     */
    style_word {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
