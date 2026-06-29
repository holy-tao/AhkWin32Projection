#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOB_OBJECT_IO_RATE_CONTROL_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
