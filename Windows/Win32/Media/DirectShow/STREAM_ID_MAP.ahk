#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The STREAM_ID_MAP structure describes an elementary stream within an MPEG-2 program stream. Used with the IEnumStreamIdMap interface methods.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-stream_id_map
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct STREAM_ID_MAP {
    #StructPack 4

    /**
     * Specifies the ID of the PES stream.
     */
    stream_id : UInt32

    dwMediaSampleContent : UInt32

    /**
     * Specifies the substream within the elementary stream. If no substream filtering is required, use SUBSTREAM_FILTER_VAL_NONE (0x10000000).
     */
    ulSubstreamFilterValue : UInt32

    /**
     * Specifies the offset in bytes for the substream. If no filtering is required, specify 0.
     */
    iDataOffset : Int32

}
