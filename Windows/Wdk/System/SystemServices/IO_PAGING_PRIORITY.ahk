#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_PAGING_PRIORITY {
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
    static IoPagingPriorityInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static IoPagingPriorityNormal => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoPagingPriorityHigh => 2

    /**
     * @type {Integer (Int32)}
     */
    static IoPagingPriorityReserved1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static IoPagingPriorityReserved2 => 4
}
