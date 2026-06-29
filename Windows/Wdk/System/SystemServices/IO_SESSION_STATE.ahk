#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_SESSION_STATE {
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
    static IoSessionStateCreated => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateInitialized => 2

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateConnected => 3

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateDisconnected => 4

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateDisconnectedLoggedOn => 5

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateLoggedOn => 6

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateLoggedOff => 7

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateTerminated => 8

    /**
     * @type {Integer (Int32)}
     */
    static IoSessionStateMax => 9
}
