#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct system_handle_t {
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
    static SYSTEM_HANDLE_FILE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_SEMAPHORE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_EVENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_MUTEX => 3

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_PROCESS => 4

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_TOKEN => 5

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_SECTION => 6

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_REG_KEY => 7

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_THREAD => 8

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_COMPOSITION_OBJECT => 9

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_SOCKET => 10

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_JOB => 11

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_PIPE => 12

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_MAX => 12

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_HANDLE_INVALID => 255
}
