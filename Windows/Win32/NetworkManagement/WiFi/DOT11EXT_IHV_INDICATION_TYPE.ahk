#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11EXT_IHV_INDICATION_TYPE extends Win32Enum {

    /**
     * Native name: IndicationTypeNicSpecificNotification
     * @type {Integer (Int32)}
     */
    static NicSpecificNotification => 0

    /**
     * Native name: IndicationTypePmkidCandidateList
     * @type {Integer (Int32)}
     */
    static PmkidCandidateList => 1

    /**
     * Native name: IndicationTypeTkipMicFailure
     * @type {Integer (Int32)}
     */
    static TkipMicFailure => 2

    /**
     * Native name: IndicationTypePhyStateChange
     * @type {Integer (Int32)}
     */
    static PhyStateChange => 3

    /**
     * Native name: IndicationTypeLinkQuality
     * @type {Integer (Int32)}
     */
    static LinkQuality => 4
}
