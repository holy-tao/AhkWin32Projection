#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 */
class JOB_OBJECT_IO_RATE_CONTROL_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: JOB_OBJECT_IO_RATE_CONTROL_ENABLE
     * @type {Integer (Int32)}
     */
    static ENABLE => 1

    /**
     * Native name: JOB_OBJECT_IO_RATE_CONTROL_STANDALONE_VOLUME
     * @type {Integer (Int32)}
     */
    static STANDALONE_VOLUME => 2

    /**
     * Native name: JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ALL
     * @type {Integer (Int32)}
     */
    static FORCE_UNIT_ACCESS_ALL => 4

    /**
     * Native name: JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ON_SOFT_CAP
     * @type {Integer (Int32)}
     */
    static FORCE_UNIT_ACCESS_ON_SOFT_CAP => 8

    /**
     * Native name: JOB_OBJECT_IO_RATE_CONTROL_VALID_FLAGS
     * @type {Integer (Int32)}
     */
    static VALID_FLAGS => 15
}
