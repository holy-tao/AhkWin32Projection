#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\MediaFoundation\AM_MEDIA_TYPE.ahk
#Include .\AM_MPEGSTREAMTYPE.ahk

/**
 * The AM_MPEGSYSTEMTYPE structure defines the format block for an MPEG-1 system stream.
 * @remarks
 * 
 * The <b>Streams</b> member contains a list of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpegtype/ns-mpegtype-am_mpegstreamtype">AM_MPEGSTREAMTYPE</a> structures. The size of each <b>AM_MPEGSTREAMTYPE</b> structure is aligned to an 8-byte boundary. Given a pointer to an <b>AM_MPEGSTREAMTYPE</b> structure in list, use the <b>AM_MPEGSTREAMTYPE_NEXT</b> macro to get a pointer to the next structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mpegtype/ns-mpegtype-am_mpegsystemtype
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_MPEGSYSTEMTYPE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Bits per second.
     * @type {Integer}
     */
    dwBitRate {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of streams.
     * @type {Integer}
     */
    cStreams {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * List <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpegtype/ns-mpegtype-am_mpegstreamtype">AM_MPEGSTREAMTYPE</a> structures that describe the elementary streams. The number of elements in the list is given by the <b>cStream</b> member. The size of each <b>AM_MPEGSTREAMTYPE</b> structure is variable. Use the <b>AM_MPEGSTREAMTYPE_ELEMENTLENGTH</b> macro to calculate the size of each structure.
     * @type {Array<AM_MPEGSTREAMTYPE>}
     */
    Streams{
        get {
            if(!this.HasProp("__StreamsProxyArray"))
                this.__StreamsProxyArray := Win32FixedArray(this.ptr + 8, 1, AM_MPEGSTREAMTYPE, "")
            return this.__StreamsProxyArray
        }
    }
}
