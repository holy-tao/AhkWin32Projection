#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a cellular data service supported by a mobile broadband network device.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.dataclasses
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class DataClasses extends Win32BitflagEnum{

    /**
     * No data services supported.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The device supports the GPRS data service implemented by GSM providers.
     * @type {Integer (UInt32)}
     */
    static Gprs => 1

    /**
     * The device supports the EDGE data service implemented by GSM providers.
     * @type {Integer (UInt32)}
     */
    static Edge => 2

    /**
     * The device supports the UMTS data service implemented by GSM providers.
     * @type {Integer (UInt32)}
     */
    static Umts => 4

    /**
     * The device supports the HSDPA data service implemented by GSM providers.
     * @type {Integer (UInt32)}
     */
    static Hsdpa => 8

    /**
     * The device supports the HSUPA (High Speed Uplink Packet Access) data service.
     * @type {Integer (UInt32)}
     */
    static Hsupa => 16

    /**
     * The device supports the LTE Advanced (LTE+) data service implemented by GSM providers.
     * @type {Integer (UInt32)}
     */
    static LteAdvanced => 32

    /**
     * Specifies the 5G non-standalone data service leveraging LTE core.
     * @type {Integer (UInt32)}
     */
    static NewRadioNonStandalone => 64

    /**
     * Specifies the advanced 5G data services leveraging 5G core.
     * @type {Integer (UInt32)}
     */
    static NewRadioStandalone => 128

    /**
     * The device supports the 1xRTT data service implemented by CDMA providers.
     * @type {Integer (UInt32)}
     */
    static Cdma1xRtt => 65536

    /**
     * The device supports the 1xEV-DO data service implemented by CDMA providers.
     * @type {Integer (UInt32)}
     */
    static Cdma1xEvdo => 131072

    /**
     * The device supports the 1xEV-DO RevA data service implemented by CDMA providers.
     * @type {Integer (UInt32)}
     */
    static Cdma1xEvdoRevA => 262144

    /**
     * The device supports the 1xEV-DV data service implemented by CDMA providers.
     * @type {Integer (UInt32)}
     */
    static Cdma1xEvdv => 524288

    /**
     * The device supports the 3xRTT data service implemented by CDMA providers.
     * @type {Integer (UInt32)}
     */
    static Cdma3xRtt => 1048576

    /**
     * The device supports the 1xEV-DO RevB data service, which is identified for future use.
     * @type {Integer (UInt32)}
     */
    static Cdma1xEvdoRevB => 2097152

    /**
     * The device supports the UMB data service implemented by CDMA providers.
     * @type {Integer (UInt32)}
     */
    static CdmaUmb => 4194304

    /**
     * The device supports a custom data service.
     * @type {Integer (UInt32)}
     */
    static Custom => 2147483648
}
