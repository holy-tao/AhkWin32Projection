#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class THREAD_ACCESS_RIGHTS extends Win32BitflagEnum {

    /**
     * Native name: THREAD_TERMINATE
     * @type {Integer (UInt32)}
     */
    static TERMINATE => 1

    /**
     * Native name: THREAD_SUSPEND_RESUME
     * @type {Integer (UInt32)}
     */
    static SUSPEND_RESUME => 2

    /**
     * Native name: THREAD_GET_CONTEXT
     * @type {Integer (UInt32)}
     */
    static GET_CONTEXT => 8

    /**
     * Native name: THREAD_SET_CONTEXT
     * @type {Integer (UInt32)}
     */
    static SET_CONTEXT => 16

    /**
     * Native name: THREAD_SET_INFORMATION
     * @type {Integer (UInt32)}
     */
    static SET_INFORMATION => 32

    /**
     * Native name: THREAD_QUERY_INFORMATION
     * @type {Integer (UInt32)}
     */
    static QUERY_INFORMATION => 64

    /**
     * Native name: THREAD_SET_THREAD_TOKEN
     * @type {Integer (UInt32)}
     */
    static SET_THREAD_TOKEN => 128

    /**
     * Native name: THREAD_IMPERSONATE
     * @type {Integer (UInt32)}
     */
    static IMPERSONATE => 256

    /**
     * Native name: THREAD_DIRECT_IMPERSONATION
     * @type {Integer (UInt32)}
     */
    static DIRECT_IMPERSONATION => 512

    /**
     * Native name: THREAD_SET_LIMITED_INFORMATION
     * @type {Integer (UInt32)}
     */
    static SET_LIMITED_INFORMATION => 1024

    /**
     * Native name: THREAD_QUERY_LIMITED_INFORMATION
     * @type {Integer (UInt32)}
     */
    static QUERY_LIMITED_INFORMATION => 2048

    /**
     * Native name: THREAD_RESUME
     * @type {Integer (UInt32)}
     */
    static RESUME => 4096

    /**
     * Native name: THREAD_ALL_ACCESS
     * @type {Integer (UInt32)}
     */
    static ALL_ACCESS => 2097151

    /**
     * Native name: THREAD_DELETE
     * @type {Integer (UInt32)}
     */
    static DELETE => 65536

    /**
     * Native name: THREAD_READ_CONTROL
     * @type {Integer (UInt32)}
     */
    static READ_CONTROL => 131072

    /**
     * Native name: THREAD_WRITE_DAC
     * @type {Integer (UInt32)}
     */
    static WRITE_DAC => 262144

    /**
     * Native name: THREAD_WRITE_OWNER
     * @type {Integer (UInt32)}
     */
    static WRITE_OWNER => 524288

    /**
     * Native name: THREAD_SYNCHRONIZE
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZE => 1048576

    /**
     * Native name: THREAD_STANDARD_RIGHTS_REQUIRED
     * @type {Integer (UInt32)}
     */
    static STANDARD_RIGHTS_REQUIRED => 983040
}
