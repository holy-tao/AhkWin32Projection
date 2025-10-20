#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enumerates &lt;MainPackageDependency&gt; elements from an app manifest.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestmainpackagedependenciesenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestMainPackageDependenciesEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestMainPackageDependenciesEnumerator
     * @type {Guid}
     */
    static IID => Guid("{a99c4f00-51d2-4f0f-ba46-7ed5255ebdff}")

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
     * @param {Pointer<IAppxManifestMainPackageDependency>} mainPackageDependency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependenciesenumerator-getcurrent
     */
    GetCurrent(mainPackageDependency) {
        result := ComCall(3, this, "ptr*", mainPackageDependency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasCurrent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependenciesenumerator-gethascurrent
     */
    GetHasCurrent(hasCurrent) {
        result := ComCall(4, this, "ptr", hasCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasNext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependenciesenumerator-movenext
     */
    MoveNext(hasNext) {
        result := ComCall(5, this, "ptr", hasNext, "HRESULT")
        return result
    }
}
