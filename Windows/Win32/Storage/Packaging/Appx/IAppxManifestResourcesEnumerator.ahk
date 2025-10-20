#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enumerates the resources defined in the package manifest.
 * @remarks
 * 
  * This object can be retrieved by using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getresources">GetResources</a> method of a  <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestreader">IAppxManifestReader</a> or <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestreader2">IAppxManifestReader2</a> object. But, starting with Windows 8.1, use <b>IAppxManifestReader2::GetResources</b> because it iterates over more resource qualifiers, such as, <b>Scale</b> and <b>DXFeatureLevel</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestresourcesenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestResourcesEnumerator extends IUnknown{
    /**
     * The interface identifier for IAppxManifestResourcesEnumerator
     * @type {Guid}
     */
    static IID => Guid("{de4dfbbd-881a-48bb-858c-d6f2baeae6ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} resource 
     * @returns {HRESULT} 
     */
    GetCurrent(resource) {
        result := ComCall(3, this, "ptr", resource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasCurrent 
     * @returns {HRESULT} 
     */
    GetHasCurrent(hasCurrent) {
        result := ComCall(4, this, "ptr", hasCurrent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasNext 
     * @returns {HRESULT} 
     */
    MoveNext(hasNext) {
        result := ComCall(5, this, "ptr", hasNext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
