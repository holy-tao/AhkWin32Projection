#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * Specifies a section within a Digital Video Broadcast (DVB) Event Information Table (EIT) section header. Because the EIT can be quite large, these options allow applications to reduce load time by filtering specific segments from the EIT section header.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2structs/ns-mpeg2structs-dvb_eit_filter_options
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DVB_EIT_FILTER_OPTIONS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * If this flag is <b>TRUE</b>, the number of the segment that is queried from the header must match the value of the <b>bSegment</b> structure member. Otherwise, the segment field is ignored.
     * @type {BOOL}
     */
    fSpecifySegment{
        get {
            if(!this.HasProp("__fSpecifySegment"))
                this.__fSpecifySegment := BOOL(this.ptr + 0)
            return this.__fSpecifySegment
        }
    }

    /**
     * Specifies the segment within the EIT section header that is queried.
     * @type {Integer}
     */
    bSegment {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
