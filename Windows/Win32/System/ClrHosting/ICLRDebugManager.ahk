#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Security\ACL.ahk" { ACL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ESymbolReadingPolicy.ahk" { ESymbolReadingPolicy }
#Import ".\ICLRTask.ahk" { ICLRTask }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRDebugManager extends IUnknown {
    /**
     * The interface identifier for ICLRDebugManager
     * @type {Guid}
     */
    static IID := Guid("{00dcaec6-2ac0-43a9-acf9-1e36c139b10d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRDebugManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeginConnection        : IntPtr
        SetConnectionTasks     : IntPtr
        EndConnection          : IntPtr
        SetDacl                : IntPtr
        GetDacl                : IntPtr
        IsDebuggerAttached     : IntPtr
        SetSymbolReadingPolicy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRDebugManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwConnectionId 
     * @param {PWSTR} szConnectionName 
     * @returns {HRESULT} 
     */
    BeginConnection(dwConnectionId, szConnectionName) {
        szConnectionName := szConnectionName is String ? StrPtr(szConnectionName) : szConnectionName

        result := ComCall(3, this, "uint", dwConnectionId, "ptr", szConnectionName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Integer} dwCount 
     * @param {Pointer<ICLRTask>} ppCLRTask 
     * @returns {HRESULT} 
     */
    SetConnectionTasks(id, dwCount, ppCLRTask) {
        result := ComCall(4, this, "uint", id, "uint", dwCount, ICLRTask.Ptr, ppCLRTask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwConnectionId 
     * @returns {HRESULT} 
     */
    EndConnection(dwConnectionId) {
        result := ComCall(5, this, "uint", dwConnectionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ACL>} pacl 
     * @returns {HRESULT} 
     */
    SetDacl(pacl) {
        result := ComCall(6, this, ACL.Ptr, pacl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<ACL>} 
     */
    GetDacl() {
        result := ComCall(7, this, "ptr*", &pacl := 0, "HRESULT")
        return pacl
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsDebuggerAttached() {
        result := ComCall(8, this, BOOL.Ptr, &pbAttached := 0, "HRESULT")
        return pbAttached
    }

    /**
     * 
     * @param {ESymbolReadingPolicy} policy 
     * @returns {HRESULT} 
     */
    SetSymbolReadingPolicy(policy) {
        result := ComCall(9, this, ESymbolReadingPolicy, policy, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRDebugManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginConnection := CallbackCreate(GetMethod(implObj, "BeginConnection"), flags, 3)
        this.vtbl.SetConnectionTasks := CallbackCreate(GetMethod(implObj, "SetConnectionTasks"), flags, 4)
        this.vtbl.EndConnection := CallbackCreate(GetMethod(implObj, "EndConnection"), flags, 2)
        this.vtbl.SetDacl := CallbackCreate(GetMethod(implObj, "SetDacl"), flags, 2)
        this.vtbl.GetDacl := CallbackCreate(GetMethod(implObj, "GetDacl"), flags, 2)
        this.vtbl.IsDebuggerAttached := CallbackCreate(GetMethod(implObj, "IsDebuggerAttached"), flags, 2)
        this.vtbl.SetSymbolReadingPolicy := CallbackCreate(GetMethod(implObj, "SetSymbolReadingPolicy"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginConnection)
        CallbackFree(this.vtbl.SetConnectionTasks)
        CallbackFree(this.vtbl.EndConnection)
        CallbackFree(this.vtbl.SetDacl)
        CallbackFree(this.vtbl.GetDacl)
        CallbackFree(this.vtbl.IsDebuggerAttached)
        CallbackFree(this.vtbl.SetSymbolReadingPolicy)
    }
}
