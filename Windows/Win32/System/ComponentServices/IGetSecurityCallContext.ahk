#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISecurityCallContext.ahk" { ISecurityCallContext }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Retrieves a reference to an object created from the SecurityCallContext class that is associated with the current call. (IGetSecurityCallContext)
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-igetsecuritycallcontext
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IGetSecurityCallContext extends IDispatch {
    /**
     * The interface identifier for IGetSecurityCallContext
     * @type {Guid}
     */
    static IID := Guid("{cafc823f-b441-11d1-b82b-0000f8757e2a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGetSecurityCallContext interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetSecurityCallContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGetSecurityCallContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a reference to an object created from the SecurityCallContext class that is associated with the current call. (IGetSecurityCallContext.GetSecurityCallContext)
     * @remarks
     * With an object's security call context, you can retrieve items in the security call context collection, such as the minimum authentication level, the direct caller, the original caller, the chain of callers, and the number of callers. You can also call the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecuritycallcontext-issecurityenabled">IsSecurityEnabled</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecuritycallcontext-iscallerinrole">IsCallerInRole</a> methods to ensure that a particular section of code is executed. However, you can call these methods only if role-based security is enabled and if the direct caller is a member of a specified role.
     * @returns {ISecurityCallContext} A reference to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-isecuritycallcontext">ISecurityCallContext</a> on the object's context.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-igetsecuritycallcontext-getsecuritycallcontext
     */
    GetSecurityCallContext() {
        result := ComCall(7, this, "ptr*", &ppObject := 0, "HRESULT")
        return ISecurityCallContext(ppObject)
    }

    Query(iid) {
        if (IGetSecurityCallContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSecurityCallContext := CallbackCreate(GetMethod(implObj, "GetSecurityCallContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSecurityCallContext)
    }
}
