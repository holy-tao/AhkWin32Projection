#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 */
class JOB_OBJECT_CPU_RATE_CONTROL extends Win32BitflagEnum {

    /**
     * Native name: JOB_OBJECT_CPU_RATE_CONTROL_ENABLE
     * @type {Integer (UInt32)}
     */
    static ENABLE => 1

    /**
     * Native name: JOB_OBJECT_CPU_RATE_CONTROL_WEIGHT_BASED
     * @type {Integer (UInt32)}
     */
    static WEIGHT_BASED => 2

    /**
     * Native name: JOB_OBJECT_CPU_RATE_CONTROL_HARD_CAP
     * @type {Integer (UInt32)}
     */
    static HARD_CAP => 4

    /**
     * Native name: JOB_OBJECT_CPU_RATE_CONTROL_NOTIFY
     * @type {Integer (UInt32)}
     */
    static NOTIFY => 8

    /**
     * Native name: JOB_OBJECT_CPU_RATE_CONTROL_MIN_MAX_RATE
     * @type {Integer (UInt32)}
     */
    static MIN_MAX_RATE => 16

    /**
     * Native name: JOB_OBJECT_CPU_RATE_CONTROL_VALID_FLAGS
     * @type {Integer (UInt32)}
     */
    static VALID_FLAGS => 63
}
