#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PO_FX_PERF_STATE_UNIT {
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
    static PoFxPerfStateUnitOther => 0

    /**
     * @type {Integer (Int32)}
     */
    static PoFxPerfStateUnitFrequency => 1

    /**
     * @type {Integer (Int32)}
     */
    static PoFxPerfStateUnitBandwidth => 2

    /**
     * @type {Integer (Int32)}
     */
    static PoFxPerfStateUnitMaximum => 3
}
