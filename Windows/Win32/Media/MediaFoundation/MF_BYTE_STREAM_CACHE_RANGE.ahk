#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a range of bytes.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mf_byte_stream_cache_range
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_BYTE_STREAM_CACHE_RANGE {
    #StructPack 8

    /**
     * The offset, in bytes, of the start of the range.
     */
    qwStartOffset : Int64

    /**
     * The offset, in bytes, of the end of the range.
     */
    qwEndOffset : Int64

}
