#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MSP_CALL_EVENT_CAUSE constant is returned within the MSP_EVENT_INFO struct by the GetEvent method when MSP_EVENT is ME_CALL_EVENT.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3/ne-tapi3-msp_call_event_cause
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class MSP_CALL_EVENT_CAUSE{

    /**
     * Call event cause is unknown.
     * @type {Integer (Int32)}
     */
    static CALL_CAUSE_UNKNOWN => 0

    /**
     * A bad device caused failure, for either STREAM_FAIL or TERMINAL_FAIL.
     * @type {Integer (Int32)}
     */
    static CALL_CAUSE_BAD_DEVICE => 1

    /**
     * Either connecting the stream failed or connecting the terminal failed. Note that if a terminal cannot be connected to a stream, the application will get a TERMINAL_FAIL event with CMC_CONNECT_FAIL. If this stream failed because the terminal is the only one to use, the application will also get a STREAM_FAIL event with CMC_CONNECT_FAIL.
     * @type {Integer (Int32)}
     */
    static CALL_CAUSE_CONNECT_FAIL => 2

    /**
     * The event is the result of the application calling a method on the stream.
     * @type {Integer (Int32)}
     */
    static CALL_CAUSE_LOCAL_REQUEST => 3

    /**
     * The event is the result of the remote endpoint's request.
     * @type {Integer (Int32)}
     */
    static CALL_CAUSE_REMOTE_REQUEST => 4

    /**
     * The media that carries the stream is temporarily not available.
     * @type {Integer (Int32)}
     */
    static CALL_CAUSE_MEDIA_TIMEOUT => 5

    /**
     * The media that carries the stream is back to normal from a temporary denial of service.
     * @type {Integer (Int32)}
     */
    static CALL_CAUSE_MEDIA_RECOVERED => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CALL_CAUSE_QUALITY_OF_SERVICE => 7
}
