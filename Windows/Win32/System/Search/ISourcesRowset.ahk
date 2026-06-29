#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ISourcesRowset extends IUnknown {
    /**
     * The interface identifier for ISourcesRowset
     * @type {Guid}
     */
    static IID := Guid("{0c733a1e-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISourcesRowset interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSourcesRowset : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISourcesRowset.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgProperties 
     * @returns {IUnknown} 
     */
    GetSourcesRowset(pUnkOuter, riid, cPropertySets, rgProperties) {
        result := ComCall(3, this, "ptr", pUnkOuter, Guid.Ptr, riid, "uint", cPropertySets, DBPROPSET.Ptr, rgProperties, "ptr*", &ppSourcesRowset := 0, "HRESULT")
        return IUnknown(ppSourcesRowset)
    }

    Query(iid) {
        if (ISourcesRowset.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSourcesRowset := CallbackCreate(GetMethod(implObj, "GetSourcesRowset"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSourcesRowset)
    }
}
