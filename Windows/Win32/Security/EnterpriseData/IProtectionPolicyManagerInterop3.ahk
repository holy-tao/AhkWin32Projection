#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\WinRT\HSTRING.ahk
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
     * @returns {Pointer<Pointer<Void>>} 
     */
    RequestAccessWithBehaviorForWindowAsync(appWindow, sourceIdentity, targetIdentity, auditInfoUnk, messageFromApp, behavior, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        if(sourceIdentity is String) {
            pin := HSTRING.Create(sourceIdentity)
            sourceIdentity := pin.Value
        }
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        if(targetIdentity is String) {
            pin := HSTRING.Create(targetIdentity)
            targetIdentity := pin.Value
        }
        targetIdentity := targetIdentity is Win32Handle ? NumGet(targetIdentity, "ptr") : targetIdentity
        if(messageFromApp is String) {
            pin := HSTRING.Create(messageFromApp)
            messageFromApp := pin.Value
        }
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        result := ComCall(6, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", auditInfoUnk, "ptr", messageFromApp, "uint", behavior, "ptr", riid, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @returns {Pointer<Pointer<Void>>} 
     */
    RequestAccessForAppWithBehaviorForWindowAsync(appWindow, sourceIdentity, appPackageFamilyName, auditInfoUnk, messageFromApp, behavior, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        if(sourceIdentity is String) {
            pin := HSTRING.Create(sourceIdentity)
            sourceIdentity := pin.Value
        }
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        if(appPackageFamilyName is String) {
            pin := HSTRING.Create(appPackageFamilyName)
            appPackageFamilyName := pin.Value
        }
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName
        if(messageFromApp is String) {
            pin := HSTRING.Create(messageFromApp)
            messageFromApp := pin.Value
        }
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        result := ComCall(7, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "ptr", auditInfoUnk, "ptr", messageFromApp, "uint", behavior, "ptr", riid, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return asyncOperation
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IUnknown} sourceItemListUnk 
     * @param {HSTRING} appPackageFamilyName 
     * @param {IUnknown} auditInfoUnk 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    RequestAccessToFilesForAppForWindowAsync(appWindow, sourceItemListUnk, appPackageFamilyName, auditInfoUnk, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        if(appPackageFamilyName is String) {
            pin := HSTRING.Create(appPackageFamilyName)
            appPackageFamilyName := pin.Value
        }
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName

        result := ComCall(8, this, "ptr", appWindow, "ptr", sourceItemListUnk, "ptr", appPackageFamilyName, "ptr", auditInfoUnk, "ptr", riid, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @returns {Pointer<Pointer<Void>>} 
     */
    RequestAccessToFilesForAppWithMessageAndBehaviorForWindowAsync(appWindow, sourceItemListUnk, appPackageFamilyName, auditInfoUnk, messageFromApp, behavior, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        if(appPackageFamilyName is String) {
            pin := HSTRING.Create(appPackageFamilyName)
            appPackageFamilyName := pin.Value
        }
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName
        if(messageFromApp is String) {
            pin := HSTRING.Create(messageFromApp)
            messageFromApp := pin.Value
        }
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        result := ComCall(9, this, "ptr", appWindow, "ptr", sourceItemListUnk, "ptr", appPackageFamilyName, "ptr", auditInfoUnk, "ptr", messageFromApp, "uint", behavior, "ptr", riid, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return asyncOperation
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IUnknown} sourceItemListUnk 
     * @param {Integer} processId 
     * @param {IUnknown} auditInfoUnk 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    RequestAccessToFilesForProcessForWindowAsync(appWindow, sourceItemListUnk, processId, auditInfoUnk, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(10, this, "ptr", appWindow, "ptr", sourceItemListUnk, "uint", processId, "ptr", auditInfoUnk, "ptr", riid, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @returns {Pointer<Pointer<Void>>} 
     */
    RequestAccessToFilesForProcessWithMessageAndBehaviorForWindowAsync(appWindow, sourceItemListUnk, processId, auditInfoUnk, messageFromApp, behavior, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        if(messageFromApp is String) {
            pin := HSTRING.Create(messageFromApp)
            messageFromApp := pin.Value
        }
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        result := ComCall(11, this, "ptr", appWindow, "ptr", sourceItemListUnk, "uint", processId, "ptr", auditInfoUnk, "ptr", messageFromApp, "uint", behavior, "ptr", riid, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return asyncOperation
    }
}
