#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_DATA_CLASS enumerated type specifies the data classes that a provider supports.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_data_class
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_DATA_CLASS extends Win32Enum {

    /**
     * No data class.
     * Native name: MBN_DATA_CLASS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The GPRS data class implemented by GSM providers.
     * Native name: MBN_DATA_CLASS_GPRS
     * @type {Integer (Int32)}
     */
    static GPRS => 1

    /**
     * The EDGE data class implemented by GSM providers.
     * Native name: MBN_DATA_CLASS_EDGE
     * @type {Integer (Int32)}
     */
    static EDGE => 2

    /**
     * The UMTS data class implemented by mobile radio providers.
     * Native name: MBN_DATA_CLASS_UMTS
     * @type {Integer (Int32)}
     */
    static UMTS => 4

    /**
     * The HSDPA data class implemented by mobile radio providers.
     * Native name: MBN_DATA_CLASS_HSDPA
     * @type {Integer (Int32)}
     */
    static HSDPA => 8

    /**
     * The HSUPA (High Speed Uplink Packet Access) data class.
     * Native name: MBN_DATA_CLASS_HSUPA
     * @type {Integer (Int32)}
     */
    static HSUPA => 16

    /**
     * The LTE data class implemented by mobile radio providers.
     * Native name: MBN_DATA_CLASS_LTE
     * @type {Integer (Int32)}
     */
    static LTE => 32

    /**
     * Native name: MBN_DATA_CLASS_5G_NSA
     * @type {Integer (Int32)}
     */
    static 5G_NSA => 64

    /**
     * Native name: MBN_DATA_CLASS_5G_SA
     * @type {Integer (Int32)}
     */
    static 5G_SA => 128

    /**
     * The 1xRTT data class implemented by CDMA providers.
     * Native name: MBN_DATA_CLASS_1XRTT
     * @type {Integer (Int32)}
     */
    static 1XRTT => 65536

    /**
     * The IxEV-DO data class implemented by CDMA providers.
     * Native name: MBN_DATA_CLASS_1XEVDO
     * @type {Integer (Int32)}
     */
    static 1XEVDO => 131072

    /**
     * The IxEV-DO RevA data class implemented by CDMA providers.
     * Native name: MBN_DATA_CLASS_1XEVDO_REVA
     * @type {Integer (Int32)}
     */
    static 1XEVDO_REVA => 262144

    /**
     * The 1xXEV-DV data class.
     * Native name: MBN_DATA_CLASS_1XEVDV
     * @type {Integer (Int32)}
     */
    static 1XEVDV => 524288

    /**
     * The 3xRTT data class.
     * Native name: MBN_DATA_CLASS_3XRTT
     * @type {Integer (Int32)}
     */
    static 3XRTT => 1048576

    /**
     * The 1xEV-DO RevB data class, which is defined for future use.
     * Native name: MBN_DATA_CLASS_1XEVDO_REVB
     * @type {Integer (Int32)}
     */
    static 1XEVDO_REVB => 2097152

    /**
     * The UMB data class.
     * Native name: MBN_DATA_CLASS_UMB
     * @type {Integer (Int32)}
     */
    static UMB => 4194304

    /**
     * The custom data class.
     * Native name: MBN_DATA_CLASS_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => -2147483648
}
