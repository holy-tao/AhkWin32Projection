#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * When implemented by the drop target application, this interface gives the OLE drag and drop engine the ability to determine whether the drop target application intends to evaluate enterprise protection policy and gives the OLE drag and drop engine a way to provide the enterprise ID of the drop source application to the drop target application.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-ienterprisedroptarget
 * @namespace Windows.Win32.System.Ole
 */
export default struct IEnterpriseDropTarget extends IUnknown {
    /**
     * The interface identifier for IEnterpriseDropTarget
     * @type {Guid}
     */
    static IID := Guid("{390e3878-fd55-4e18-819d-4682081c0cfd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnterpriseDropTarget interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDropSourceEnterpriseId : IntPtr
        IsEvaluatingEdpPolicy     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnterpriseDropTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides the drop target with the enterprise ID of the drop source.
     * @param {PWSTR} identity The enterprise identity of the drop source.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ienterprisedroptarget-setdropsourceenterpriseid
     */
    SetDropSourceEnterpriseId(identity) {
        identity := identity is String ? StrPtr(identity) : identity

        result := ComCall(3, this, "ptr", identity, "HRESULT")
        return result
    }

    /**
     * Indicates whether the drop target is intends to handle the evaluation of the enterprise protection policy.
     * @returns {BOOL} A boolean value that indicates whether the drop target intends to handle the evaluation of enterprise protection policy.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ienterprisedroptarget-isevaluatingedppolicy
     */
    IsEvaluatingEdpPolicy() {
        result := ComCall(4, this, BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IEnterpriseDropTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDropSourceEnterpriseId := CallbackCreate(GetMethod(implObj, "SetDropSourceEnterpriseId"), flags, 2)
        this.vtbl.IsEvaluatingEdpPolicy := CallbackCreate(GetMethod(implObj, "IsEvaluatingEdpPolicy"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDropSourceEnterpriseId)
        CallbackFree(this.vtbl.IsEvaluatingEdpPolicy)
    }
}
