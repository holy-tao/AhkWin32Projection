#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AM_WST_SERVICE enumeration is not supported.
 * @see https://docs.microsoft.com/windows/win32/api//iwstdec/ne-iwstdec-am_wst_service
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_WST_SERVICE{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_WST_SERVICE_None => 0

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_WST_SERVICE_Text => 1

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_WST_SERVICE_IDS => 2

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_WST_SERVICE_Invalid => 3
}
