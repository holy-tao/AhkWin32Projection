#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_PROTOCOL_UFS_DATA_TYPE {
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
    static UfsDataTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static UfsDataTypeQueryDescriptor => 1

    /**
     * @type {Integer (Int32)}
     */
    static UfsDataTypeQueryAttribute => 2

    /**
     * @type {Integer (Int32)}
     */
    static UfsDataTypeQueryFlag => 3

    /**
     * @type {Integer (Int32)}
     */
    static UfsDataTypeQueryDmeAttribute => 4

    /**
     * @type {Integer (Int32)}
     */
    static UfsDataTypeQueryDmePeerAttribute => 5

    /**
     * @type {Integer (Int32)}
     */
    static UfsDataTypeMax => 6
}
