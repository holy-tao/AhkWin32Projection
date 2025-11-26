#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\WinRT\IInspectable.ahk

/**
 * Manages enterprise protection policy on protected content.
 * @see https://docs.microsoft.com/windows/win32/api//efswrtinterop/nn-efswrtinterop-iprotectionpolicymanagerinterop2
 * @namespace Windows.Win32.Security.EnterpriseData
 * @version v4.0.30319
 */
class IProtectionPolicyManagerInterop2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectionPolicyManagerInterop2
     * @type {Guid}
     */
    static IID => Guid("{157cfbe4-a78d-4156-b384-61fdac41e686}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAccessForAppWithWindowAsync", "RequestAccessWithAuditingInfoForWindowAsync", "RequestAccessWithMessageForWindowAsync", "RequestAccessForAppWithAuditingInfoForWindowAsync", "RequestAccessForAppWithMessageForWindowAsync"]

    /**
     * Request access to enterprise-protected content for a specific target app.
     * @param {HWND} appWindow A handle to the current window.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} appPackageFamilyName The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>asyncOperation</i>.
     * @returns {Pointer<Void>} An <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IAsyncOperation_TResult_">IAsyncOperation<ProtectionPolicyEvaluationResult></a> with a value of the <a href="https://docs.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult">ProtectionPolicyEvaluationResult</a> enumeration that is the result of the request.
     * @see https://docs.microsoft.com/windows/win32/api//efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccessforappwithwindowasync
     */
    RequestAccessForAppWithWindowAsync(appWindow, sourceIdentity, appPackageFamilyName, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName

        result := ComCall(6, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * Request access to enterprise protected content for an identity.
     * @param {HWND} appWindow A handle to the current window.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} targetIdentity The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {IUnknown} auditInfoUnk An audit info object; an instance of <a href="https://docs.microsoft.com/uwp/api/Windows.Security.EnterpriseData.ProtectionPolicyAuditInfo">ProtectionPolicyAuditInfo</a>.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>asyncOperation</i>.
     * @returns {Pointer<Void>} An <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IAsyncOperation_TResult_">IAsyncOperation<ProtectionPolicyEvaluationResult></a> with a value of the <a href="https://docs.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult">ProtectionPolicyEvaluationResult</a> enumeration that is the result of the request.
     * @see https://docs.microsoft.com/windows/win32/api//efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccesswithauditinginfoforwindowasync
     */
    RequestAccessWithAuditingInfoForWindowAsync(appWindow, sourceIdentity, targetIdentity, auditInfoUnk, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        targetIdentity := targetIdentity is Win32Handle ? NumGet(targetIdentity, "ptr") : targetIdentity

        result := ComCall(7, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", auditInfoUnk, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * Request access to enterprise protected content for an identity.
     * @param {HWND} appWindow A handle to the current window.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} targetIdentity The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {IUnknown} auditInfoUnk An audit info object; an instance of <a href="https://docs.microsoft.com/uwp/api/Windows.Security.EnterpriseData.ProtectionPolicyAuditInfo">ProtectionPolicyAuditInfo</a>.
     * @param {HSTRING} messageFromApp A message that will be displayed in the consent dialog so that the user can make a consent decision.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>asyncOperation</i>.
     * @returns {Pointer<Void>} An <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IAsyncOperation_TResult_">IAsyncOperation<ProtectionPolicyEvaluationResult></a> with a value of the <a href="https://docs.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult">ProtectionPolicyEvaluationResult</a> enumeration that is the result of the request.
     * @see https://docs.microsoft.com/windows/win32/api//efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccesswithmessageforwindowasync
     */
    RequestAccessWithMessageForWindowAsync(appWindow, sourceIdentity, targetIdentity, auditInfoUnk, messageFromApp, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        targetIdentity := targetIdentity is Win32Handle ? NumGet(targetIdentity, "ptr") : targetIdentity
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        result := ComCall(8, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", auditInfoUnk, "ptr", messageFromApp, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * Request access to enterprise-protected content for a specific target app.
     * @param {HWND} appWindow A handle to the current window.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} appPackageFamilyName The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {IUnknown} auditInfoUnk An audit info object; an instance of <a href="https://docs.microsoft.com/uwp/api/Windows.Security.EnterpriseData.ProtectionPolicyAuditInfo">ProtectionPolicyAuditInfo</a>.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>asyncOperation</i>.
     * @returns {Pointer<Void>} An <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IAsyncOperation_TResult_">IAsyncOperation<ProtectionPolicyEvaluationResult></a> with a value of the <a href="https://docs.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult">ProtectionPolicyEvaluationResult</a> enumeration that is the result of the request.
     * @see https://docs.microsoft.com/windows/win32/api//efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccessforappwithauditinginfoforwindowasync
     */
    RequestAccessForAppWithAuditingInfoForWindowAsync(appWindow, sourceIdentity, appPackageFamilyName, auditInfoUnk, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName

        result := ComCall(9, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "ptr", auditInfoUnk, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * Request access to enterprise-protected content for a specific target app.
     * @param {HWND} appWindow A handle to the current window.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} appPackageFamilyName The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {IUnknown} auditInfoUnk An audit info object; an instance of <a href="https://docs.microsoft.com/uwp/api/Windows.Security.EnterpriseData.ProtectionPolicyAuditInfo">ProtectionPolicyAuditInfo</a>.
     * @param {HSTRING} messageFromApp A message that will be displayed in the consent dialog so that the user can make a consent decision.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>asyncOperation</i>.
     * @returns {Pointer<Void>} An <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IAsyncOperation_TResult_">IAsyncOperation<ProtectionPolicyEvaluationResult></a> with a value of the <a href="https://docs.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult">ProtectionPolicyEvaluationResult</a> enumeration that is the result of the request.
     * @see https://docs.microsoft.com/windows/win32/api//efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccessforappwithmessageforwindowasync
     */
    RequestAccessForAppWithMessageForWindowAsync(appWindow, sourceIdentity, appPackageFamilyName, auditInfoUnk, messageFromApp, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        result := ComCall(10, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "ptr", auditInfoUnk, "ptr", messageFromApp, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }
}
