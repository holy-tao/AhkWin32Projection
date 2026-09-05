#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The MPEG_REQUEST_TYPE enumeration type specifies a request for MPEG-2 data.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ne-mpeg2structs-mpeg_request_type
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class MPEG_REQUEST_TYPE extends Win32Enum {

    /**
     * Unknown request type. Do not use this value.
     * Native name: MPEG_RQST_UNKNOWN
     * @type {Integer (Int32)}
     */
    static RQST_UNKNOWN => 0

    /**
     * Get one table section. (Synchronous call.)
     * Native name: MPEG_RQST_GET_SECTION
     * @type {Integer (Int32)}
     */
    static RQST_GET_SECTION => 1

    /**
     * Get one table section. (Asynchronous call.)
     * Native name: MPEG_RQST_GET_SECTION_ASYNC
     * @type {Integer (Int32)}
     */
    static RQST_GET_SECTION_ASYNC => 2

    /**
     * Get a complete table. (Synchronous call.)
     * Native name: MPEG_RQST_GET_TABLE
     * @type {Integer (Int32)}
     */
    static RQST_GET_TABLE => 3

    /**
     * Get a complete table. (Asynchronous call.)
     * Native name: MPEG_RQST_GET_TABLE_ASYNC
     * @type {Integer (Int32)}
     */
    static RQST_GET_TABLE_ASYNC => 4

    /**
     * Get a stream of sections.
     * Native name: MPEG_RQST_GET_SECTIONS_STREAM
     * @type {Integer (Int32)}
     */
    static RQST_GET_SECTIONS_STREAM => 5

    /**
     * Get a stream of packetized elementary stream (PES) packets.
     * Native name: MPEG_RQST_GET_PES_STREAM
     * @type {Integer (Int32)}
     */
    static RQST_GET_PES_STREAM => 6

    /**
     * Get a stream of transport stream (TS) packets.
     * Native name: MPEG_RQST_GET_TS_STREAM
     * @type {Integer (Int32)}
     */
    static RQST_GET_TS_STREAM => 7

    /**
     * Get a stream of multi-protocol encapsulation (MPE) packets.
     * Native name: MPEG_RQST_START_MPE_STREAM
     * @type {Integer (Int32)}
     */
    static RQST_START_MPE_STREAM => 8
}
