#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_ACCESS_RIGHTS{

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_TERMINATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATE_THREAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_SET_SESSIONID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_VM_OPERATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_VM_READ => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_VM_WRITE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_DUP_HANDLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATE_PROCESS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_SET_QUOTA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_SET_INFORMATION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_QUERY_INFORMATION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_SUSPEND_RESUME => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_QUERY_LIMITED_INFORMATION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_SET_LIMITED_INFORMATION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_ALL_ACCESS => 2097151

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_DELETE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_READ_CONTROL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_WRITE_DAC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_WRITE_OWNER => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_SYNCHRONIZE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_STANDARD_RIGHTS_REQUIRED => 983040
}
