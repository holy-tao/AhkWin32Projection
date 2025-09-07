#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOB_OBJECT_IO_RATE_CONTROL_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static JOB_OBJECT_IO_RATE_CONTROL_ENABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static JOB_OBJECT_IO_RATE_CONTROL_STANDALONE_VOLUME => 2

    /**
     * @type {Integer (Int32)}
     */
    static JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ALL => 4

    /**
     * @type {Integer (Int32)}
     */
    static JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ON_SOFT_CAP => 8

    /**
     * @type {Integer (Int32)}
     */
    static JOB_OBJECT_IO_RATE_CONTROL_VALID_FLAGS => 15
}
