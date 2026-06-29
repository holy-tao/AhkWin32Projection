#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct NV_SEP_WRITE_CACHE_TYPE {
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
    static NVSEPWriteCacheTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVSEPWriteCacheTypeNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVSEPWriteCacheTypeWriteBack => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVSEPWriteCacheTypeWriteThrough => 3
}
