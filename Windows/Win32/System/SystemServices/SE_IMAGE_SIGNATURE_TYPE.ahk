#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SE_IMAGE_SIGNATURE_TYPE {
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
    static SeImageSignatureNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static SeImageSignatureEmbedded => 1

    /**
     * @type {Integer (Int32)}
     */
    static SeImageSignatureCache => 2

    /**
     * @type {Integer (Int32)}
     */
    static SeImageSignatureCatalogCached => 3

    /**
     * @type {Integer (Int32)}
     */
    static SeImageSignatureCatalogNotCached => 4

    /**
     * @type {Integer (Int32)}
     */
    static SeImageSignatureCatalogHint => 5

    /**
     * @type {Integer (Int32)}
     */
    static SeImageSignaturePackageCatalog => 6

    /**
     * @type {Integer (Int32)}
     */
    static SeImageSignaturePplMitigated => 7
}
