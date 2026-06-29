#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EClrOperation.ahk" { EClrOperation }
#Import ".\EPolicyAction.ahk" { EPolicyAction }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\EClrFailure.ahk" { EClrFailure }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostPolicyManager extends IUnknown {
    /**
     * The interface identifier for IHostPolicyManager
     * @type {Guid}
     */
    static IID := Guid("{7ae49844-b1e3-4683-ba7c-1e8212ea3b79}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostPolicyManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnDefaultAction : IntPtr
        OnTimeout       : IntPtr
        OnFailure       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostPolicyManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {EClrOperation} operation 
     * @param {EPolicyAction} action 
     * @returns {HRESULT} 
     */
    OnDefaultAction(operation, action) {
        result := ComCall(3, this, EClrOperation, operation, EPolicyAction, action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EClrOperation} operation 
     * @param {EPolicyAction} action 
     * @returns {HRESULT} 
     */
    OnTimeout(operation, action) {
        result := ComCall(4, this, EClrOperation, operation, EPolicyAction, action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EClrFailure} failure 
     * @param {EPolicyAction} action 
     * @returns {HRESULT} 
     */
    OnFailure(failure, action) {
        result := ComCall(5, this, EClrFailure, failure, EPolicyAction, action, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHostPolicyManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDefaultAction := CallbackCreate(GetMethod(implObj, "OnDefaultAction"), flags, 3)
        this.vtbl.OnTimeout := CallbackCreate(GetMethod(implObj, "OnTimeout"), flags, 3)
        this.vtbl.OnFailure := CallbackCreate(GetMethod(implObj, "OnFailure"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDefaultAction)
        CallbackFree(this.vtbl.OnTimeout)
        CallbackFree(this.vtbl.OnFailure)
    }
}
