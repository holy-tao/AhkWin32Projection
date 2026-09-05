#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MSP_CALL_EVENT (msp.h) enumeration constant is returned within the MSP_EVENT_INFO struct by the GetEvent method when MSP_EVENT is ME_CALL_EVENT.
 * @see https://learn.microsoft.com/windows/win32/api/msp/ne-msp-msp_call_event
 * @namespace Windows.Win32.Devices.Tapi
 */
class MSP_CALL_EVENT extends Win32Enum {

    /**
     * A new stream is created by the call. The application can choose to select a terminal or delete the stream from the call.
     * Native name: CALL_NEW_STREAM
     * @type {Integer (Int32)}
     */
    static NEW_STREAM => 0

    /**
     * Setup of the stream failed or the stream fails to start.
     * Native name: CALL_STREAM_FAIL
     * @type {Integer (Int32)}
     */
    static STREAM_FAIL => 1

    /**
     * The terminal failed to connect.
     * Native name: CALL_TERMINAL_FAIL
     * @type {Integer (Int32)}
     */
    static TERMINAL_FAIL => 2

    /**
     * The stream is not used in the call (the remote party rejected it).
     * Native name: CALL_STREAM_NOT_USED
     * @type {Integer (Int32)}
     */
    static STREAM_NOT_USED => 3

    /**
     * The application needs this event to decide when a stream can be used to send and receive data. It is fired when the streams enter running state (the timing of which is determined by the TSP).
     * Native name: CALL_STREAM_ACTIVE
     * @type {Integer (Int32)}
     */
    static STREAM_ACTIVE => 4

    /**
     * No more data can be sent to or received from this stream. This happens when a send stream has sent all its data, or when a receive stream stops receiving data.
     * Native name: CALL_STREAM_INACTIVE
     * @type {Integer (Int32)}
     */
    static STREAM_INACTIVE => 5
}
