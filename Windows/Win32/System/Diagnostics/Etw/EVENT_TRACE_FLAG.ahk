#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_TRACE_FLAG extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_ALPC => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_CSWITCH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_DBGPRINT => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_DISK_FILE_IO => 512

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_DISK_IO => 256

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_DISK_IO_INIT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_DISPATCHER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_DPC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_DRIVER => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_FILE_IO => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_FILE_IO_INIT => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_IMAGE_LOAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_INTERRUPT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_JOB => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_MEMORY_HARD_FAULTS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_MEMORY_PAGE_FAULTS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_NETWORK_TCPIP => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_NO_SYSCONFIG => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_PROCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_PROCESS_COUNTERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_PROFILE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_REGISTRY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_SPLIT_IO => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_SYSTEMCALL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_THREAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_VAMAP => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_VIRTUAL_ALLOC => 16384
}
