#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_ACCESS_TYPE {
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
    static ReadAccess => 0

    /**
     * @type {Integer (Int32)}
     */
    static WriteAccess => 1

    /**
     * @type {Integer (Int32)}
     */
    static ModifyAccess => 2
}
