#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_IHV_INDICATION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
