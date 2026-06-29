#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_ALLOCATION_ACTION {
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
    static KeepObject => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeallocateObject => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeallocateObjectKeepRegisters => 3
}
