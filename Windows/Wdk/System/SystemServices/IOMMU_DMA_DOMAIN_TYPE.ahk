#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DMA_DOMAIN_TYPE {
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
