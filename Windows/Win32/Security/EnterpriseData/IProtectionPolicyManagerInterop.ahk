#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\WinRT\IInspectable.ahk" { IInspectable }
#Import "..\..\System\WinRT\HSTRING.ahk" { HSTRING }

/**
 * Manages enterprise protection policy on protected content. (IProtectionPolicyManagerInterop)
 * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nn-efswrtinterop-iprotectionpolicymanagerinterop
 * @namespace Windows.Win32.Security.EnterpriseData
 */
export default struct IProtectionPolicyManagerInterop extends IInspectable {
    /**
     * The interface identifier for IProtectionPolicyManagerInterop
     * @type {Guid}
     */
    static IID := Guid("{4652651d-c1fe-4ba1-9f0a-c0f56596f721}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProtectionPolicyManagerInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        RequestAccessForWindowAsync : IntPtr
        GetForWindow                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProtectionPolicyManagerInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Request access to enterprise protected content for an identity. (IProtectionPolicyManagerInterop.RequestAccessForWindowAsync)
     * @param {HWND} appWindow A handle to the current window.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} targetIdentity The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>asyncOperation</i>.
     * @returns {Pointer<Void>} An <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IAsyncOperation_TResult_">IAsyncOperation&lt;ProtectionPolicyEvaluationResult&gt;</a> with a value of the <a href="https://docs.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult">ProtectionPolicyEvaluationResult</a> enumeration that is the result of the request.
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop-requestaccessforwindowasync
     */
    RequestAccessForWindowAsync(appWindow, sourceIdentity, targetIdentity, riid) {
        result := ComCall(6, this, HWND, appWindow, HSTRING, sourceIdentity, HSTRING, targetIdentity, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * Returns the protection policy manager object associated with the current app window.
     * @param {HWND} appWindow A handle to the current window.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>result</i>.
     * @returns {Pointer<Void>} The protection policy manager object for the current window.
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        result := ComCall(7, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &result := 0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProtectionPolicyManagerInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestAccessForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestAccessForWindowAsync"), flags, 6)
        this.vtbl.GetForWindow := CallbackCreate(GetMethod(implObj, "GetForWindow"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestAccessForWindowAsync)
        CallbackFree(this.vtbl.GetForWindow)
    }
}
