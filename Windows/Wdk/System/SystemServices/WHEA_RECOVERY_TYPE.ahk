#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_RECOVERY_TYPE {
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
    static WheaRecoveryTypeActionRequired => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryTypeActionOptional => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryTypeMax => 3
}
