#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class POOL_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPool => 0

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolExecute => 0

    /**
     * @type {Integer (Int32)}
     */
    static PagedPool => 1

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolMustSucceed => 2

    /**
     * @type {Integer (Int32)}
     */
    static DontUseThisType => 3

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolCacheAligned => 4

    /**
     * @type {Integer (Int32)}
     */
    static PagedPoolCacheAligned => 5

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolCacheAlignedMustS => 6

    /**
     * @type {Integer (Int32)}
     */
    static MaxPoolType => 7

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolBase => 0

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolBaseMustSucceed => 2

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolBaseCacheAligned => 4

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolBaseCacheAlignedMustS => 6

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolSession => 32

    /**
     * @type {Integer (Int32)}
     */
    static PagedPoolSession => 33

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolMustSucceedSession => 34

    /**
     * @type {Integer (Int32)}
     */
    static DontUseThisTypeSession => 35

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolCacheAlignedSession => 36

    /**
     * @type {Integer (Int32)}
     */
    static PagedPoolCacheAlignedSession => 37

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolCacheAlignedMustSSession => 38

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolNx => 512

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolNxCacheAligned => 516

    /**
     * @type {Integer (Int32)}
     */
    static NonPagedPoolSessionNx => 544
}
