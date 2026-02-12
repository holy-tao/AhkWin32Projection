#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\PinnedContactIdsQueryResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IPinnedContactManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPinnedContactManager
     * @type {Guid}
     */
    static IID => Guid("{fcbc740c-e1d6-45c3-b8b6-a35604e167a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_User", "IsPinSurfaceSupported", "IsContactPinned", "RequestPinContactAsync", "RequestPinContactsAsync", "RequestUnpinContactAsync", "SignalContactActivity", "GetPinnedContactIdsAsync"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(6, this, "ptr*", &user_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(user_)
    }

    /**
     * 
     * @param {Integer} surface 
     * @returns {Boolean} 
     */
    IsPinSurfaceSupported(surface) {
        result := ComCall(7, this, "int", surface, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @param {Integer} surface 
     * @returns {Boolean} 
     */
    IsContactPinned(contact_, surface) {
        result := ComCall(8, this, "ptr", contact_, "int", surface, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @param {Integer} surface 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestPinContactAsync(contact_, surface) {
        result := ComCall(9, this, "ptr", contact_, "int", surface, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {IIterable<Contact>} contacts 
     * @param {Integer} surface 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestPinContactsAsync(contacts, surface) {
        result := ComCall(10, this, "ptr", contacts, "int", surface, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @param {Integer} surface 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestUnpinContactAsync(contact_, surface) {
        result := ComCall(11, this, "ptr", contact_, "int", surface, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @returns {HRESULT} 
     */
    SignalContactActivity(contact_) {
        result := ComCall(12, this, "ptr", contact_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<PinnedContactIdsQueryResult>} 
     */
    GetPinnedContactIdsAsync() {
        result := ComCall(13, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PinnedContactIdsQueryResult, operation)
    }
}
