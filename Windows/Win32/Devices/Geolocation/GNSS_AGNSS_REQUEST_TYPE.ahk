#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_AGNSS_REQUEST_TYPE extends Win32Enum {

    /**
     * Native name: GNSS_AGNSS_TimeInjection
     * @type {Integer (Int32)}
     */
    static TimeInjection => 1

    /**
     * Native name: GNSS_AGNSS_PositionInjection
     * @type {Integer (Int32)}
     */
    static PositionInjection => 2

    /**
     * Native name: GNSS_AGNSS_BlobInjection
     * @type {Integer (Int32)}
     */
    static BlobInjection => 3
}
