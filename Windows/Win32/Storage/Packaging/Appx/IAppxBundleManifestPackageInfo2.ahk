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
     * 
     * @param {Pointer<BOOL>} isPackageReference 
     * @returns {HRESULT} 
     */
    GetIsPackageReference(isPackageReference) {
        result := ComCall(3, this, "ptr", isPackageReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isNonQualifiedResourcePackage 
     * @returns {HRESULT} 
     */
    GetIsNonQualifiedResourcePackage(isNonQualifiedResourcePackage) {
        result := ComCall(4, this, "ptr", isNonQualifiedResourcePackage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isDefaultApplicablePackage 
     * @returns {HRESULT} 
     */
    GetIsDefaultApplicablePackage(isDefaultApplicablePackage) {
        result := ComCall(5, this, "ptr", isDefaultApplicablePackage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
