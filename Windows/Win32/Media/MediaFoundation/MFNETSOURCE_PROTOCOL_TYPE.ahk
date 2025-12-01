#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of control protocol that is used in streaming or downloading.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfnetsource_protocol_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFNETSOURCE_PROTOCOL_TYPE extends Win32Enum{

    /**
     * The protocol type has not yet been determined.
     * @type {Integer (Int32)}
     */
    static MFNETSOURCE_UNDEFINED => 0

    /**
     * The protocol type is HTTP. This includes HTTPv9, WMSP, and HTTP download.
     * @type {Integer (Int32)}
     */
    static MFNETSOURCE_HTTP => 1

    /**
     * The protocol type is Real Time Streaming Protocol (RTSP).
     * @type {Integer (Int32)}
     */
    static MFNETSOURCE_RTSP => 2

    /**
     * The content is read from a file. The file might be local or on a remote share.
     * @type {Integer (Int32)}
     */
    static MFNETSOURCE_FILE => 3

    /**
     * The protocol type is multicast.
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFNETSOURCE_MULTICAST => 4
}
