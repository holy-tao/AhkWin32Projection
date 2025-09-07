#Requires AutoHotkey v2.0.0 64-bit

/**
 * The CALL_MEDIA_EVENT_CAUSE enum is used by ITCallMediaEvent::get_Cause method to return a description of what caused a media event, such as a device timeout.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-call_media_event_cause
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class CALL_MEDIA_EVENT_CAUSE{

    /**
     * Call media is unknown.
     * @type {Integer (Int32)}
     */
    static CMC_UNKNOWN => 0

    /**
     * Device source or renderer is not functioning.
     * @type {Integer (Int32)}
     */
    static CMC_BAD_DEVICE => 1

    /**
     * Could not connect to media device.
     * @type {Integer (Int32)}
     */
    static CMC_CONNECT_FAIL => 2

    /**
     * A local request has been received.
     * @type {Integer (Int32)}
     */
    static CMC_LOCAL_REQUEST => 3

    /**
     * A remote request has been received.
     * @type {Integer (Int32)}
     */
    static CMC_REMOTE_REQUEST => 4

    /**
     * The media device timed out.
     * @type {Integer (Int32)}
     */
    static CMC_MEDIA_TIMEOUT => 5

    /**
     * Media processing has resumed after an interruption.
     * @type {Integer (Int32)}
     */
    static CMC_MEDIA_RECOVERED => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CMC_QUALITY_OF_SERVICE => 7
}
