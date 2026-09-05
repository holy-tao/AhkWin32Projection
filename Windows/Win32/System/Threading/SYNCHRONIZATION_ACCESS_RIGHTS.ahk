#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class SYNCHRONIZATION_ACCESS_RIGHTS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ALL_ACCESS => 2031619

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_MODIFY_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MUTEX_ALL_ACCESS => 2031617

    /**
     * @type {Integer (UInt32)}
     */
    static MUTEX_MODIFY_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEMAPHORE_ALL_ACCESS => 2031619

    /**
     * @type {Integer (UInt32)}
     */
    static SEMAPHORE_MODIFY_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TIMER_ALL_ACCESS => 2031619

    /**
     * @type {Integer (UInt32)}
     */
    static TIMER_MODIFY_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TIMER_QUERY_STATE => 1

    /**
     * Native name: SYNCHRONIZATION_DELETE
     * @type {Integer (UInt32)}
     */
    static DELETE => 65536

    /**
     * Native name: SYNCHRONIZATION_READ_CONTROL
     * @type {Integer (UInt32)}
     */
    static READ_CONTROL => 131072

    /**
     * Native name: SYNCHRONIZATION_WRITE_DAC
     * @type {Integer (UInt32)}
     */
    static WRITE_DAC => 262144

    /**
     * Native name: SYNCHRONIZATION_WRITE_OWNER
     * @type {Integer (UInt32)}
     */
    static WRITE_OWNER => 524288

    /**
     * Native name: SYNCHRONIZATION_SYNCHRONIZE
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZE => 1048576
}
