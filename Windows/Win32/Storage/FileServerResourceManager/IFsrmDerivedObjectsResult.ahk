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
     * 
     * @param {Pointer<IFsrmCollection>} derivedObjects 
     * @returns {HRESULT} 
     */
    get_DerivedObjects(derivedObjects) {
        result := ComCall(7, this, "ptr", derivedObjects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmCollection>} results 
     * @returns {HRESULT} 
     */
    get_Results(results) {
        result := ComCall(8, this, "ptr", results, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
