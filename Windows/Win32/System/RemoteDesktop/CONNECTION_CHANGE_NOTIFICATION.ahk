#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct CONNECTION_CHANGE_NOTIFICATION {
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
    static CONNECTION_REQUEST_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static CONNECTION_REQUEST_PENDING => 1

    /**
     * @type {Integer (Int32)}
     */
    static CONNECTION_REQUEST_FAILED => 2

    /**
     * @type {Integer (Int32)}
     */
    static CONNECTION_REQUEST_TIMEDOUT => 3

    /**
     * @type {Integer (Int32)}
     */
    static CONNECTION_REQUEST_SUCCEEDED => 4

    /**
     * @type {Integer (Int32)}
     */
    static CONNECTION_REQUEST_CANCELLED => 5

    /**
     * @type {Integer (Int32)}
     */
    static CONNECTION_REQUEST_LB_COMPLETED => 6

    /**
     * @type {Integer (Int32)}
     */
    static CONNECTION_REQUEST_QUERY_PL_COMPLETED => 7

    /**
     * @type {Integer (Int32)}
     */
    static CONNECTION_REQUEST_ORCH_COMPLETED => 8
}
