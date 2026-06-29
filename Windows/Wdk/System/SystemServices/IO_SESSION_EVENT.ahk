#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_SESSION_EVENT {
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
    static IoSessionEventIgnore => 0

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventCreated => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventTerminated => 2

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventConnected => 3

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventDisconnected => 4

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventLogon => 5

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventLogoff => 6

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionEventMax => 7
}
