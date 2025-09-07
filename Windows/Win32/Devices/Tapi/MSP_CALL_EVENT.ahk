#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MSP_CALL_EVENT (msp.h) enumeration constant is returned within the MSP_EVENT_INFO struct by the GetEvent method when MSP_EVENT is ME_CALL_EVENT.
 * @see https://learn.microsoft.com/windows/win32/api/msp/ne-msp-msp_call_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class MSP_CALL_EVENT{

    /**
     * A new stream is created by the call. The application can choose to select a terminal or delete the stream from the call.
     * @type {Integer (Int32)}
     */
    static CALL_NEW_STREAM => 0

    /**
     * Setup of the stream failed or the stream fails to start.
     * @type {Integer (Int32)}
     */
    static CALL_STREAM_FAIL => 1

    /**
     * The terminal failed to connect.
     * @type {Integer (Int32)}
     */
    static CALL_TERMINAL_FAIL => 2

    /**
     * The stream is not used in the call (the remote party rejected it).
     * @type {Integer (Int32)}
     */
    static CALL_STREAM_NOT_USED => 3

    /**
     * The application needs this event to decide when a stream can be used to send and receive data. It is fired when the streams enter running state (the timing of which is determined by the TSP).
     * @type {Integer (Int32)}
     */
    static CALL_STREAM_ACTIVE => 4

    /**
     * No more data can be sent to or received from this stream. This happens when a send stream has sent all its data, or when a receive stream stops receiving data.
     * @type {Integer (Int32)}
     */
    static CALL_STREAM_INACTIVE => 5
}
