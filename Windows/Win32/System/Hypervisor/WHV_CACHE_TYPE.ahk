#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64
 */
class WHV_CACHE_TYPE extends Win32Enum {

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
    static WHvCacheTypeWriteProtected => 5

    /**
     * @type {Integer (Int32)}
     */
    static WHvCacheTypeWriteBack => 6
}
