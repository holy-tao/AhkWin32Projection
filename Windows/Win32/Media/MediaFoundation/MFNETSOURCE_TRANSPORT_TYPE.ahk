#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the type of transport used in streaming or downloading data (TCP or UDP).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfnetsource_transport_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFNETSOURCE_TRANSPORT_TYPE extends Win32Enum {

    /**
     * The data transport type is UDP.
     * Native name: MFNETSOURCE_UDP
     * @type {Integer (Int32)}
     */
    static UDP => 0

    /**
     * The data transport type is TCP.
     * Native name: MFNETSOURCE_TCP
     * @type {Integer (Int32)}
     */
    static TCP => 1
}
