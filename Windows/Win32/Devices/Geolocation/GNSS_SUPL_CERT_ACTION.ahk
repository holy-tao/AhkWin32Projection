#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_SUPL_CERT_ACTION extends Win32Enum {

    /**
     * Native name: GNSS_Supl_Cert_Inject
     * @type {Integer (Int32)}
     */
    static Inject => 1

    /**
     * Native name: GNSS_Supl_Cert_Delete
     * @type {Integer (Int32)}
     */
    static Delete => 2

    /**
     * Native name: GNSS_Supl_Cert_Purge
     * @type {Integer (Int32)}
     */
    static Purge => 3
}
