#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigurefeaturea">MsiConfigureFeature</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigurefeaturew">MsiConfigureFeature</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigurefeaturea">MsiConfigureFeatureA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigurefeaturew">MsiConfigureFeatureA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigurefeaturea">MsiConfigureFeatureW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigurefeaturew">MsiConfigureFeatureW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigureproducta">MsiConfigureProduct</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigureproductw">MsiConfigureProduct</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigureproducta">MsiConfigureProductA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigureproductw">MsiConfigureProductA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigureproductexa">MsiConfigureProductEx</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigureproductexw">MsiConfigureProductEx</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigureproductexa">MsiConfigureProductExA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigureproductexw">MsiConfigureProductExA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigureproductexa">MsiConfigureProductExW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigureproductexw">MsiConfigureProductExW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigureproducta">MsiConfigureProductW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msi/nf-msi-msiconfigureproductw">MsiConfigureProductW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetcomponentstatea">MsiGetComponentState</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetcomponentstatew">MsiGetComponentState</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetcomponentstatea">MsiGetComponentStateA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetcomponentstatew">MsiGetComponentStateA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetcomponentstatea">MsiGetComponentStateW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetcomponentstatew">MsiGetComponentStateW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetfeaturecosta">MsiGetFeatureCost</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetfeaturecostw">MsiGetFeatureCost</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetfeaturecosta">MsiGetFeatureCostA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetfeaturecostw">MsiGetFeatureCostA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetfeaturecosta">MsiGetFeatureCostW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetfeaturecostw">MsiGetFeatureCostW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetfeaturestatea">MsiGetFeatureState</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetfeaturestatew">MsiGetFeatureState</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetfeaturestatea">MsiGetFeatureStateA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetfeaturestatew">MsiGetFeatureStateA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetfeaturestatea">MsiGetFeatureStateW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msigetfeaturestatew">MsiGetFeatureStateW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msisetcomponentstatea">MsiSetComponentState</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msisetcomponentstatew">MsiSetComponentState</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msisetcomponentstatea">MsiSetComponentStateA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msisetcomponentstatew">MsiSetComponentStateA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msisetcomponentstatea">MsiSetComponentStateW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msisetcomponentstatew">MsiSetComponentStateW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msisetfeaturestatea">MsiSetFeatureState</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msisetfeaturestatew">MsiSetFeatureState</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msisetfeaturestatea">MsiSetFeatureStateA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msisetfeaturestatew">MsiSetFeatureStateA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msisetfeaturestatea">MsiSetFeatureStateW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msisetfeaturestatew">MsiSetFeatureStateW</see>.
 * @see 
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class INSTALLSTATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_NOTUSED => -7

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_BADCONFIG => -6

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_INCOMPLETE => -5

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_SOURCEABSENT => -4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_MOREDATA => -3

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_INVALIDARG => -2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_UNKNOWN => -1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_BROKEN => 0

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_ADVERTISED => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_REMOVED => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_ABSENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_LOCAL => 3

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_SOURCE => 4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_DEFAULT => 5
}
