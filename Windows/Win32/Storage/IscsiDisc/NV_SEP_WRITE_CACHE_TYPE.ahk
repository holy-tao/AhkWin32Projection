#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class NV_SEP_WRITE_CACHE_TYPE{

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
