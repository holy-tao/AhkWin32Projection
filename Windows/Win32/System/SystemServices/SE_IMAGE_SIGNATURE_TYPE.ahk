#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class SE_IMAGE_SIGNATURE_TYPE extends Win32Enum {

    /**
     * Native name: SeImageSignatureNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: SeImageSignatureEmbedded
     * @type {Integer (Int32)}
     */
    static Embedded => 1

    /**
     * Native name: SeImageSignatureCache
     * @type {Integer (Int32)}
     */
    static Cache => 2

    /**
     * Native name: SeImageSignatureCatalogCached
     * @type {Integer (Int32)}
     */
    static CatalogCached => 3

    /**
     * Native name: SeImageSignatureCatalogNotCached
     * @type {Integer (Int32)}
     */
    static CatalogNotCached => 4

    /**
     * Native name: SeImageSignatureCatalogHint
     * @type {Integer (Int32)}
     */
    static CatalogHint => 5

    /**
     * Native name: SeImageSignaturePackageCatalog
     * @type {Integer (Int32)}
     */
    static PackageCatalog => 6

    /**
     * Native name: SeImageSignaturePplMitigated
     * @type {Integer (Int32)}
     */
    static PplMitigated => 7
}
