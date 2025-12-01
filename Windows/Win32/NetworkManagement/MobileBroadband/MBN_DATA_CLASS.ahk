#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_DATA_CLASS enumerated type specifies the data classes that a provider supports.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_data_class
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_DATA_CLASS extends Win32Enum{

    /**
     * No data class.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_NONE => 0

    /**
     * The GPRS data class implemented by GSM providers.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_GPRS => 1

    /**
     * The EDGE data class implemented by GSM providers.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_EDGE => 2

    /**
     * The UMTS data class implemented by mobile radio providers.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_UMTS => 4

    /**
     * The HSDPA data class implemented by mobile radio providers.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_HSDPA => 8

    /**
     * The HSUPA (High Speed Uplink Packet Access) data class.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_HSUPA => 16

    /**
     * The LTE data class implemented by mobile radio providers.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_LTE => 32

    /**
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_5G_NSA => 64

    /**
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_5G_SA => 128

    /**
     * The 1xRTT data class implemented by CDMA providers.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_1XRTT => 65536

    /**
     * The IxEV-DO data class implemented by CDMA providers.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_1XEVDO => 131072

    /**
     * The IxEV-DO RevA data class implemented by CDMA providers.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_1XEVDO_REVA => 262144

    /**
     * The 1xXEV-DV data class.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_1XEVDV => 524288

    /**
     * The 3xRTT data class.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_3XRTT => 1048576

    /**
     * The 1xEV-DO RevB data class, which is defined for future use.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_1XEVDO_REVB => 2097152

    /**
     * The UMB data class.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_UMB => 4194304

    /**
     * The custom data class.
     * @type {Integer (Int32)}
     */
    static MBN_DATA_CLASS_CUSTOM => -2147483648
}
