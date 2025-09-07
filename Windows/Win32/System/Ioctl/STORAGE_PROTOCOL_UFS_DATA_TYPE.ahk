#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PROTOCOL_UFS_DATA_TYPE{

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
