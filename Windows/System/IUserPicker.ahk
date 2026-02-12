#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\User.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IUserPicker extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserPicker
     * @type {Guid}
     */
    static IID => Guid("{7d548008-f1e3-4a6c-8ddc-a9bb0f488aed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowGuestAccounts", "put_AllowGuestAccounts", "get_SuggestedSelectedUser", "put_SuggestedSelectedUser", "PickSingleUserAsync"]

    /**
     * @type {Boolean} 
     */
    AllowGuestAccounts {
        get => this.get_AllowGuestAccounts()
        set => this.put_AllowGuestAccounts(value)
    }

    /**
     * @type {User} 
     */
    SuggestedSelectedUser {
        get => this.get_SuggestedSelectedUser()
        set => this.put_SuggestedSelectedUser(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowGuestAccounts() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowGuestAccounts(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {User} 
     */
    get_SuggestedSelectedUser() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }

    /**
     * 
     * @param {User} value 
     * @returns {HRESULT} 
     */
    put_SuggestedSelectedUser(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<User>} 
     */
    PickSingleUserAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(User, operation)
    }
}
