#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_SGL_DESC_TYPE {
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
