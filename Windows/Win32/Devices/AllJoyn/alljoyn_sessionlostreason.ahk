#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_sessionlostreason {
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
    static ALLJOYN_SESSIONLOST_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_SESSIONLOST_REMOTE_END_LEFT_SESSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_SESSIONLOST_REMOTE_END_CLOSED_ABRUPTLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_SESSIONLOST_REMOVED_BY_BINDER => 3

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_SESSIONLOST_LINK_TIMEOUT => 4

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_SESSIONLOST_REASON_OTHER => 5
}
