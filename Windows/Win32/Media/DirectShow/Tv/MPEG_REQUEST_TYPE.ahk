#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MPEG_REQUEST_TYPE enumeration type specifies a request for MPEG-2 data.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2structs/ne-mpeg2structs-mpeg_request_type
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_REQUEST_TYPE{

    /**
     * Unknown request type. Do not use this value.
     * @type {Integer (Int32)}
     */
    static MPEG_RQST_UNKNOWN => 0

    /**
     * Get one table section. (Synchronous call.)
     * @type {Integer (Int32)}
     */
    static MPEG_RQST_GET_SECTION => 1

    /**
     * Get one table section. (Asynchronous call.)
     * @type {Integer (Int32)}
     */
    static MPEG_RQST_GET_SECTION_ASYNC => 2

    /**
     * Get a complete table. (Synchronous call.)
     * @type {Integer (Int32)}
     */
    static MPEG_RQST_GET_TABLE => 3

    /**
     * Get a complete table. (Asynchronous call.)
     * @type {Integer (Int32)}
     */
    static MPEG_RQST_GET_TABLE_ASYNC => 4

    /**
     * Get a stream of sections.
     * @type {Integer (Int32)}
     */
    static MPEG_RQST_GET_SECTIONS_STREAM => 5

    /**
     * Get a stream of packetized elementary stream (PES) packets.
     * @type {Integer (Int32)}
     */
    static MPEG_RQST_GET_PES_STREAM => 6

    /**
     * Get a stream of transport stream (TS) packets.
     * @type {Integer (Int32)}
     */
    static MPEG_RQST_GET_TS_STREAM => 7

    /**
     * Get a stream of multi-protocol encapsulation (MPE) packets.
     * @type {Integer (Int32)}
     */
    static MPEG_RQST_START_MPE_STREAM => 8
}
