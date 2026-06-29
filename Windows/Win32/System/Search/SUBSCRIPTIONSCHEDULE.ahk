#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct SUBSCRIPTIONSCHEDULE {
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
    static SUBSSCHED_AUTO => 0

    /**
     * @type {Integer (Int32)}
     */
    static SUBSSCHED_DAILY => 1

    /**
     * @type {Integer (Int32)}
     */
    static SUBSSCHED_WEEKLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static SUBSSCHED_CUSTOM => 3

    /**
     * @type {Integer (Int32)}
     */
    static SUBSSCHED_MANUAL => 4
}
