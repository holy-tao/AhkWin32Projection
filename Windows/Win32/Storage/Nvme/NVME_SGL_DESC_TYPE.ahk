#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_SGL_DESC_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescTypeDataBlock => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescTypeBitBucket => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescTypeSegment => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescTypeLastSegment => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescTypeKeyedDataBlock => 4

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescTypeTransportDataBlock => 5

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescTypeMax => 15
}
