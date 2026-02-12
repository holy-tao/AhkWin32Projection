#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values used to indicate the class of data service provided by a WWAN network connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.wwandataclass
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class WwanDataClass extends Win32BitflagEnum{

    /**
     * The network does not provide a data service.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The network provides General Packet Radio Service (GPRS) data service.
     * @type {Integer (UInt32)}
     */
    static Gprs => 1

    /**
     * The network provides Enhanced Data for Global Evolution (EDGE).
     * @type {Integer (UInt32)}
     */
    static Edge => 2

    /**
     * The network provides Universal Mobile Telecommunications System (UMTS) data service.
     * @type {Integer (UInt32)}
     */
    static Umts => 4

    /**
     * The network provides High-Speed Downlink Packet Access (HSDPA) data service.
     * @type {Integer (UInt32)}
     */
    static Hsdpa => 8

    /**
     * The network provides High-Speed Uplink Packet Access (HSUPA) data service.
     * @type {Integer (UInt32)}
     */
    static Hsupa => 16

    /**
     * The network provides LTE Advanced data service.
     * @type {Integer (UInt32)}
     */
    static LteAdvanced => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NewRadioNonStandalone => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NewRadioStandalone => 128

    /**
     * The network provides CDMA 1x Radio Transmission Technology (1xRTT) data service.
     * @type {Integer (UInt32)}
     */
    static Cdma1xRtt => 65536

    /**
     * This network provides CDMA Evolution-Data Optimized (originally Data Only, 1xEDVO, also known as CDMA2000 1x EV-DO, or 1x EVDO) data service.
     * @type {Integer (UInt32)}
     */
    static Cdma1xEvdo => 131072

    /**
     * The network provides 1xEVDO RevA data service.
     * @type {Integer (UInt32)}
     */
    static Cdma1xEvdoRevA => 262144

    /**
     * The network provides CDMA Evolution-Data/Voice (also known as CDMA 2000 1x EV-DV, or 1x EVDV) data service is supported.
     * @type {Integer (UInt32)}
     */
    static Cdma1xEvdv => 524288

    /**
     * The network provides CDMA 3x Radio Transmission Technology (3xRTT) data service.
     * @type {Integer (UInt32)}
     */
    static Cdma3xRtt => 1048576

    /**
     * The network provides 1xEVDO RevB data service.
     * @type {Integer (UInt32)}
     */
    static Cdma1xEvdoRevB => 2097152

    /**
     * The network provides UMB data service.
     * @type {Integer (UInt32)}
     */
    static CdmaUmb => 4194304

    /**
     * The network provides a data service not listed in this table.
     * @type {Integer (UInt32)}
     */
    static Custom => 2147483648
}
