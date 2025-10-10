#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the type of transport used in streaming or downloading data (TCP or UDP).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfnetsource_transport_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFNETSOURCE_TRANSPORT_TYPE{

    /**
     * The data transport type is UDP.
     * @type {Integer (Int32)}
     */
    static MFNETSOURCE_UDP => 0

    /**
     * The data transport type is TCP.
     * @type {Integer (Int32)}
     */
    static MFNETSOURCE_TCP => 1
}
