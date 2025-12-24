#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IOMMU_DMA_DOMAIN_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DomainTypeTranslate => 0

    /**
     * @type {Integer (Int32)}
     */
    static DomainTypePassThrough => 1

    /**
     * @type {Integer (Int32)}
     */
    static DomainTypeUnmanaged => 2

    /**
     * @type {Integer (Int32)}
     */
    static DomainTypeMax => 3
}
