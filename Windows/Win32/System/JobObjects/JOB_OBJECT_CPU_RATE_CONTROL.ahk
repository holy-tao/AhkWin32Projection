#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOB_OBJECT_CPU_RATE_CONTROL{

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
