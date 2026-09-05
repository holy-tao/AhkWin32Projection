#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MSP_CALL_EVENT_CAUSE (msp.h) enumeration constant is returned within the MSP_EVENT_INFO struct by the GetEvent method when MSP_EVENT is ME_CALL_EVENT.
 * @see https://learn.microsoft.com/windows/win32/api/msp/ne-msp-msp_call_event_cause
 * @namespace Windows.Win32.Devices.Tapi
 */
class MSP_CALL_EVENT_CAUSE extends Win32Enum {

    /**
     * Call event cause is unknown.
     * Native name: CALL_CAUSE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * A bad device caused failure, for either STREAM_FAIL or TERMINAL_FAIL.
     * Native name: CALL_CAUSE_BAD_DEVICE
     * @type {Integer (Int32)}
     */
    static BAD_DEVICE => 1

    /**
     * Either connecting the stream failed or connecting the terminal failed. Note that if a terminal cannot be connected to a stream, the application will get a TERMINAL_FAIL event with CMC_CONNECT_FAIL. If this stream failed because the terminal is the only one to use, the application will also get a STREAM_FAIL event with CMC_CONNECT_FAIL.
     * Native name: CALL_CAUSE_CONNECT_FAIL
     * @type {Integer (Int32)}
     */
    static CONNECT_FAIL => 2

    /**
     * The event is the result of the application calling a method on the stream.
     * Native name: CALL_CAUSE_LOCAL_REQUEST
     * @type {Integer (Int32)}
     */
    static LOCAL_REQUEST => 3

    /**
     * The event is the result of the remote endpoint's request.
     * Native name: CALL_CAUSE_REMOTE_REQUEST
     * @type {Integer (Int32)}
     */
    static REMOTE_REQUEST => 4

    /**
     * The media that carries the stream is temporarily not available.
     * Native name: CALL_CAUSE_MEDIA_TIMEOUT
     * @type {Integer (Int32)}
     */
    static MEDIA_TIMEOUT => 5

    /**
     * The media that carries the stream is back to normal from a temporary denial of service.
     * Native name: CALL_CAUSE_MEDIA_RECOVERED
     * @type {Integer (Int32)}
     */
    static MEDIA_RECOVERED => 6

    /**
     * Native name: CALL_CAUSE_QUALITY_OF_SERVICE
     * @type {Integer (Int32)}
     */
    static QUALITY_OF_SERVICE => 7
}
