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
     * 
     * @param {Pointer<BOOL>} isPackageReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo2-getispackagereference
     */
    GetIsPackageReference(isPackageReference) {
        result := ComCall(3, this, "ptr", isPackageReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isNonQualifiedResourcePackage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo2-getisnonqualifiedresourcepackage
     */
    GetIsNonQualifiedResourcePackage(isNonQualifiedResourcePackage) {
        result := ComCall(4, this, "ptr", isNonQualifiedResourcePackage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isDefaultApplicablePackage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo2-getisdefaultapplicablepackage
     */
    GetIsDefaultApplicablePackage(isDefaultApplicablePackage) {
        result := ComCall(5, this, "ptr", isDefaultApplicablePackage, "HRESULT")
        return result
    }
}
