#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Win32.Security.EnterpriseData
 * @version v4.0.30319
 */
class IProtectionPolicyManagerInterop3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectionPolicyManagerInterop3
     * @type {Guid}
     */
    static IID => Guid("{c1c03933-b398-4d93-b0fd-2972adf802c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAccessWithBehaviorForWindowAsync", "RequestAccessForAppWithBehaviorForWindowAsync", "RequestAccessToFilesForAppForWindowAsync", "RequestAccessToFilesForAppWithMessageAndBehaviorForWindowAsync", "RequestAccessToFilesForProcessForWindowAsync", "RequestAccessToFilesForProcessWithMessageAndBehaviorForWindowAsync"]

    /**
     * 
     * @param {HWND} appWindow 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} targetIdentity 
     * @param {IUnknown} auditInfoUnk 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RequestAccessWithBehaviorForWindowAsync(appWindow, sourceIdentity, targetIdentity, auditInfoUnk, messageFromApp, behavior, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        targetIdentity := targetIdentity is Win32Handle ? NumGet(targetIdentity, "ptr") : targetIdentity
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        result := ComCall(6, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", auditInfoUnk, "ptr", messageFromApp, "uint", behavior, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} appPackageFamilyName 
     * @param {IUnknown} auditInfoUnk 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RequestAccessForAppWithBehaviorForWindowAsync(appWindow, sourceIdentity, appPackageFamilyName, auditInfoUnk, messageFromApp, behavior, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        result := ComCall(7, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "ptr", auditInfoUnk, "ptr", messageFromApp, "uint", behavior, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IUnknown} sourceItemListUnk 
     * @param {HSTRING} appPackageFamilyName 
     * @param {IUnknown} auditInfoUnk 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RequestAccessToFilesForAppForWindowAsync(appWindow, sourceItemListUnk, appPackageFamilyName, auditInfoUnk, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName

        result := ComCall(8, this, "ptr", appWindow, "ptr", sourceItemListUnk, "ptr", appPackageFamilyName, "ptr", auditInfoUnk, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IUnknown} sourceItemListUnk 
     * @param {HSTRING} appPackageFamilyName 
     * @param {IUnknown} auditInfoUnk 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RequestAccessToFilesForAppWithMessageAndBehaviorForWindowAsync(appWindow, sourceItemListUnk, appPackageFamilyName, auditInfoUnk, messageFromApp, behavior, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        result := ComCall(9, this, "ptr", appWindow, "ptr", sourceItemListUnk, "ptr", appPackageFamilyName, "ptr", auditInfoUnk, "ptr", messageFromApp, "uint", behavior, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IUnknown} sourceItemListUnk 
     * @param {Integer} processId 
     * @param {IUnknown} auditInfoUnk 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RequestAccessToFilesForProcessForWindowAsync(appWindow, sourceItemListUnk, processId, auditInfoUnk, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(10, this, "ptr", appWindow, "ptr", sourceItemListUnk, "uint", processId, "ptr", auditInfoUnk, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IUnknown} sourceItemListUnk 
     * @param {Integer} processId 
     * @param {IUnknown} auditInfoUnk 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RequestAccessToFilesForProcessWithMessageAndBehaviorForWindowAsync(appWindow, sourceItemListUnk, processId, auditInfoUnk, messageFromApp, behavior, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        result := ComCall(11, this, "ptr", appWindow, "ptr", sourceItemListUnk, "uint", processId, "ptr", auditInfoUnk, "ptr", messageFromApp, "uint", behavior, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }
}
