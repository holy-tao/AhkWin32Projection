#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\WinRT\IInspectable.ahk" { IInspectable }
#Import "..\..\System\WinRT\HSTRING.ahk" { HSTRING }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Manages enterprise protection policy on protected content. (IProtectionPolicyManagerInterop2)
 * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nn-efswrtinterop-iprotectionpolicymanagerinterop2
 * @namespace Windows.Win32.Security.EnterpriseData
 */
export default struct IProtectionPolicyManagerInterop2 extends IInspectable {
    /**
     * The interface identifier for IProtectionPolicyManagerInterop2
     * @type {Guid}
     */
    static IID := Guid("{157cfbe4-a78d-4156-b384-61fdac41e686}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProtectionPolicyManagerInterop2 interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        RequestAccessForAppWithWindowAsync                : IntPtr
        RequestAccessWithAuditingInfoForWindowAsync       : IntPtr
        RequestAccessWithMessageForWindowAsync            : IntPtr
        RequestAccessForAppWithAuditingInfoForWindowAsync : IntPtr
        RequestAccessForAppWithMessageForWindowAsync      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProtectionPolicyManagerInterop2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Request access to enterprise-protected content for a specific target app. (IProtectionPolicyManagerInterop2.RequestAccessForAppWithWindowAsync)
     * @param {HWND} appWindow A handle to the current window.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} appPackageFamilyName The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>asyncOperation</i>.
     * @returns {Pointer<Void>} An <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IAsyncOperation_TResult_">IAsyncOperation&lt;ProtectionPolicyEvaluationResult&gt;</a> with a value of the <a href="https://docs.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult">ProtectionPolicyEvaluationResult</a> enumeration that is the result of the request.
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccessforappwithwindowasync
     */
    RequestAccessForAppWithWindowAsync(appWindow, sourceIdentity, appPackageFamilyName, riid) {
        result := ComCall(6, this, HWND, appWindow, HSTRING, sourceIdentity, HSTRING, appPackageFamilyName, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * Request access to enterprise protected content for an identity. (IProtectionPolicyManagerInterop2.RequestAccessWithAuditingInfoForWindowAsync)
     * @param {HWND} appWindow A handle to the current window.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} targetIdentity The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {IUnknown} auditInfoUnk An audit info object; an instance of <a href="https://docs.microsoft.com/uwp/api/Windows.Security.EnterpriseData.ProtectionPolicyAuditInfo">ProtectionPolicyAuditInfo</a>.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>asyncOperation</i>.
     * @returns {Pointer<Void>} An <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IAsyncOperation_TResult_">IAsyncOperation&lt;ProtectionPolicyEvaluationResult&gt;</a> with a value of the <a href="https://docs.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult">ProtectionPolicyEvaluationResult</a> enumeration that is the result of the request.
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccesswithauditinginfoforwindowasync
     */
    RequestAccessWithAuditingInfoForWindowAsync(appWindow, sourceIdentity, targetIdentity, auditInfoUnk, riid) {
        result := ComCall(7, this, HWND, appWindow, HSTRING, sourceIdentity, HSTRING, targetIdentity, "ptr", auditInfoUnk, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * Request access to enterprise protected content for an identity. (IProtectionPolicyManagerInterop2.RequestAccessWithMessageForWindowAsync)
     * @param {HWND} appWindow A handle to the current window.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} targetIdentity The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {IUnknown} auditInfoUnk An audit info object; an instance of <a href="https://docs.microsoft.com/uwp/api/Windows.Security.EnterpriseData.ProtectionPolicyAuditInfo">ProtectionPolicyAuditInfo</a>.
     * @param {HSTRING} messageFromApp A message that will be displayed in the consent dialog so that the user can make a consent decision.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>asyncOperation</i>.
     * @returns {Pointer<Void>} An <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IAsyncOperation_TResult_">IAsyncOperation&lt;ProtectionPolicyEvaluationResult&gt;</a> with a value of the <a href="https://docs.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult">ProtectionPolicyEvaluationResult</a> enumeration that is the result of the request.
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccesswithmessageforwindowasync
     */
    RequestAccessWithMessageForWindowAsync(appWindow, sourceIdentity, targetIdentity, auditInfoUnk, messageFromApp, riid) {
        result := ComCall(8, this, HWND, appWindow, HSTRING, sourceIdentity, HSTRING, targetIdentity, "ptr", auditInfoUnk, HSTRING, messageFromApp, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * Request access to enterprise-protected content for a specific target app. (IProtectionPolicyManagerInterop2.RequestAccessForAppWithAuditingInfoForWindowAsync)
     * @param {HWND} appWindow A handle to the current window.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} appPackageFamilyName The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {IUnknown} auditInfoUnk An audit info object; an instance of <a href="https://docs.microsoft.com/uwp/api/Windows.Security.EnterpriseData.ProtectionPolicyAuditInfo">ProtectionPolicyAuditInfo</a>.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>asyncOperation</i>.
     * @returns {Pointer<Void>} An <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IAsyncOperation_TResult_">IAsyncOperation&lt;ProtectionPolicyEvaluationResult&gt;</a> with a value of the <a href="https://docs.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult">ProtectionPolicyEvaluationResult</a> enumeration that is the result of the request.
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccessforappwithauditinginfoforwindowasync
     */
    RequestAccessForAppWithAuditingInfoForWindowAsync(appWindow, sourceIdentity, appPackageFamilyName, auditInfoUnk, riid) {
        result := ComCall(9, this, HWND, appWindow, HSTRING, sourceIdentity, HSTRING, appPackageFamilyName, "ptr", auditInfoUnk, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * Request access to enterprise-protected content for a specific target app. (IProtectionPolicyManagerInterop2.RequestAccessForAppWithMessageForWindowAsync)
     * @param {HWND} appWindow A handle to the current window.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} appPackageFamilyName The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {IUnknown} auditInfoUnk An audit info object; an instance of <a href="https://docs.microsoft.com/uwp/api/Windows.Security.EnterpriseData.ProtectionPolicyAuditInfo">ProtectionPolicyAuditInfo</a>.
     * @param {HSTRING} messageFromApp A message that will be displayed in the consent dialog so that the user can make a consent decision.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>asyncOperation</i>.
     * @returns {Pointer<Void>} An <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IAsyncOperation_TResult_">IAsyncOperation&lt;ProtectionPolicyEvaluationResult&gt;</a> with a value of the <a href="https://docs.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult">ProtectionPolicyEvaluationResult</a> enumeration that is the result of the request.
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccessforappwithmessageforwindowasync
     */
    RequestAccessForAppWithMessageForWindowAsync(appWindow, sourceIdentity, appPackageFamilyName, auditInfoUnk, messageFromApp, riid) {
        result := ComCall(10, this, HWND, appWindow, HSTRING, sourceIdentity, HSTRING, appPackageFamilyName, "ptr", auditInfoUnk, HSTRING, messageFromApp, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    Query(iid) {
        if (IProtectionPolicyManagerInterop2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestAccessForAppWithWindowAsync := CallbackCreate(GetMethod(implObj, "RequestAccessForAppWithWindowAsync"), flags, 6)
        this.vtbl.RequestAccessWithAuditingInfoForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestAccessWithAuditingInfoForWindowAsync"), flags, 7)
        this.vtbl.RequestAccessWithMessageForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestAccessWithMessageForWindowAsync"), flags, 8)
        this.vtbl.RequestAccessForAppWithAuditingInfoForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestAccessForAppWithAuditingInfoForWindowAsync"), flags, 7)
        this.vtbl.RequestAccessForAppWithMessageForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestAccessForAppWithMessageForWindowAsync"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestAccessForAppWithWindowAsync)
        CallbackFree(this.vtbl.RequestAccessWithAuditingInfoForWindowAsync)
        CallbackFree(this.vtbl.RequestAccessWithMessageForWindowAsync)
        CallbackFree(this.vtbl.RequestAccessForAppWithAuditingInfoForWindowAsync)
        CallbackFree(this.vtbl.RequestAccessForAppWithMessageForWindowAsync)
    }
}
