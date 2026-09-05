#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IOMMU_DMA_DOMAIN_TYPE extends Win32Enum {

    /**
     * Native name: DomainTypeTranslate
     * @type {Integer (Int32)}
     */
    static Translate => 0

    /**
     * Native name: DomainTypePassThrough
     * @type {Integer (Int32)}
     */
    static PassThrough => 1

    /**
     * Native name: DomainTypeUnmanaged
     * @type {Integer (Int32)}
     */
    static Unmanaged => 2

    /**
     * Native name: DomainTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 3
}
