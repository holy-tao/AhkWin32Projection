#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct EX_POOL_PRIORITY {
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
    static LowPoolPriority => 0

    /**
     * @type {Integer (Int32)}
     */
    static LowPoolPrioritySpecialPoolOverrun => 8

    /**
     * @type {Integer (Int32)}
     */
    static LowPoolPrioritySpecialPoolUnderrun => 9

    /**
     * @type {Integer (Int32)}
     */
    static NormalPoolPriority => 16

    /**
     * @type {Integer (Int32)}
     */
    static NormalPoolPrioritySpecialPoolOverrun => 24

    /**
     * @type {Integer (Int32)}
     */
    static NormalPoolPrioritySpecialPoolUnderrun => 25

    /**
     * @type {Integer (Int32)}
     */
    static HighPoolPriority => 32

    /**
     * @type {Integer (Int32)}
     */
    static HighPoolPrioritySpecialPoolOverrun => 40

    /**
     * @type {Integer (Int32)}
     */
    static HighPoolPrioritySpecialPoolUnderrun => 41
}
