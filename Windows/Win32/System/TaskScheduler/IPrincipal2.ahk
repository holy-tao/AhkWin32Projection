#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TASK_PROCESSTOKENSID_TYPE.ahk" { TASK_PROCESSTOKENSID_TYPE }

/**
 * Provides the extended settings applied to security credentials for a principal.
 * @remarks
 * When reading or writing XML for a task, the security credentials for a principal are specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-principal-principaltype-element">Principal</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-iprincipal2
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IPrincipal2 extends IDispatch {
    /**
     * The interface identifier for IPrincipal2
     * @type {Guid}
     */
    static IID := Guid("{248919ae-e345-4a6d-8aeb-e0d3165c904e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrincipal2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ProcessTokenSidType    : IntPtr
        put_ProcessTokenSidType    : IntPtr
        get_RequiredPrivilegeCount : IntPtr
        get_RequiredPrivilege      : IntPtr
        AddRequiredPrivilege       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrincipal2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {TASK_PROCESSTOKENSID_TYPE} 
     */
    ProcessTokenSidType {
        get => this.get_ProcessTokenSidType()
        set => this.put_ProcessTokenSidType(value)
    }

    /**
     */
    RequiredPrivilegeCount {
        get => this.get_RequiredPrivilegeCount()
    }

    /**
     * Gets or sets the task process security identifier (SID) type. (Get)
     * @param {Pointer<TASK_PROCESSTOKENSID_TYPE>} pProcessTokenSidType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal2-get_processtokensidtype
     */
    get_ProcessTokenSidType(pProcessTokenSidType) {
        pProcessTokenSidTypeMarshal := pProcessTokenSidType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pProcessTokenSidTypeMarshal, pProcessTokenSidType, "HRESULT")
        return result
    }

    /**
     * Gets or sets the task process security identifier (SID) type. (Put)
     * @param {TASK_PROCESSTOKENSID_TYPE} processTokenSidType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal2-put_processtokensidtype
     */
    put_ProcessTokenSidType(processTokenSidType) {
        result := ComCall(8, this, TASK_PROCESSTOKENSID_TYPE, processTokenSidType, "HRESULT")
        return result
    }

    /**
     * Gets the number of privileges in the required privileges array.
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal2-get_requiredprivilegecount
     */
    get_RequiredPrivilegeCount(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * Gets the required privilege of the task by index.
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pPrivilege 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal2-get_requiredprivilege
     */
    get_RequiredPrivilege(index, pPrivilege) {
        result := ComCall(10, this, "int", index, BSTR.Ptr, pPrivilege, "HRESULT")
        return result
    }

    /**
     * Adds the required privilege to the task process token.
     * @param {BSTR} privilege Specifies the right of a task to perform various system-related operations, such as shutting down the system, loading device drivers, or changing the system time.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal2-addrequiredprivilege
     */
    AddRequiredPrivilege(privilege) {
        privilege := privilege is String ? BSTR.Alloc(privilege).Value : privilege

        result := ComCall(11, this, BSTR, privilege, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrincipal2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProcessTokenSidType := CallbackCreate(GetMethod(implObj, "get_ProcessTokenSidType"), flags, 2)
        this.vtbl.put_ProcessTokenSidType := CallbackCreate(GetMethod(implObj, "put_ProcessTokenSidType"), flags, 2)
        this.vtbl.get_RequiredPrivilegeCount := CallbackCreate(GetMethod(implObj, "get_RequiredPrivilegeCount"), flags, 2)
        this.vtbl.get_RequiredPrivilege := CallbackCreate(GetMethod(implObj, "get_RequiredPrivilege"), flags, 3)
        this.vtbl.AddRequiredPrivilege := CallbackCreate(GetMethod(implObj, "AddRequiredPrivilege"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProcessTokenSidType)
        CallbackFree(this.vtbl.put_ProcessTokenSidType)
        CallbackFree(this.vtbl.get_RequiredPrivilegeCount)
        CallbackFree(this.vtbl.get_RequiredPrivilege)
        CallbackFree(this.vtbl.AddRequiredPrivilege)
    }
}
