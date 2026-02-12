#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContactChangeTracker.ahk
#Include .\ContactListSyncManager.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\Contact.ahk
#Include .\ContactReader.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactList extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactList
     * @type {Guid}
     */
    static IID => Guid("{16ddec75-392c-4845-9dfb-51a3e7ef3e42}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_DisplayName", "put_DisplayName", "get_SourceDisplayName", "get_IsHidden", "put_IsHidden", "get_OtherAppReadAccess", "put_OtherAppReadAccess", "get_OtherAppWriteAccess", "put_OtherAppWriteAccess", "get_ChangeTracker", "get_SyncManager", "get_SupportsServerSearch", "get_UserDataAccountId", "add_ContactChanged", "remove_ContactChanged", "SaveAsync", "DeleteAsync", "GetContactFromRemoteIdAsync", "GetMeContactAsync", "GetContactReader", "GetContactReaderWithOptions", "SaveContactAsync", "DeleteContactAsync", "GetContactAsync"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {HSTRING} 
     */
    SourceDisplayName {
        get => this.get_SourceDisplayName()
    }

    /**
     * @type {Boolean} 
     */
    IsHidden {
        get => this.get_IsHidden()
        set => this.put_IsHidden(value)
    }

    /**
     * @type {Integer} 
     */
    OtherAppReadAccess {
        get => this.get_OtherAppReadAccess()
        set => this.put_OtherAppReadAccess(value)
    }

    /**
     * @type {Integer} 
     */
    OtherAppWriteAccess {
        get => this.get_OtherAppWriteAccess()
        set => this.put_OtherAppWriteAccess(value)
    }

    /**
     * @type {ContactChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

    /**
     * @type {ContactListSyncManager} 
     */
    SyncManager {
        get => this.get_SyncManager()
    }

    /**
     * @type {Boolean} 
     */
    SupportsServerSearch {
        get => this.get_SupportsServerSearch()
    }

    /**
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceDisplayName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHidden() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_IsHidden(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppReadAccess() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppReadAccess(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppWriteAccess() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppWriteAccess(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ContactChangeTracker} 
     */
    get_ChangeTracker() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactChangeTracker(value)
    }

    /**
     * 
     * @returns {ContactListSyncManager} 
     */
    get_SyncManager() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactListSyncManager(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsServerSearch() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDataAccountId() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<ContactList, ContactChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_ContactChanged(value) {
        returnValue := EventRegistrationToken()
        result := ComCall(20, this, "ptr", value, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_ContactChanged(value) {
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SaveAsync() {
        result := ComCall(22, this, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(returnValue)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DeleteAsync() {
        result := ComCall(23, this, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(returnValue)
    }

    /**
     * 
     * @param {HSTRING} remoteId 
     * @returns {IAsyncOperation<Contact>} 
     */
    GetContactFromRemoteIdAsync(remoteId) {
        if(remoteId is String) {
            pin := HSTRING.Create(remoteId)
            remoteId := pin.Value
        }
        remoteId := remoteId is Win32Handle ? NumGet(remoteId, "ptr") : remoteId

        result := ComCall(24, this, "ptr", remoteId, "ptr*", &contact_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Contact, contact_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Contact>} 
     */
    GetMeContactAsync() {
        result := ComCall(25, this, "ptr*", &meContact := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Contact, meContact)
    }

    /**
     * 
     * @returns {ContactReader} 
     */
    GetContactReader() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactReader(value)
    }

    /**
     * 
     * @param {ContactQueryOptions} options 
     * @returns {ContactReader} 
     */
    GetContactReaderWithOptions(options) {
        result := ComCall(27, this, "ptr", options, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactReader(value)
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @returns {IAsyncAction} 
     */
    SaveContactAsync(contact_) {
        result := ComCall(28, this, "ptr", contact_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @returns {IAsyncAction} 
     */
    DeleteContactAsync(contact_) {
        result := ComCall(29, this, "ptr", contact_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @param {HSTRING} contactId 
     * @returns {IAsyncOperation<Contact>} 
     */
    GetContactAsync(contactId) {
        if(contactId is String) {
            pin := HSTRING.Create(contactId)
            contactId := pin.Value
        }
        contactId := contactId is Win32Handle ? NumGet(contactId, "ptr") : contactId

        result := ComCall(30, this, "ptr", contactId, "ptr*", &contacts := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Contact, contacts)
    }
}
