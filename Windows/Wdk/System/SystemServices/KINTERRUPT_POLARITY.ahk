#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KINTERRUPT_POLARITY {
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
    static InterruptPolarityUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static InterruptActiveHigh => 1

    /**
     * @type {Integer (Int32)}
     */
    static InterruptRisingEdge => 1

    /**
     * @type {Integer (Int32)}
     */
    static InterruptActiveLow => 2

    /**
     * @type {Integer (Int32)}
     */
    static InterruptFallingEdge => 2

    /**
     * @type {Integer (Int32)}
     */
    static InterruptActiveBoth => 3

    /**
     * @type {Integer (Int32)}
     */
    static InterruptActiveBothTriggerLow => 3

    /**
     * @type {Integer (Int32)}
     */
    static InterruptActiveBothTriggerHigh => 4
}
