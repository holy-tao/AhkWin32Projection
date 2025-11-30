#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class SE_IMAGE_SIGNATURE_TYPE extends Win32Enum{

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
