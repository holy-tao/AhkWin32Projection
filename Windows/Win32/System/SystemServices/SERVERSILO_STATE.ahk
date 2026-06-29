#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SERVERSILO_STATE {
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
    static SERVERSILO_INITING => 0

    /**
     * @type {Integer (Int32)}
     */
    static SERVERSILO_STARTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SERVERSILO_SHUTTING_DOWN => 2

    /**
     * @type {Integer (Int32)}
     */
    static SERVERSILO_TERMINATING => 3

    /**
     * @type {Integer (Int32)}
     */
    static SERVERSILO_TERMINATED => 4
}
