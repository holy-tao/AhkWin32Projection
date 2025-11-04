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
     * 
     * @param {HWND} appWindow 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} appPackageFamilyName 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} asyncOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccessforappwithwindowasync
     */
    RequestAccessForAppWithWindowAsync(appWindow, sourceIdentity, appPackageFamilyName, riid, asyncOperation) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName

        asyncOperationMarshal := asyncOperation is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "ptr", riid, asyncOperationMarshal, asyncOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} targetIdentity 
     * @param {IUnknown} auditInfoUnk 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} asyncOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccesswithauditinginfoforwindowasync
     */
    RequestAccessWithAuditingInfoForWindowAsync(appWindow, sourceIdentity, targetIdentity, auditInfoUnk, riid, asyncOperation) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        targetIdentity := targetIdentity is Win32Handle ? NumGet(targetIdentity, "ptr") : targetIdentity

        asyncOperationMarshal := asyncOperation is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", auditInfoUnk, "ptr", riid, asyncOperationMarshal, asyncOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} targetIdentity 
     * @param {IUnknown} auditInfoUnk 
     * @param {HSTRING} messageFromApp 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} asyncOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccesswithmessageforwindowasync
     */
    RequestAccessWithMessageForWindowAsync(appWindow, sourceIdentity, targetIdentity, auditInfoUnk, messageFromApp, riid, asyncOperation) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        targetIdentity := targetIdentity is Win32Handle ? NumGet(targetIdentity, "ptr") : targetIdentity
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        asyncOperationMarshal := asyncOperation is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", auditInfoUnk, "ptr", messageFromApp, "ptr", riid, asyncOperationMarshal, asyncOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} appPackageFamilyName 
     * @param {IUnknown} auditInfoUnk 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} asyncOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccessforappwithauditinginfoforwindowasync
     */
    RequestAccessForAppWithAuditingInfoForWindowAsync(appWindow, sourceIdentity, appPackageFamilyName, auditInfoUnk, riid, asyncOperation) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName

        asyncOperationMarshal := asyncOperation is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "ptr", auditInfoUnk, "ptr", riid, asyncOperationMarshal, asyncOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} appPackageFamilyName 
     * @param {IUnknown} auditInfoUnk 
     * @param {HSTRING} messageFromApp 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} asyncOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop2-requestaccessforappwithmessageforwindowasync
     */
    RequestAccessForAppWithMessageForWindowAsync(appWindow, sourceIdentity, appPackageFamilyName, auditInfoUnk, messageFromApp, riid, asyncOperation) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        asyncOperationMarshal := asyncOperation is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "ptr", auditInfoUnk, "ptr", messageFromApp, "ptr", riid, asyncOperationMarshal, asyncOperation, "HRESULT")
        return result
    }
}
