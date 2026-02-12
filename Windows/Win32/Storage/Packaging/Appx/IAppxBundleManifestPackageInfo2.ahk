#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a read-only object model for a &lt;Package&gt; element in a bundle package manifest. (IAppxBundleManifestPackageInfo2)
 * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nn-appxpackaging-iappxbundlemanifestpackageinfo2
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
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo2-getispackagereference
     */
    GetIsPackageReference() {
        result := ComCall(3, this, "int*", &isPackageReference := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isPackageReference
    }

    /**
     * Determines whether the app package is a non-qualified resource package.
     * @remarks
     * A non-qualified resource package is a package that contains resources that are not qualified with any language, scale, or other qualifier. An example of this could be a package that contains all music files. 
     * 
     * For more information on app resources, see <a href="https://docs.microsoft.com/windows/uwp/app-resources/">App resources and the Resource Management System</a>.
     * @returns {BOOL} True if the package is a non-qualified resource package, False otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo2-getisnonqualifiedresourcepackage
     */
    GetIsNonQualifiedResourcePackage() {
        result := ComCall(4, this, "int*", &isNonQualifiedResourcePackage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isNonQualifiedResourcePackage
    }

    /**
     * Determines whether the app package is a default applicable package.
     * @remarks
     * A default applicable package is a package that contains the default MRT-qualified resources. For example, a default applicable package could be English language resources that should be installed by default if no other appropriate alternative language is  available.
     * 
     * For more information on app resources, see <a href="https://docs.microsoft.com/windows/uwp/app-resources/">App resources and the Resource Management System</a>.
     * @returns {BOOL} True if the package is a default applicable package, False otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo2-getisdefaultapplicablepackage
     */
    GetIsDefaultApplicablePackage() {
        result := ComCall(5, this, "int*", &isDefaultApplicablePackage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isDefaultApplicablePackage
    }
}
