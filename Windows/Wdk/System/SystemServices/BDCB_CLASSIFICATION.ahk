#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct BDCB_CLASSIFICATION {
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
    static BdCbClassificationUnknownImage => 0

    /**
     * @type {Integer (Int32)}
     */
    static BdCbClassificationKnownGoodImage => 1

    /**
     * @type {Integer (Int32)}
     */
    static BdCbClassificationKnownBadImage => 2

    /**
     * @type {Integer (Int32)}
     */
    static BdCbClassificationKnownBadImageBootCritical => 3

    /**
     * @type {Integer (Int32)}
     */
    static BdCbClassificationEnd => 4
}
