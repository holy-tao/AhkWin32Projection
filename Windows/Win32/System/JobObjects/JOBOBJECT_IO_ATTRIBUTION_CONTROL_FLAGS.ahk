#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_IO_ATTRIBUTION_CONTROL_FLAGS {
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
    static JOBOBJECT_IO_ATTRIBUTION_CONTROL_ENABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static JOBOBJECT_IO_ATTRIBUTION_CONTROL_DISABLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static JOBOBJECT_IO_ATTRIBUTION_CONTROL_VALID_FLAGS => 3
}
