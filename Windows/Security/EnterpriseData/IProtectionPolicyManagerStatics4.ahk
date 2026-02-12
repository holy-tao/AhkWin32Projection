#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IProtectionPolicyManagerStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectionPolicyManagerStatics4
     * @type {Guid}
     */
    static IID => Guid("{20b794db-ccbd-490f-8c83-49ccb77aea6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsRoamableProtectionEnabled", "RequestAccessWithBehaviorAsync", "RequestAccessForAppWithBehaviorAsync", "RequestAccessToFilesForAppAsync", "RequestAccessToFilesForAppWithMessageAndBehaviorAsync", "RequestAccessToFilesForProcessAsync", "RequestAccessToFilesForProcessWithMessageAndBehaviorAsync", "IsFileProtectionRequiredAsync", "IsFileProtectionRequiredForNewFileAsync", "get_PrimaryManagedIdentity", "GetPrimaryManagedIdentityForIdentity"]

    /**
     * @type {HSTRING} 
     */
    PrimaryManagedIdentity {
        get => this.get_PrimaryManagedIdentity()
    }

    /**
     * 
     * @param {HSTRING} identity 
     * @returns {Boolean} 
     */
    IsRoamableProtectionEnabled(identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(6, this, "ptr", identity, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} targetIdentity 
     * @param {ProtectionPolicyAuditInfo} auditInfo 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessWithBehaviorAsync(sourceIdentity, targetIdentity, auditInfo, messageFromApp, behavior) {
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

        result := ComCall(7, this, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", auditInfo, "ptr", messageFromApp, "int", behavior, "ptr*", &result_ := 0, "int")
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
     * @param {Integer} behavior 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessForAppWithBehaviorAsync(sourceIdentity, appPackageFamilyName, auditInfo, messageFromApp, behavior) {
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

        result := ComCall(8, this, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "ptr", auditInfo, "ptr", messageFromApp, "int", behavior, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {IIterable<IStorageItem>} sourceItemList 
     * @param {HSTRING} appPackageFamilyName 
     * @param {ProtectionPolicyAuditInfo} auditInfo 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessToFilesForAppAsync(sourceItemList, appPackageFamilyName, auditInfo) {
        if(appPackageFamilyName is String) {
            pin := HSTRING.Create(appPackageFamilyName)
            appPackageFamilyName := pin.Value
        }
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName

        result := ComCall(9, this, "ptr", sourceItemList, "ptr", appPackageFamilyName, "ptr", auditInfo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {IIterable<IStorageItem>} sourceItemList 
     * @param {HSTRING} appPackageFamilyName 
     * @param {ProtectionPolicyAuditInfo} auditInfo 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessToFilesForAppWithMessageAndBehaviorAsync(sourceItemList, appPackageFamilyName, auditInfo, messageFromApp, behavior) {
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

        result := ComCall(10, this, "ptr", sourceItemList, "ptr", appPackageFamilyName, "ptr", auditInfo, "ptr", messageFromApp, "int", behavior, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {IIterable<IStorageItem>} sourceItemList 
     * @param {Integer} processId 
     * @param {ProtectionPolicyAuditInfo} auditInfo 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessToFilesForProcessAsync(sourceItemList, processId, auditInfo) {
        result := ComCall(11, this, "ptr", sourceItemList, "uint", processId, "ptr", auditInfo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {IIterable<IStorageItem>} sourceItemList 
     * @param {Integer} processId 
     * @param {ProtectionPolicyAuditInfo} auditInfo 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessToFilesForProcessWithMessageAndBehaviorAsync(sourceItemList, processId, auditInfo, messageFromApp, behavior) {
        if(messageFromApp is String) {
            pin := HSTRING.Create(messageFromApp)
            messageFromApp := pin.Value
        }
        messageFromApp := messageFromApp is Win32Handle ? NumGet(messageFromApp, "ptr") : messageFromApp

        result := ComCall(12, this, "ptr", sourceItemList, "uint", processId, "ptr", auditInfo, "ptr", messageFromApp, "int", behavior, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {IStorageItem} target 
     * @param {HSTRING} identity 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsFileProtectionRequiredAsync(target, identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(13, this, "ptr", target, "ptr", identity, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {IStorageFolder} parentFolder 
     * @param {HSTRING} identity 
     * @param {HSTRING} desiredName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsFileProtectionRequiredForNewFileAsync(parentFolder, identity, desiredName) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(14, this, "ptr", parentFolder, "ptr", identity, "ptr", desiredName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrimaryManagedIdentity() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} identity 
     * @returns {HSTRING} 
     */
    GetPrimaryManagedIdentityForIdentity(identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        value := HSTRING()
        result := ComCall(16, this, "ptr", identity, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
