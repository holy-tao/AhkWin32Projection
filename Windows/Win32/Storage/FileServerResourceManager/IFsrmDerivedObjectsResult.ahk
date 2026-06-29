#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmCollection.ahk" { IFsrmCollection }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Used to access the results when the source template calls the CommitAndUpdateDerived method.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmderivedobjectsresult
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmDerivedObjectsResult extends IDispatch {
    /**
     * The interface identifier for IFsrmDerivedObjectsResult
     * @type {Guid}
     */
    static IID := Guid("{39322a2d-38ee-4d0d-8095-421a80849a82}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmDerivedObjectsResult interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DerivedObjects : IntPtr
        get_Results        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmDerivedObjectsResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IFsrmCollection} 
     */
    DerivedObjects {
        get => this.get_DerivedObjects()
    }

    /**
     * @type {IFsrmCollection} 
     */
    Results {
        get => this.get_Results()
    }

    /**
     * Retrieves the collection of derived objects that were updated.
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmderivedobjectsresult-get_derivedobjects
     */
    get_DerivedObjects() {
        result := ComCall(7, this, "ptr*", &derivedObjects := 0, "HRESULT")
        return IFsrmCollection(derivedObjects)
    }

    /**
     * Retrieves the HRESULT values that indicate the success or failure of the update for each derived object.
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmderivedobjectsresult-get_derivedobjects">IFsrmDerivedObjectsResult::DerivedObjects</a> property contains the corresponding list of derived objects.
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmderivedobjectsresult-get_results
     */
    get_Results() {
        result := ComCall(8, this, "ptr*", &results := 0, "HRESULT")
        return IFsrmCollection(results)
    }

    Query(iid) {
        if (IFsrmDerivedObjectsResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DerivedObjects := CallbackCreate(GetMethod(implObj, "get_DerivedObjects"), flags, 2)
        this.vtbl.get_Results := CallbackCreate(GetMethod(implObj, "get_Results"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DerivedObjects)
        CallbackFree(this.vtbl.get_Results)
    }
}
