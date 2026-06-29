#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MDAXISINFO.ahk" { MDAXISINFO }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HACCESSOR.ahk" { HACCESSOR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IMDDataset extends IUnknown {
    /**
     * The interface identifier for IMDDataset
     * @type {Guid}
     */
    static IID := Guid("{a07cccd1-8148-11d0-87bb-00c04fc33942}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMDDataset interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FreeAxisInfo     : IntPtr
        GetAxisInfo      : IntPtr
        GetAxisRowset    : IntPtr
        GetCellData      : IntPtr
        GetSpecification : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMDDataset.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} cAxes 
     * @param {Pointer<MDAXISINFO>} rgAxisInfo 
     * @returns {HRESULT} 
     */
    FreeAxisInfo(cAxes, rgAxisInfo) {
        result := ComCall(3, this, "ptr", cAxes, MDAXISINFO.Ptr, rgAxisInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} pcAxes 
     * @returns {Pointer<MDAXISINFO>} 
     */
    GetAxisInfo(pcAxes) {
        pcAxesMarshal := pcAxes is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcAxesMarshal, pcAxes, "ptr*", &prgAxisInfo := 0, "HRESULT")
        return prgAxisInfo
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer} iAxis 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {IUnknown} 
     */
    GetAxisRowset(pUnkOuter, iAxis, riid, cPropertySets, rgPropertySets) {
        result := ComCall(5, this, "ptr", pUnkOuter, "ptr", iAxis, Guid.Ptr, riid, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, "ptr*", &ppRowset := 0, "HRESULT")
        return IUnknown(ppRowset)
    }

    /**
     * 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer} ulStartCell 
     * @param {Pointer} ulEndCell 
     * @returns {Void} 
     */
    GetCellData(_hAccessor, ulStartCell, ulEndCell) {
        result := ComCall(6, this, HACCESSOR, _hAccessor, "ptr", ulStartCell, "ptr", ulEndCell, "ptr", &pData := 0, "HRESULT")
        return pData
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetSpecification(riid) {
        result := ComCall(7, this, Guid.Ptr, riid, "ptr*", &ppSpecification := 0, "HRESULT")
        return IUnknown(ppSpecification)
    }

    Query(iid) {
        if (IMDDataset.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FreeAxisInfo := CallbackCreate(GetMethod(implObj, "FreeAxisInfo"), flags, 3)
        this.vtbl.GetAxisInfo := CallbackCreate(GetMethod(implObj, "GetAxisInfo"), flags, 3)
        this.vtbl.GetAxisRowset := CallbackCreate(GetMethod(implObj, "GetAxisRowset"), flags, 7)
        this.vtbl.GetCellData := CallbackCreate(GetMethod(implObj, "GetCellData"), flags, 5)
        this.vtbl.GetSpecification := CallbackCreate(GetMethod(implObj, "GetSpecification"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FreeAxisInfo)
        CallbackFree(this.vtbl.GetAxisInfo)
        CallbackFree(this.vtbl.GetAxisRowset)
        CallbackFree(this.vtbl.GetCellData)
        CallbackFree(this.vtbl.GetSpecification)
    }
}
