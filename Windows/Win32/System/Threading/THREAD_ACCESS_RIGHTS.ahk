#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class THREAD_ACCESS_RIGHTS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_TERMINATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_SUSPEND_RESUME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_GET_CONTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_SET_CONTEXT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_SET_INFORMATION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_QUERY_INFORMATION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_SET_THREAD_TOKEN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_IMPERSONATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_DIRECT_IMPERSONATION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_SET_LIMITED_INFORMATION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_QUERY_LIMITED_INFORMATION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_RESUME => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_ALL_ACCESS => 2097151

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_DELETE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_READ_CONTROL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_WRITE_DAC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_WRITE_OWNER => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_SYNCHRONIZE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_STANDARD_RIGHTS_REQUIRED => 983040
}
