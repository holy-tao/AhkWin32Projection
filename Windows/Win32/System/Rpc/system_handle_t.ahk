#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class system_handle_t extends Win32Enum {

    /**
     * Native name: SYSTEM_HANDLE_FILE
     * @type {Integer (Int32)}
     */
    static FILE => 0

    /**
     * Native name: SYSTEM_HANDLE_SEMAPHORE
     * @type {Integer (Int32)}
     */
    static SEMAPHORE => 1

    /**
     * Native name: SYSTEM_HANDLE_EVENT
     * @type {Integer (Int32)}
     */
    static EVENT => 2

    /**
     * Native name: SYSTEM_HANDLE_MUTEX
     * @type {Integer (Int32)}
     */
    static MUTEX => 3

    /**
     * Native name: SYSTEM_HANDLE_PROCESS
     * @type {Integer (Int32)}
     */
    static PROCESS => 4

    /**
     * Native name: SYSTEM_HANDLE_TOKEN
     * @type {Integer (Int32)}
     */
    static TOKEN => 5

    /**
     * Native name: SYSTEM_HANDLE_SECTION
     * @type {Integer (Int32)}
     */
    static SECTION => 6

    /**
     * Native name: SYSTEM_HANDLE_REG_KEY
     * @type {Integer (Int32)}
     */
    static REG_KEY => 7

    /**
     * Native name: SYSTEM_HANDLE_THREAD
     * @type {Integer (Int32)}
     */
    static THREAD => 8

    /**
     * Native name: SYSTEM_HANDLE_COMPOSITION_OBJECT
     * @type {Integer (Int32)}
     */
    static COMPOSITION_OBJECT => 9

    /**
     * Native name: SYSTEM_HANDLE_SOCKET
     * @type {Integer (Int32)}
     */
    static SOCKET => 10

    /**
     * Native name: SYSTEM_HANDLE_JOB
     * @type {Integer (Int32)}
     */
    static JOB => 11

    /**
     * Native name: SYSTEM_HANDLE_PIPE
     * @type {Integer (Int32)}
     */
    static PIPE => 12

    /**
     * Native name: SYSTEM_HANDLE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 12

    /**
     * Native name: SYSTEM_HANDLE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 255
}
