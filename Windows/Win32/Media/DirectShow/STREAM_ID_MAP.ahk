#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The STREAM_ID_MAP structure describes an elementary stream within an MPEG-2 program stream. Used with the IEnumStreamIdMap interface methods.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-stream_id_map
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class STREAM_ID_MAP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies the ID of the PES stream.
     * @type {Integer}
     */
    stream_id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwMediaSampleContent {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the substream within the elementary stream. If no substream filtering is required, use SUBSTREAM_FILTER_VAL_NONE (0x10000000).
     * @type {Integer}
     */
    ulSubstreamFilterValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the offset in bytes for the substream. If no filtering is required, specify 0.
     * @type {Integer}
     */
    iDataOffset {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
