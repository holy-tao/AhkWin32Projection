#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\MediaFoundation\AM_MEDIA_TYPE.ahk

/**
 * The AM_MPEGSTREAMTYPE structure defines the media type for an MPEG-1 program stream.
 * @see https://docs.microsoft.com/windows/win32/api//mpegtype/ns-mpegtype-am_mpegstreamtype
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_MPEGSTREAMTYPE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Stream identifier of the stream to process.
     * @type {Integer}
     */
    dwStreamId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure describing the type for the substeam. The <b>pbFormat</b> member of this structure must <b>NULL</b>. The format data normally conveyed in <b>pbFormat</b> is stored in the <b>bFormat</b> member.
     * @type {AM_MEDIA_TYPE}
     */
    mt{
        get {
            if(!this.HasProp("__mt"))
                this.__mt := AM_MEDIA_TYPE(8, this)
            return this.__mt
        }
    }

    /**
     * Format data. The size of this array, in bytes, is given in the <b>mt.cbFormat</b> member.
     * @type {Array<Byte>}
     */
    bFormat{
        get {
            if(!this.HasProp("__bFormatProxyArray"))
                this.__bFormatProxyArray := Win32FixedArray(this.ptr + 72, 1, Primitive, "char")
            return this.__bFormatProxyArray
        }
    }
}
