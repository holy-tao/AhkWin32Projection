#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class NVCACHE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NvCacheTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvCacheTypeNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvCacheTypeWriteBack => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvCacheTypeWriteThrough => 3
}
