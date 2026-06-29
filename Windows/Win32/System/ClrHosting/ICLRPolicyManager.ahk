#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EClrOperation.ahk" { EClrOperation }
#Import ".\EClrUnhandledException.ahk" { EClrUnhandledException }
#Import ".\EPolicyAction.ahk" { EPolicyAction }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\EClrFailure.ahk" { EClrFailure }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRPolicyManager extends IUnknown {
    /**
     * The interface identifier for ICLRPolicyManager
     * @type {Guid}
     */
    static IID := Guid("{7d290010-d781-45da-a6f8-aa5d711a730e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRPolicyManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDefaultAction            : IntPtr
        SetTimeout                  : IntPtr
        SetActionOnTimeout          : IntPtr
        SetTimeoutAndAction         : IntPtr
        SetActionOnFailure          : IntPtr
        SetUnhandledExceptionPolicy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRPolicyManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {EClrOperation} operation 
     * @param {EPolicyAction} action 
     * @returns {HRESULT} 
     */
    SetDefaultAction(operation, action) {
        result := ComCall(3, this, EClrOperation, operation, EPolicyAction, action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EClrOperation} operation 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     */
    SetTimeout(operation, dwMilliseconds) {
        result := ComCall(4, this, EClrOperation, operation, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EClrOperation} operation 
     * @param {EPolicyAction} action 
     * @returns {HRESULT} 
     */
    SetActionOnTimeout(operation, action) {
        result := ComCall(5, this, EClrOperation, operation, EPolicyAction, action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EClrOperation} operation 
     * @param {Integer} dwMilliseconds 
     * @param {EPolicyAction} action 
     * @returns {HRESULT} 
     */
    SetTimeoutAndAction(operation, dwMilliseconds, action) {
        result := ComCall(6, this, EClrOperation, operation, "uint", dwMilliseconds, EPolicyAction, action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EClrFailure} failure 
     * @param {EPolicyAction} action 
     * @returns {HRESULT} 
     */
    SetActionOnFailure(failure, action) {
        result := ComCall(7, this, EClrFailure, failure, EPolicyAction, action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EClrUnhandledException} policy 
     * @returns {HRESULT} 
     */
    SetUnhandledExceptionPolicy(policy) {
        result := ComCall(8, this, EClrUnhandledException, policy, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRPolicyManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDefaultAction := CallbackCreate(GetMethod(implObj, "SetDefaultAction"), flags, 3)
        this.vtbl.SetTimeout := CallbackCreate(GetMethod(implObj, "SetTimeout"), flags, 3)
        this.vtbl.SetActionOnTimeout := CallbackCreate(GetMethod(implObj, "SetActionOnTimeout"), flags, 3)
        this.vtbl.SetTimeoutAndAction := CallbackCreate(GetMethod(implObj, "SetTimeoutAndAction"), flags, 4)
        this.vtbl.SetActionOnFailure := CallbackCreate(GetMethod(implObj, "SetActionOnFailure"), flags, 3)
        this.vtbl.SetUnhandledExceptionPolicy := CallbackCreate(GetMethod(implObj, "SetUnhandledExceptionPolicy"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDefaultAction)
        CallbackFree(this.vtbl.SetTimeout)
        CallbackFree(this.vtbl.SetActionOnTimeout)
        CallbackFree(this.vtbl.SetTimeoutAndAction)
        CallbackFree(this.vtbl.SetActionOnFailure)
        CallbackFree(this.vtbl.SetUnhandledExceptionPolicy)
    }
}
