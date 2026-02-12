#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\OnlineIdSystemTicketResult.ahk
#Include ..\..\..\System\User.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class IOnlineIdSystemAuthenticatorForUser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOnlineIdSystemAuthenticatorForUser
     * @type {Guid}
     */
    static IID => Guid("{5798befb-1de4-4186-a2e6-b563f86aaf44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTicketAsync", "put_ApplicationId", "get_ApplicationId", "get_User"]

    /**
     * @type {Guid} 
     */
    ApplicationId {
        get => this.get_ApplicationId()
        set => this.put_ApplicationId(value)
    }

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @param {OnlineIdServiceTicketRequest} request 
     * @returns {IAsyncOperation<OnlineIdSystemTicketResult>} 
     */
    GetTicketAsync(request) {
        result := ComCall(6, this, "ptr", request, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(OnlineIdSystemTicketResult, operation)
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_ApplicationId(value) {
        result := ComCall(7, this, "ptr", value, "int")
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
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(9, this, "ptr*", &user_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(user_)
    }
}
