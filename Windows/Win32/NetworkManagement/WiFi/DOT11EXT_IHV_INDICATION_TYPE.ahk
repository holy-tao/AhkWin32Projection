#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_IHV_INDICATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IndicationTypeNicSpecificNotification => 0

    /**
     * @type {Integer (Int32)}
     */
    static IndicationTypePmkidCandidateList => 1

    /**
     * @type {Integer (Int32)}
     */
    static IndicationTypeTkipMicFailure => 2

    /**
     * @type {Integer (Int32)}
     */
    static IndicationTypePhyStateChange => 3

    /**
     * @type {Integer (Int32)}
     */
    static IndicationTypeLinkQuality => 4
}
