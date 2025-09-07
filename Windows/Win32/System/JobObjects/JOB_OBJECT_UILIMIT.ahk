#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOB_OBJECT_UILIMIT{

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_HANDLES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_READCLIPBOARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_WRITECLIPBOARD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_SYSTEMPARAMETERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_DISPLAYSETTINGS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_GLOBALATOMS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_DESKTOP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_EXITWINDOWS => 128
}
