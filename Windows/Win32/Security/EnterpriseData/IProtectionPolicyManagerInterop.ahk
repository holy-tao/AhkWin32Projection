#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\WinRT\IInspectable.ahk

/**
 * Manages enterprise protection policy on protected content.
 * @see https://docs.microsoft.com/windows/win32/api//efswrtinterop/nn-efswrtinterop-iprotectionpolicymanagerinterop
 * @namespace Windows.Win32.Security.EnterpriseData
 * @version v4.0.30319
 */
class IProtectionPolicyManagerInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectionPolicyManagerInterop
     * @type {Guid}
     */
    static IID => Guid("{4652651d-c1fe-4ba1-9f0a-c0f56596f721}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAccessForWindowAsync", "GetForWindow"]

    /**
     * Request access to enterprise protected content for an identity.
     * @param {HWND} appWindow A handle to the current window.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} targetIdentity The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>asyncOperation</i>.
     * @returns {Pointer<Void>} An <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IAsyncOperation_TResult_">IAsyncOperation<ProtectionPolicyEvaluationResult></a> with a value of the <a href="https://docs.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult">ProtectionPolicyEvaluationResult</a> enumeration that is the result of the request.
     * @see https://docs.microsoft.com/windows/win32/api//efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop-requestaccessforwindowasync
     */
    RequestAccessForWindowAsync(appWindow, sourceIdentity, targetIdentity, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        targetIdentity := targetIdentity is Win32Handle ? NumGet(targetIdentity, "ptr") : targetIdentity

        result := ComCall(6, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * Returns the protection policy manager object associated with the current app window.
     * @param {HWND} appWindow A handle to the current window.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>result</i>.
     * @returns {Pointer<Void>} The protection policy manager object for the current window.
     * @see https://docs.microsoft.com/windows/win32/api//efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "ptr", riid, "ptr*", &result := 0, "HRESULT")
        return result
    }
}
