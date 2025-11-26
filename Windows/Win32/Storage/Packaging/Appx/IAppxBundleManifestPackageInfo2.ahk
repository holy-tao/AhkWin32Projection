#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a read-only object model for a &lt;Package&gt; element in a bundle package manifest.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlemanifestpackageinfo2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleManifestPackageInfo2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleManifestPackageInfo2
     * @type {Guid}
     */
    static IID => Guid("{44c2acbc-b2cf-4ccb-bbdb-9c6da8c3bc9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIsPackageReference", "GetIsNonQualifiedResourcePackage", "GetIsDefaultApplicablePackage"]

    /**
     * Determines whether a package is stored inside an app bundle, or if it's a reference to a package.
     * @returns {BOOL} True if the package in the bundle is a reference to a package; False if the package in the bundle is stored inside the app bundle.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo2-getispackagereference
     */
    GetIsPackageReference() {
        result := ComCall(3, this, "int*", &isPackageReference := 0, "HRESULT")
        return isPackageReference
    }

    /**
     * Determines whether the app package is a non-qualified resource package.
     * @returns {BOOL} True if the package is a non-qualified resource package, False otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo2-getisnonqualifiedresourcepackage
     */
    GetIsNonQualifiedResourcePackage() {
        result := ComCall(4, this, "int*", &isNonQualifiedResourcePackage := 0, "HRESULT")
        return isNonQualifiedResourcePackage
    }

    /**
     * Determines whether the app package is a default applicable package.
     * @returns {BOOL} True if the package is a default applicable package, False otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo2-getisdefaultapplicablepackage
     */
    GetIsDefaultApplicablePackage() {
        result := ComCall(5, this, "int*", &isDefaultApplicablePackage := 0, "HRESULT")
        return isDefaultApplicablePackage
    }
}
