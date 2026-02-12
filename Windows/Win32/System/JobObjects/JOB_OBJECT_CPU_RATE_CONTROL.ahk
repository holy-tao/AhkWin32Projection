#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This flag enables the job's CPU rate to be controlled based on weight or hard cap. You must set this value if you also set <b>JOB_OBJECT_CPU_RATE_CONTROL_WEIGHT_BASED</b>,   <b>JOB_OBJECT_CPU_RATE_CONTROL_HARD_CAP</b>, or <b>JOB_OBJECT_CPU_RATE_CONTROL_MIN_MAX_RATE</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winnt/ns-winnt-jobobject_cpu_rate_control_information
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOB_OBJECT_CPU_RATE_CONTROL extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_CPU_RATE_CONTROL_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_CPU_RATE_CONTROL_WEIGHT_BASED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_CPU_RATE_CONTROL_HARD_CAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_CPU_RATE_CONTROL_NOTIFY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_CPU_RATE_CONTROL_MIN_MAX_RATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_CPU_RATE_CONTROL_VALID_FLAGS => 63
}
