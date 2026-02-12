#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IProtectionPolicyManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectionPolicyManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{b68f9a8c-39e0-4649-b2e4-070ab8a579b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HasContentBeenRevokedSince", "CheckAccessForApp", "RequestAccessForAppAsync", "GetEnforcementLevel", "IsUserDecryptionAllowed", "IsProtectionUnderLockRequired", "add_PolicyChanged", "remove_PolicyChanged", "get_IsProtectionEnabled"]

    /**
     * @type {Boolean} 
     */
    IsProtectionEnabled {
        get => this.get_IsProtectionEnabled()
    }

    /**
     * 
     * @param {HSTRING} identity 
     * @param {DateTime} since 
     * @returns {Boolean} 
     */
    HasContentBeenRevokedSince(identity, since) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(6, this, "ptr", identity, "ptr", since, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} appPackageFamilyName 
     * @returns {Integer} 
     */
    CheckAccessForApp(sourceIdentity, appPackageFamilyName) {
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

        result := ComCall(7, this, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} appPackageFamilyName 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessForAppAsync(sourceIdentity, appPackageFamilyName) {
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

        result := ComCall(8, this, "ptr", sourceIdentity, "ptr", appPackageFamilyName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {HSTRING} identity 
     * @returns {Integer} 
     */
    GetEnforcementLevel(identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(9, this, "ptr", identity, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} identity 
     * @returns {Boolean} 
     */
    IsUserDecryptionAllowed(identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(10, this, "ptr", identity, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} identity 
     * @returns {Boolean} 
     */
    IsProtectionUnderLockRequired(identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(11, this, "ptr", identity, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PolicyChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PolicyChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProtectionEnabled() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
