#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enumerates the applications defined in the package manifest.
 * @remarks
 * 
  * Applications are specified using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-applications">Applications</a> element in the package manifest.
  * 
  * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getapplications">IAppxManifestReader::GetApplications</a> method.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestapplicationsenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestApplicationsEnumerator extends IUnknown{
    /**
     * The interface identifier for IAppxManifestApplicationsEnumerator
     * @type {Guid}
     */
    static IID => Guid("{9eb8a55a-f04b-4d0d-808d-686185d4847a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IAppxManifestApplication>} application 
     * @returns {HRESULT} 
     */
    GetCurrent(application) {
        result := ComCall(3, this, "ptr", application, "int")
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
