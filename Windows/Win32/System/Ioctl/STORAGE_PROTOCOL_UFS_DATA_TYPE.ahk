#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_PROTOCOL_UFS_DATA_TYPE extends Win32Enum {

    /**
     * Native name: UfsDataTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: UfsDataTypeQueryDescriptor
     * @type {Integer (Int32)}
     */
    static QueryDescriptor => 1

    /**
     * Native name: UfsDataTypeQueryAttribute
     * @type {Integer (Int32)}
     */
    static QueryAttribute => 2

    /**
     * Native name: UfsDataTypeQueryFlag
     * @type {Integer (Int32)}
     */
    static QueryFlag => 3

    /**
     * Native name: UfsDataTypeQueryDmeAttribute
     * @type {Integer (Int32)}
     */
    static QueryDmeAttribute => 4

    /**
     * Native name: UfsDataTypeQueryDmePeerAttribute
     * @type {Integer (Int32)}
     */
    static QueryDmePeerAttribute => 5

    /**
     * Native name: UfsDataTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 6
}
