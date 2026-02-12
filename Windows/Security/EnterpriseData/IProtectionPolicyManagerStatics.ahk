#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ThreadNetworkContext.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\ProtectionPolicyManager.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IProtectionPolicyManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectionPolicyManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{c0bffc66-8c3d-4d56-8804-c68f0ad32ec5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsIdentityManaged", "TryApplyProcessUIPolicy", "ClearProcessUIPolicy", "CreateCurrentThreadNetworkContext", "GetPrimaryManagedIdentityForNetworkEndpointAsync", "RevokeContent", "GetForCurrentView", "add_ProtectedAccessSuspending", "remove_ProtectedAccessSuspending", "add_ProtectedAccessResumed", "remove_ProtectedAccessResumed", "add_ProtectedContentRevoked", "remove_ProtectedContentRevoked", "CheckAccess", "RequestAccessAsync"]

    /**
     * 
     * @param {HSTRING} identity 
     * @returns {Boolean} 
     */
    IsIdentityManaged(identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(6, this, "ptr", identity, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} identity 
     * @returns {Boolean} 
     */
    TryApplyProcessUIPolicy(identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(7, this, "ptr", identity, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearProcessUIPolicy() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} identity 
     * @returns {ThreadNetworkContext} 
     */
    CreateCurrentThreadNetworkContext(identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(9, this, "ptr", identity, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ThreadNetworkContext(result_)
    }

    /**
     * 
     * @param {HostName} endpointHost 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetPrimaryManagedIdentityForNetworkEndpointAsync(endpointHost) {
        result := ComCall(10, this, "ptr", endpointHost, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {HSTRING} identity 
     * @returns {HRESULT} 
     */
    RevokeContent(identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(11, this, "ptr", identity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ProtectionPolicyManager} 
     */
    GetForCurrentView() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProtectionPolicyManager(result_)
    }

    /**
     * 
     * @param {EventHandler<ProtectedAccessSuspendingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProtectedAccessSuspending(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_ProtectedAccessSuspending(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<ProtectedAccessResumedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProtectedAccessResumed(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
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
    remove_ProtectedAccessResumed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<ProtectedContentRevokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProtectedContentRevoked(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
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
    remove_ProtectedContentRevoked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether all values from a Sample, Gather, or Load operation accessed mapped tiles in a tiled resource.
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} targetIdentity 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/checkaccessfullymapped
     */
    CheckAccess(sourceIdentity, targetIdentity) {
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

        result := ComCall(19, this, "ptr", sourceIdentity, "ptr", targetIdentity, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} targetIdentity 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync(sourceIdentity, targetIdentity) {
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

        result := ComCall(20, this, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }
}
