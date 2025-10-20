#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to access the results when the source template calls the CommitAndUpdateDerived method.
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmderivedobjectsresult
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmDerivedObjectsResult extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmDerivedObjectsResult
     * @type {Guid}
     */
    static IID => Guid("{39322a2d-38ee-4d0d-8095-421a80849a82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DerivedObjects", "get_Results"]

    /**
     * 
     * @param {Pointer<IFsrmCollection>} derivedObjects 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmderivedobjectsresult-get_derivedobjects
     */
    get_DerivedObjects(derivedObjects) {
        result := ComCall(7, this, "ptr*", derivedObjects, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmCollection>} results 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmderivedobjectsresult-get_results
     */
    get_Results(results) {
        result := ComCall(8, this, "ptr*", results, "HRESULT")
        return result
    }
}
