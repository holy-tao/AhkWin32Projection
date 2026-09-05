#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_SGL_DESC_TYPE extends Win32Enum {

    /**
     * Native name: NvmeSglDescTypeDataBlock
     * @type {Integer (Int32)}
     */
    static DataBlock => 0

    /**
     * Native name: NvmeSglDescTypeBitBucket
     * @type {Integer (Int32)}
     */
    static BitBucket => 1

    /**
     * Native name: NvmeSglDescTypeSegment
     * @type {Integer (Int32)}
     */
    static Segment => 2

    /**
     * Native name: NvmeSglDescTypeLastSegment
     * @type {Integer (Int32)}
     */
    static LastSegment => 3

    /**
     * Native name: NvmeSglDescTypeKeyedDataBlock
     * @type {Integer (Int32)}
     */
    static KeyedDataBlock => 4

    /**
     * Native name: NvmeSglDescTypeTransportDataBlock
     * @type {Integer (Int32)}
     */
    static TransportDataBlock => 5

    /**
     * Native name: NvmeSglDescTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 15
}
