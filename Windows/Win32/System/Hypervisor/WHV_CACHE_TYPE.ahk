#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_CACHE_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static WHvCacheTypeUncached => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvCacheTypeWriteCombining => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvCacheTypeWriteThrough => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvCacheTypeWriteBack => 6
}
