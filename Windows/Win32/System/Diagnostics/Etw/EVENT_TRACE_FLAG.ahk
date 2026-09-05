#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class EVENT_TRACE_FLAG extends Win32BitflagEnum {

    /**
     * Native name: EVENT_TRACE_FLAG_ALPC
     * @type {Integer (UInt32)}
     */
    static ALPC => 1048576

    /**
     * Native name: EVENT_TRACE_FLAG_CSWITCH
     * @type {Integer (UInt32)}
     */
    static CSWITCH => 16

    /**
     * Native name: EVENT_TRACE_FLAG_DBGPRINT
     * @type {Integer (UInt32)}
     */
    static DBGPRINT => 262144

    /**
     * Native name: EVENT_TRACE_FLAG_DISK_FILE_IO
     * @type {Integer (UInt32)}
     */
    static DISK_FILE_IO => 512

    /**
     * Native name: EVENT_TRACE_FLAG_DISK_IO
     * @type {Integer (UInt32)}
     */
    static DISK_IO => 256

    /**
     * Native name: EVENT_TRACE_FLAG_DISK_IO_INIT
     * @type {Integer (UInt32)}
     */
    static DISK_IO_INIT => 1024

    /**
     * Native name: EVENT_TRACE_FLAG_DISPATCHER
     * @type {Integer (UInt32)}
     */
    static DISPATCHER => 2048

    /**
     * Native name: EVENT_TRACE_FLAG_DPC
     * @type {Integer (UInt32)}
     */
    static DPC => 32

    /**
     * Native name: EVENT_TRACE_FLAG_DRIVER
     * @type {Integer (UInt32)}
     */
    static DRIVER => 8388608

    /**
     * Native name: EVENT_TRACE_FLAG_FILE_IO
     * @type {Integer (UInt32)}
     */
    static FILE_IO => 33554432

    /**
     * Native name: EVENT_TRACE_FLAG_FILE_IO_INIT
     * @type {Integer (UInt32)}
     */
    static FILE_IO_INIT => 67108864

    /**
     * Native name: EVENT_TRACE_FLAG_IMAGE_LOAD
     * @type {Integer (UInt32)}
     */
    static IMAGE_LOAD => 4

    /**
     * Native name: EVENT_TRACE_FLAG_INTERRUPT
     * @type {Integer (UInt32)}
     */
    static INTERRUPT => 64

    /**
     * Native name: EVENT_TRACE_FLAG_JOB
     * @type {Integer (UInt32)}
     */
    static JOB => 524288

    /**
     * Native name: EVENT_TRACE_FLAG_MEMORY_HARD_FAULTS
     * @type {Integer (UInt32)}
     */
    static MEMORY_HARD_FAULTS => 8192

    /**
     * Native name: EVENT_TRACE_FLAG_MEMORY_PAGE_FAULTS
     * @type {Integer (UInt32)}
     */
    static MEMORY_PAGE_FAULTS => 4096

    /**
     * Native name: EVENT_TRACE_FLAG_NETWORK_TCPIP
     * @type {Integer (UInt32)}
     */
    static NETWORK_TCPIP => 65536

    /**
     * Native name: EVENT_TRACE_FLAG_NO_SYSCONFIG
     * @type {Integer (UInt32)}
     */
    static NO_SYSCONFIG => 268435456

    /**
     * Native name: EVENT_TRACE_FLAG_PROCESS
     * @type {Integer (UInt32)}
     */
    static PROCESS => 1

    /**
     * Native name: EVENT_TRACE_FLAG_PROCESS_COUNTERS
     * @type {Integer (UInt32)}
     */
    static PROCESS_COUNTERS => 8

    /**
     * Native name: EVENT_TRACE_FLAG_PROFILE
     * @type {Integer (UInt32)}
     */
    static PROFILE => 16777216

    /**
     * Native name: EVENT_TRACE_FLAG_REGISTRY
     * @type {Integer (UInt32)}
     */
    static REGISTRY => 131072

    /**
     * Native name: EVENT_TRACE_FLAG_SPLIT_IO
     * @type {Integer (UInt32)}
     */
    static SPLIT_IO => 2097152

    /**
     * Native name: EVENT_TRACE_FLAG_SYSTEMCALL
     * @type {Integer (UInt32)}
     */
    static SYSTEMCALL => 128

    /**
     * Native name: EVENT_TRACE_FLAG_THREAD
     * @type {Integer (UInt32)}
     */
    static THREAD => 2

    /**
     * Native name: EVENT_TRACE_FLAG_VAMAP
     * @type {Integer (UInt32)}
     */
    static VAMAP => 32768

    /**
     * Native name: EVENT_TRACE_FLAG_VIRTUAL_ALLOC
     * @type {Integer (UInt32)}
     */
    static VIRTUAL_ALLOC => 16384
}
