#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of control protocol that is used in streaming or downloading.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfnetsource_protocol_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFNETSOURCE_PROTOCOL_TYPE extends Win32Enum {

    /**
     * The protocol type has not yet been determined.
     * Native name: MFNETSOURCE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * The protocol type is HTTP. This includes HTTPv9, WMSP, and HTTP download.
     * Native name: MFNETSOURCE_HTTP
     * @type {Integer (Int32)}
     */
    static HTTP => 1

    /**
     * The protocol type is Real Time Streaming Protocol (RTSP).
     * Native name: MFNETSOURCE_RTSP
     * @type {Integer (Int32)}
     */
    static RTSP => 2

    /**
     * The content is read from a file. The file might be local or on a remote share.
     * Native name: MFNETSOURCE_FILE
     * @type {Integer (Int32)}
     */
    static FILE => 3

    /**
     * The protocol type is multicast.
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * Native name: MFNETSOURCE_MULTICAST
     * @type {Integer (Int32)}
     */
    static MULTICAST => 4
}
