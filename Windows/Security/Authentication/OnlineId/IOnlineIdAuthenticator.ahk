#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\UserAuthenticationOperation.ahk
#Include .\SignOutUserOperation.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class IOnlineIdAuthenticator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOnlineIdAuthenticator
     * @type {Guid}
     */
    static IID => Guid("{a003f58a-29ab-4817-b884-d7516dad18b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AuthenticateUserAsync", "AuthenticateUserAsyncAdvanced", "SignOutUserAsync", "put_ApplicationId", "get_ApplicationId", "get_CanSignOut", "get_AuthenticatedSafeCustomerId"]

    /**
     * @type {Guid} 
     */
    ApplicationId {
        get => this.get_ApplicationId()
        set => this.put_ApplicationId(value)
    }

    /**
     * @type {Boolean} 
     */
    CanSignOut {
        get => this.get_CanSignOut()
    }

    /**
     * @type {HSTRING} 
     */
    AuthenticatedSafeCustomerId {
        get => this.get_AuthenticatedSafeCustomerId()
    }

    /**
     * 
     * @param {OnlineIdServiceTicketRequest} request 
     * @returns {UserAuthenticationOperation} 
     */
    AuthenticateUserAsync(request) {
        result := ComCall(6, this, "ptr", request, "ptr*", &authenticationOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserAuthenticationOperation(authenticationOperation)
    }

    /**
     * 
     * @param {IIterable<OnlineIdServiceTicketRequest>} requests 
     * @param {Integer} credentialPromptType_ 
     * @returns {UserAuthenticationOperation} 
     */
    AuthenticateUserAsyncAdvanced(requests, credentialPromptType_) {
        result := ComCall(7, this, "ptr", requests, "int", credentialPromptType_, "ptr*", &authenticationOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserAuthenticationOperation(authenticationOperation)
    }

    /**
     * 
     * @returns {SignOutUserOperation} 
     */
    SignOutUserAsync() {
        result := ComCall(8, this, "ptr*", &signOutUserOperation_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SignOutUserOperation(signOutUserOperation_)
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_ApplicationId(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ApplicationId() {
        value := Guid()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSignOut() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AuthenticatedSafeCustomerId() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
