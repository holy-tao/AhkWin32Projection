#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 */
class JOB_OBJECT_UILIMIT extends Win32BitflagEnum {

    /**
     * Native name: JOB_OBJECT_UILIMIT_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: JOB_OBJECT_UILIMIT_HANDLES
     * @type {Integer (UInt32)}
     */
    static HANDLES => 1

    /**
     * Native name: JOB_OBJECT_UILIMIT_READCLIPBOARD
     * @type {Integer (UInt32)}
     */
    static READCLIPBOARD => 2

    /**
     * Native name: JOB_OBJECT_UILIMIT_WRITECLIPBOARD
     * @type {Integer (UInt32)}
     */
    static WRITECLIPBOARD => 4

    /**
     * Native name: JOB_OBJECT_UILIMIT_SYSTEMPARAMETERS
     * @type {Integer (UInt32)}
     */
    static SYSTEMPARAMETERS => 8

    /**
     * Native name: JOB_OBJECT_UILIMIT_DISPLAYSETTINGS
     * @type {Integer (UInt32)}
     */
    static DISPLAYSETTINGS => 16

    /**
     * Native name: JOB_OBJECT_UILIMIT_GLOBALATOMS
     * @type {Integer (UInt32)}
     */
    static GLOBALATOMS => 32

    /**
     * Native name: JOB_OBJECT_UILIMIT_DESKTOP
     * @type {Integer (UInt32)}
     */
    static DESKTOP => 64

    /**
     * Native name: JOB_OBJECT_UILIMIT_EXITWINDOWS
     * @type {Integer (UInt32)}
     */
    static EXITWINDOWS => 128
}
