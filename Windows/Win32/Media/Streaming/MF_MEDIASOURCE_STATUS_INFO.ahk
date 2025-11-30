#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_mediasource_status_info
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class MF_MEDIASOURCE_STATUS_INFO extends Win32Enum{

    /**
     * The media source is fully supported.
     * @type {Integer (Int32)}
     */
    static MF_MEDIASOURCE_STATUS_INFO_FULLYSUPPORTED => 0

    /**
     * The status is unknown.
     * 
     * >>>>>>> master
     * @type {Integer (Int32)}
     */
    static MF_MEDIASOURCE_STATUS_INFO_UNKNOWN => 1
}
