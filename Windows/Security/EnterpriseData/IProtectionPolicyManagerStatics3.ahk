#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IProtectionPolicyManagerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectionPolicyManagerStatics3
     * @type {Guid}
     */
    static IID => Guid("{48ff9e8c-6a6f-4d9f-bced-18ab537aa015}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAccessWithAuditingInfoAsync", "RequestAccessWithMessageAsync", "RequestAccessForAppWithAuditingInfoAsync", "RequestAccessForAppWithMessageAsync", "LogAuditEvent"]

    /**
     * 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} targetIdentity 
     * @param {ProtectionPolicyAuditInfo} auditInfo 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessWithAuditingInfoAsync(sourceIdentity, targetIdentity, auditInfo) {
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

        result := ComCall(6, this, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", auditInfo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} targetIdentity 
     * @param {ProtectionPolicyAuditInfo} auditInfo 
     * @param {HSTRING} messageFromApp 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessWithMessageAsync(sourceIdentity, targetIdentity, auditInfo, messageFromApp) {
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

        result := ComCall(7, this, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", auditInfo, "ptr", messageFromApp, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} appPackageFamilyName 
     * @param {ProtectionPolicyAuditInfo} auditInfo 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessForAppWithAuditingInfoAsync(sourceIdentity, appPackageFamilyName, auditInfo) {
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

        result := ComCall(8, this, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "ptr", auditInfo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} appPackageFamilyName 
     * @param {ProtectionPolicyAuditInfo} auditInfo 
     * @param {HSTRING} messageFromApp 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessForAppWithMessageAsync(sourceIdentity, appPackageFamilyName, auditInfo, messageFromApp) {
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

        result := ComCall(9, this, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "ptr", auditInfo, "ptr", messageFromApp, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} targetIdentity 
     * @param {ProtectionPolicyAuditInfo} auditInfo 
     * @returns {HRESULT} 
     */
    LogAuditEvent(sourceIdentity, targetIdentity, auditInfo) {
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

        result := ComCall(10, this, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", auditInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
