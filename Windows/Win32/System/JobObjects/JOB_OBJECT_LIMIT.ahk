#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOB_OBJECT_LIMIT extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_WORKINGSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_PROCESS_TIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_JOB_TIME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_ACTIVE_PROCESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_AFFINITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_PRIORITY_CLASS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_PRESERVE_JOB_TIME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_SCHEDULING_CLASS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_PROCESS_MEMORY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_JOB_MEMORY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_JOB_MEMORY_HIGH => 512

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_DIE_ON_UNHANDLED_EXCEPTION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_BREAKAWAY_OK => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_SILENT_BREAKAWAY_OK => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_SUBSET_AFFINITY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_JOB_MEMORY_LOW => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_JOB_READ_BYTES => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_JOB_WRITE_BYTES => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_RATE_CONTROL => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_CPU_RATE_CONTROL => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_IO_RATE_CONTROL => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_NET_RATE_CONTROL => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_LIMIT_VALID_FLAGS => 524287

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_BASIC_LIMIT_VALID_FLAGS => 255

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_EXTENDED_LIMIT_VALID_FLAGS => 32767

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_NOTIFICATION_LIMIT_VALID_FLAGS => 2064900
}
