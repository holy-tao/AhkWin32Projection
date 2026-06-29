#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The HTTP_BYTE_RANGE structure is used to specify a byte range within a cached response fragment, file, or other data block.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_byte_range
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_BYTE_RANGE {
    #StructPack 8

    /**
     * Starting offset of the byte range.
     */
    StartingOffset : Int64

    /**
     * Size, in bytes, of the range. If this member is HTTP_BYTE_RANGE_TO_EOF, the range extends from the starting offset to the end of the file or data block.
     */
    Length : Int64

}
