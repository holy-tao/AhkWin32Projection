#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\EmailStore.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailManagerForUser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailManagerForUser
     * @type {Guid}
     */
    static IID => Guid("{f773de9f-3ca5-4b0f-90c1-156e40174ce5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowComposeNewEmailAsync", "RequestStoreAsync", "get_User"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @param {EmailMessage} message 
     * @returns {IAsyncAction} 
     */
    ShowComposeNewEmailAsync(message) {
        result := ComCall(6, this, "ptr", message, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {Integer} accessType 
     * @returns {IAsyncOperation<EmailStore>} 
     */
    RequestStoreAsync(accessType) {
        result := ComCall(7, this, "int", accessType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailStore, result_)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }
}
