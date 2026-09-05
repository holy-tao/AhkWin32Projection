#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * . (MF_MEDIASOURCE_STATUS_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_mediasource_status_info
 * @namespace Windows.Win32.Media.Streaming
 */
class MF_MEDIASOURCE_STATUS_INFO extends Win32Enum {

    /**
     * The media source is fully supported.
     * Native name: MF_MEDIASOURCE_STATUS_INFO_FULLYSUPPORTED
     * @type {Integer (Int32)}
     */
    static FULLYSUPPORTED => 0

    /**
     * The status is unknown.
     * 
     * >>>>>>> master
     * Native name: MF_MEDIASOURCE_STATUS_INFO_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 1
}
