#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ContactChangeTracker.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\AggregateContactManager.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ContactList.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Contact.ahk
#Include .\ContactReader.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactStore2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactStore2
     * @type {Guid}
     */
    static IID => Guid("{18ce1c22-ebd5-4bfb-b690-5f4f27c4f0e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChangeTracker", "add_ContactChanged", "remove_ContactChanged", "get_AggregateContactManager", "FindContactListsAsync", "GetContactListAsync", "CreateContactListAsync", "GetMeContactAsync", "GetContactReader", "GetContactReaderWithOptions", "CreateContactListInAccountAsync"]

    /**
     * @type {ContactChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

    /**
     * @type {AggregateContactManager} 
     */
    AggregateContactManager {
        get => this.get_AggregateContactManager()
    }

    /**
     * 
     * @returns {ContactChangeTracker} 
     */
    get_ChangeTracker() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactChangeTracker(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ContactStore, ContactChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_ContactChanged(value) {
        returnValue := EventRegistrationToken()
        result := ComCall(7, this, "ptr", value, "ptr", returnValue, "int")
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

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AggregateContactManager} 
     */
    get_AggregateContactManager() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AggregateContactManager(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<ContactList>>} 
     */
    FindContactListsAsync() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ContactList), value)
    }

    /**
     * 
     * @param {HSTRING} contactListId 
     * @returns {IAsyncOperation<ContactList>} 
     */
    GetContactListAsync(contactListId) {
        if(contactListId is String) {
            pin := HSTRING.Create(contactListId)
            contactListId := pin.Value
        }
        contactListId := contactListId is Win32Handle ? NumGet(contactListId, "ptr") : contactListId

        result := ComCall(11, this, "ptr", contactListId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ContactList, value)
    }

    /**
     * 
     * @param {HSTRING} displayName 
     * @returns {IAsyncOperation<ContactList>} 
     */
    CreateContactListAsync(displayName) {
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(12, this, "ptr", displayName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ContactList, value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Contact>} 
     */
    GetMeContactAsync() {
        result := ComCall(13, this, "ptr*", &meContact := 0, "int")
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
        result := ComCall(14, this, "ptr*", &value := 0, "int")
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
        result := ComCall(15, this, "ptr", options, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactReader(value)
    }

    /**
     * 
     * @param {HSTRING} displayName 
     * @param {HSTRING} userDataAccountId 
     * @returns {IAsyncOperation<ContactList>} 
     */
    CreateContactListInAccountAsync(displayName, userDataAccountId) {
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName
        if(userDataAccountId is String) {
            pin := HSTRING.Create(userDataAccountId)
            userDataAccountId := pin.Value
        }
        userDataAccountId := userDataAccountId is Win32Handle ? NumGet(userDataAccountId, "ptr") : userDataAccountId

        result := ComCall(16, this, "ptr", displayName, "ptr", userDataAccountId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ContactList, value)
    }
}
