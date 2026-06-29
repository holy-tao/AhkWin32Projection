#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }
#Import ".\DBCOLUMNACCESS.ahk" { DBCOLUMNACCESS }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRow extends IUnknown {
    /**
     * The interface identifier for IRow
     * @type {Guid}
     */
    static IID := Guid("{0c733ab4-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRow interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetColumns      : IntPtr
        GetSourceRowset : IntPtr
        Open            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRow.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} cColumns 
     * @param {Pointer<DBCOLUMNACCESS>} rgColumns 
     * @returns {HRESULT} 
     */
    GetColumns(cColumns, rgColumns) {
        result := ComCall(3, this, "ptr", cColumns, DBCOLUMNACCESS.Ptr, rgColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppRowset 
     * @param {Pointer<Pointer>} phRow 
     * @returns {HRESULT} 
     */
    GetSourceRowset(riid, ppRowset, phRow) {
        phRowMarshal := phRow is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, Guid.Ptr, riid, IUnknown.Ptr, ppRowset, phRowMarshal, phRow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<DBID>} pColumnID 
     * @param {Pointer<Guid>} rguidColumnType 
     * @param {Integer} dwBindFlags 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    Open(pUnkOuter, pColumnID, rguidColumnType, dwBindFlags, riid) {
        result := ComCall(5, this, "ptr", pUnkOuter, DBID.Ptr, pColumnID, Guid.Ptr, rguidColumnType, "uint", dwBindFlags, Guid.Ptr, riid, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    Query(iid) {
        if (IRow.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetColumns := CallbackCreate(GetMethod(implObj, "GetColumns"), flags, 3)
        this.vtbl.GetSourceRowset := CallbackCreate(GetMethod(implObj, "GetSourceRowset"), flags, 4)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetColumns)
        CallbackFree(this.vtbl.GetSourceRowset)
        CallbackFree(this.vtbl.Open)
    }
}
