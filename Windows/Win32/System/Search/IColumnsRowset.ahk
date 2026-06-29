#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IColumnsRowset extends IUnknown {
    /**
     * The interface identifier for IColumnsRowset
     * @type {Guid}
     */
    static IID := Guid("{0c733a10-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IColumnsRowset interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAvailableColumns : IntPtr
        GetColumnsRowset    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IColumnsRowset.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer>} pcOptColumns 
     * @param {Pointer<Pointer<DBID>>} prgOptColumns 
     * @returns {HRESULT} 
     */
    GetAvailableColumns(pcOptColumns, prgOptColumns) {
        pcOptColumnsMarshal := pcOptColumns is VarRef ? "ptr*" : "ptr"
        prgOptColumnsMarshal := prgOptColumns is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcOptColumnsMarshal, pcOptColumns, prgOptColumnsMarshal, prgOptColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer} cOptColumns 
     * @param {Pointer<DBID>} rgOptColumns 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {IUnknown} 
     */
    GetColumnsRowset(pUnkOuter, cOptColumns, rgOptColumns, riid, cPropertySets, rgPropertySets) {
        result := ComCall(4, this, "ptr", pUnkOuter, "ptr", cOptColumns, DBID.Ptr, rgOptColumns, Guid.Ptr, riid, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, "ptr*", &ppColRowset := 0, "HRESULT")
        return IUnknown(ppColRowset)
    }

    Query(iid) {
        if (IColumnsRowset.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAvailableColumns := CallbackCreate(GetMethod(implObj, "GetAvailableColumns"), flags, 3)
        this.vtbl.GetColumnsRowset := CallbackCreate(GetMethod(implObj, "GetColumnsRowset"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAvailableColumns)
        CallbackFree(this.vtbl.GetColumnsRowset)
    }
}
