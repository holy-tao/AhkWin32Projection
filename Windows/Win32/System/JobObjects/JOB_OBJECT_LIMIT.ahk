#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 */
class JOB_OBJECT_LIMIT extends Win32BitflagEnum {

    /**
     * Native name: JOB_OBJECT_LIMIT_WORKINGSET
     * @type {Integer (UInt32)}
     */
    static WORKINGSET => 1

    /**
     * Native name: JOB_OBJECT_LIMIT_PROCESS_TIME
     * @type {Integer (UInt32)}
     */
    static PROCESS_TIME => 2

    /**
     * Native name: JOB_OBJECT_LIMIT_JOB_TIME
     * @type {Integer (UInt32)}
     */
    static JOB_TIME => 4

    /**
     * Native name: JOB_OBJECT_LIMIT_ACTIVE_PROCESS
     * @type {Integer (UInt32)}
     */
    static ACTIVE_PROCESS => 8

    /**
     * Native name: JOB_OBJECT_LIMIT_AFFINITY
     * @type {Integer (UInt32)}
     */
    static AFFINITY => 16

    /**
     * Native name: JOB_OBJECT_LIMIT_PRIORITY_CLASS
     * @type {Integer (UInt32)}
     */
    static PRIORITY_CLASS => 32

    /**
     * Native name: JOB_OBJECT_LIMIT_PRESERVE_JOB_TIME
     * @type {Integer (UInt32)}
     */
    static PRESERVE_JOB_TIME => 64

    /**
     * Native name: JOB_OBJECT_LIMIT_SCHEDULING_CLASS
     * @type {Integer (UInt32)}
     */
    static SCHEDULING_CLASS => 128

    /**
     * Native name: JOB_OBJECT_LIMIT_PROCESS_MEMORY
     * @type {Integer (UInt32)}
     */
    static PROCESS_MEMORY => 256

    /**
     * Native name: JOB_OBJECT_LIMIT_JOB_MEMORY
     * @type {Integer (UInt32)}
     */
    static JOB_MEMORY => 512

    /**
     * Native name: JOB_OBJECT_LIMIT_JOB_MEMORY_HIGH
     * @type {Integer (UInt32)}
     */
    static JOB_MEMORY_HIGH => 512

    /**
     * Native name: JOB_OBJECT_LIMIT_DIE_ON_UNHANDLED_EXCEPTION
     * @type {Integer (UInt32)}
     */
    static DIE_ON_UNHANDLED_EXCEPTION => 1024

    /**
     * Native name: JOB_OBJECT_LIMIT_BREAKAWAY_OK
     * @type {Integer (UInt32)}
     */
    static BREAKAWAY_OK => 2048

    /**
     * Native name: JOB_OBJECT_LIMIT_SILENT_BREAKAWAY_OK
     * @type {Integer (UInt32)}
     */
    static SILENT_BREAKAWAY_OK => 4096

    /**
     * Native name: JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE
     * @type {Integer (UInt32)}
     */
    static KILL_ON_JOB_CLOSE => 8192

    /**
     * Native name: JOB_OBJECT_LIMIT_SUBSET_AFFINITY
     * @type {Integer (UInt32)}
     */
    static SUBSET_AFFINITY => 16384

    /**
     * Native name: JOB_OBJECT_LIMIT_JOB_MEMORY_LOW
     * @type {Integer (UInt32)}
     */
    static JOB_MEMORY_LOW => 32768

    /**
     * Native name: JOB_OBJECT_LIMIT_JOB_READ_BYTES
     * @type {Integer (UInt32)}
     */
    static JOB_READ_BYTES => 65536

    /**
     * Native name: JOB_OBJECT_LIMIT_JOB_WRITE_BYTES
     * @type {Integer (UInt32)}
     */
    static JOB_WRITE_BYTES => 131072

    /**
     * Native name: JOB_OBJECT_LIMIT_RATE_CONTROL
     * @type {Integer (UInt32)}
     */
    static RATE_CONTROL => 262144

    /**
     * Native name: JOB_OBJECT_LIMIT_CPU_RATE_CONTROL
     * @type {Integer (UInt32)}
     */
    static CPU_RATE_CONTROL => 262144

    /**
     * Native name: JOB_OBJECT_LIMIT_IO_RATE_CONTROL
     * @type {Integer (UInt32)}
     */
    static IO_RATE_CONTROL => 524288

    /**
     * Native name: JOB_OBJECT_LIMIT_NET_RATE_CONTROL
     * @type {Integer (UInt32)}
     */
    static NET_RATE_CONTROL => 1048576

    /**
     * Native name: JOB_OBJECT_LIMIT_VALID_FLAGS
     * @type {Integer (UInt32)}
     */
    static VALID_FLAGS => 524287

    /**
     * Native name: JOB_OBJECT_BASIC_LIMIT_VALID_FLAGS
     * @type {Integer (UInt32)}
     */
    static BASIC_LIMIT_VALID_FLAGS => 255

    /**
     * Native name: JOB_OBJECT_EXTENDED_LIMIT_VALID_FLAGS
     * @type {Integer (UInt32)}
     */
    static EXTENDED_LIMIT_VALID_FLAGS => 32767

    /**
     * Native name: JOB_OBJECT_NOTIFICATION_LIMIT_VALID_FLAGS
     * @type {Integer (UInt32)}
     */
    static NOTIFICATION_LIMIT_VALID_FLAGS => 2064900
}
