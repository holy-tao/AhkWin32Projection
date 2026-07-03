#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBPARAMS.ahk" { DBPARAMS }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ICommand extends IUnknown {
    /**
     * The interface identifier for ICommand
     * @type {Guid}
     */
    static IID := Guid("{0c733a63-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICommand interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Cancel       : IntPtr
        Execute      : IntPtr
        GetDBSession : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICommand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<DBPARAMS>} pParams 
     * @param {Pointer<Pointer>} pcRowsAffected 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    Execute(pUnkOuter, riid, pParams, pcRowsAffected, ppRowset) {
        pcRowsAffectedMarshal := pcRowsAffected is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pUnkOuter, Guid.Ptr, riid, DBPARAMS.Ptr, pParams, pcRowsAffectedMarshal, pcRowsAffected, IUnknown.Ptr, ppRowset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetDBSession(riid) {
        result := ComCall(5, this, Guid.Ptr, riid, "ptr*", &ppSession := 0, "HRESULT")
        return IUnknown(ppSession)
    }

    Query(iid) {
        if (ICommand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.Execute := CallbackCreate(GetMethod(implObj, "Execute"), flags, 6)
        this.vtbl.GetDBSession := CallbackCreate(GetMethod(implObj, "GetDBSession"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.Execute)
        CallbackFree(this.vtbl.GetDBSession)
    }
}
