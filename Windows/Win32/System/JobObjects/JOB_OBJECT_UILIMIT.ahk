#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOB_OBJECT_UILIMIT {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
