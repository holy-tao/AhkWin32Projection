#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HACCESSOR.ahk" { HACCESSOR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetFastLoad extends IUnknown {
    /**
     * The interface identifier for IRowsetFastLoad
     * @type {Guid}
     */
    static IID := Guid("{5cf4ca13-ef21-11d0-97e7-00c04fc2ad98}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetFastLoad interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InsertRow : IntPtr
        Commit    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetFastLoad.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     */
    InsertRow(_hAccessor, pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, HACCESSOR, _hAccessor, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fDone 
     * @returns {HRESULT} 
     */
    Commit(fDone) {
        result := ComCall(4, this, BOOL, fDone, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetFastLoad.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InsertRow := CallbackCreate(GetMethod(implObj, "InsertRow"), flags, 3)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InsertRow)
        CallbackFree(this.vtbl.Commit)
    }
}
