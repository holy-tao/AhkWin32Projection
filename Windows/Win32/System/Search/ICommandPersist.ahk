#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ICommandPersist extends IUnknown {
    /**
     * The interface identifier for ICommandPersist
     * @type {Guid}
     */
    static IID := Guid("{0c733aa7-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICommandPersist interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DeleteCommand     : IntPtr
        GetCurrentCommand : IntPtr
        LoadCommand       : IntPtr
        SaveCommand       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICommandPersist.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DBID>} pCommandID 
     * @returns {HRESULT} 
     */
    DeleteCommand(pCommandID) {
        result := ComCall(3, this, DBID.Ptr, pCommandID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<DBID>} 
     */
    GetCurrentCommand() {
        result := ComCall(4, this, "ptr*", &ppCommandID := 0, "HRESULT")
        return ppCommandID
    }

    /**
     * 
     * @param {Pointer<DBID>} pCommandID 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    LoadCommand(pCommandID, dwFlags) {
        result := ComCall(5, this, DBID.Ptr, pCommandID, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pCommandID 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SaveCommand(pCommandID, dwFlags) {
        result := ComCall(6, this, DBID.Ptr, pCommandID, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICommandPersist.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeleteCommand := CallbackCreate(GetMethod(implObj, "DeleteCommand"), flags, 2)
        this.vtbl.GetCurrentCommand := CallbackCreate(GetMethod(implObj, "GetCurrentCommand"), flags, 2)
        this.vtbl.LoadCommand := CallbackCreate(GetMethod(implObj, "LoadCommand"), flags, 3)
        this.vtbl.SaveCommand := CallbackCreate(GetMethod(implObj, "SaveCommand"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeleteCommand)
        CallbackFree(this.vtbl.GetCurrentCommand)
        CallbackFree(this.vtbl.LoadCommand)
        CallbackFree(this.vtbl.SaveCommand)
    }
}
