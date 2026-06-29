#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Storage\IndexServer\IFilter.ahk" { IFilter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ILoadFilter.ahk" { ILoadFilter }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FILTERED_DATA_SOURCES.ahk" { FILTERED_DATA_SOURCES }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ILoadFilterWithPrivateComActivation extends ILoadFilter {
    /**
     * The interface identifier for ILoadFilterWithPrivateComActivation
     * @type {Guid}
     */
    static IID := Guid("{40bdbd34-780b-48d3-9bb6-12ebd4ad2e75}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILoadFilterWithPrivateComActivation interfaces
    */
    struct Vtbl extends ILoadFilter.Vtbl {
        LoadIFilterWithPrivateComActivation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILoadFilterWithPrivateComActivation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<FILTERED_DATA_SOURCES>} filteredSources 
     * @param {BOOL} useDefault 
     * @param {Pointer<Guid>} filterClsid 
     * @param {Pointer<BOOL>} isFilterPrivateComActivated 
     * @param {Pointer<IFilter>} filterObj 
     * @returns {HRESULT} 
     */
    LoadIFilterWithPrivateComActivation(filteredSources, useDefault, filterClsid, isFilterPrivateComActivated, filterObj) {
        isFilterPrivateComActivatedMarshal := isFilterPrivateComActivated is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, FILTERED_DATA_SOURCES.Ptr, filteredSources, BOOL, useDefault, Guid.Ptr, filterClsid, isFilterPrivateComActivatedMarshal, isFilterPrivateComActivated, IFilter.Ptr, filterObj, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILoadFilterWithPrivateComActivation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadIFilterWithPrivateComActivation := CallbackCreate(GetMethod(implObj, "LoadIFilterWithPrivateComActivation"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadIFilterWithPrivateComActivation)
    }
}
