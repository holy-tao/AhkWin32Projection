#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a read-only object model for the list of payload packages that are described in a bundle package manifest.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlemanifestpackageinfoenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleManifestPackageInfoEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleManifestPackageInfoEnumerator
     * @type {Guid}
     */
    static IID => Guid("{f9b856ee-49a6-4e19-b2b0-6a2406d63a32}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrent", "GetHasCurrent", "MoveNext"]

    /**
     * 
     * @param {Pointer<IAppxBundleManifestPackageInfo>} packageInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfoenumerator-getcurrent
     */
    GetCurrent(packageInfo) {
        result := ComCall(3, this, "ptr*", packageInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasCurrent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfoenumerator-gethascurrent
     */
    GetHasCurrent(hasCurrent) {
        result := ComCall(4, this, "ptr", hasCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasNext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfoenumerator-movenext
     */
    MoveNext(hasNext) {
        result := ComCall(5, this, "ptr", hasNext, "HRESULT")
        return result
    }
}
