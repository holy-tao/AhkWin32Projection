#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PhoneCallHistoryStore.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCallHistoryManagerForUser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallHistoryManagerForUser
     * @type {Guid}
     */
    static IID => Guid("{d925c523-f55f-4353-9db4-0205a5265a55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestStoreAsync", "get_User"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @param {Integer} accessType 
     * @returns {IAsyncOperation<PhoneCallHistoryStore>} 
     */
    RequestStoreAsync(accessType) {
        result := ComCall(6, this, "int", accessType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PhoneCallHistoryStore, result_)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }
}
