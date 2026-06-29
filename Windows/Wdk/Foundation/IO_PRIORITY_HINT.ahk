#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct IO_PRIORITY_HINT {
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
    static IoPriorityVeryLow => 0

    /**
     * @type {Integer (Int32)}
     */
    static IoPriorityLow => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoPriorityNormal => 2

    /**
     * @type {Integer (Int32)}
     */
    static IoPriorityHigh => 3

    /**
     * @type {Integer (Int32)}
     */
    static IoPriorityCritical => 4

    /**
     * @type {Integer (Int32)}
     */
    static MaxIoPriorityTypes => 5
}
