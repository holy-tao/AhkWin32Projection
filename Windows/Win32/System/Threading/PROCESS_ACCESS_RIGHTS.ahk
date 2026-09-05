#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class PROCESS_ACCESS_RIGHTS extends Win32BitflagEnum {

    /**
     * Native name: PROCESS_TERMINATE
     * @type {Integer (UInt32)}
     */
    static TERMINATE => 1

    /**
     * Native name: PROCESS_CREATE_THREAD
     * @type {Integer (UInt32)}
     */
    static CREATE_THREAD => 2

    /**
     * Native name: PROCESS_SET_SESSIONID
     * @type {Integer (UInt32)}
     */
    static SET_SESSIONID => 4

    /**
     * Native name: PROCESS_VM_OPERATION
     * @type {Integer (UInt32)}
     */
    static VM_OPERATION => 8

    /**
     * Native name: PROCESS_VM_READ
     * @type {Integer (UInt32)}
     */
    static VM_READ => 16

    /**
     * Native name: PROCESS_VM_WRITE
     * @type {Integer (UInt32)}
     */
    static VM_WRITE => 32

    /**
     * Native name: PROCESS_DUP_HANDLE
     * @type {Integer (UInt32)}
     */
    static DUP_HANDLE => 64

    /**
     * Native name: PROCESS_CREATE_PROCESS
     * @type {Integer (UInt32)}
     */
    static CREATE_PROCESS => 128

    /**
     * Native name: PROCESS_SET_QUOTA
     * @type {Integer (UInt32)}
     */
    static SET_QUOTA => 256

    /**
     * Native name: PROCESS_SET_INFORMATION
     * @type {Integer (UInt32)}
     */
    static SET_INFORMATION => 512

    /**
     * Native name: PROCESS_QUERY_INFORMATION
     * @type {Integer (UInt32)}
     */
    static QUERY_INFORMATION => 1024

    /**
     * Native name: PROCESS_SUSPEND_RESUME
     * @type {Integer (UInt32)}
     */
    static SUSPEND_RESUME => 2048

    /**
     * Native name: PROCESS_QUERY_LIMITED_INFORMATION
     * @type {Integer (UInt32)}
     */
    static QUERY_LIMITED_INFORMATION => 4096

    /**
     * Native name: PROCESS_SET_LIMITED_INFORMATION
     * @type {Integer (UInt32)}
     */
    static SET_LIMITED_INFORMATION => 8192

    /**
     * Native name: PROCESS_ALL_ACCESS
     * @type {Integer (UInt32)}
     */
    static ALL_ACCESS => 2097151

    /**
     * Native name: PROCESS_DELETE
     * @type {Integer (UInt32)}
     */
    static DELETE => 65536

    /**
     * Native name: PROCESS_READ_CONTROL
     * @type {Integer (UInt32)}
     */
    static READ_CONTROL => 131072

    /**
     * Native name: PROCESS_WRITE_DAC
     * @type {Integer (UInt32)}
     */
    static WRITE_DAC => 262144

    /**
     * Native name: PROCESS_WRITE_OWNER
     * @type {Integer (UInt32)}
     */
    static WRITE_OWNER => 524288

    /**
     * Native name: PROCESS_SYNCHRONIZE
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZE => 1048576

    /**
     * Native name: PROCESS_STANDARD_RIGHTS_REQUIRED
     * @type {Integer (UInt32)}
     */
    static STANDARD_RIGHTS_REQUIRED => 983040
}
