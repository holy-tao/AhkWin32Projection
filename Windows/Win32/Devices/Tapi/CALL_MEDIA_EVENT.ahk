#Requires AutoHotkey v2.0.0 64-bit

/**
 * The CALL_MEDIA_EVENT enum describes call media events. The ITCallMediaEvent::get_Event method returns a member of this enum to indicate the type of call media event that occurred.
 * @remarks
 * 
 * Due to latency, stream events may continue for a few seconds after a stream or related call session has been torn down.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-call_media_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class CALL_MEDIA_EVENT{

    /**
     * A new media stream has been created.
     * @type {Integer (Int32)}
     */
    static CME_NEW_STREAM => 0

    /**
     * A media stream or stream request has failed.
     * @type {Integer (Int32)}
     */
    static CME_STREAM_FAIL => 1

    /**
     * A terminal has failed.
     * @type {Integer (Int32)}
     */
    static CME_TERMINAL_FAIL => 2

    /**
     * The media stream has not been used.
     * @type {Integer (Int32)}
     */
    static CME_STREAM_NOT_USED => 3

    /**
     * The media stream is active.
     * @type {Integer (Int32)}
     */
    static CME_STREAM_ACTIVE => 4

    /**
     * The media stream is not active.
     * @type {Integer (Int32)}
     */
    static CME_STREAM_INACTIVE => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CME_LASTITEM => 5
}
