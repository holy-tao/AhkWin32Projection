#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\Contact.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactStore
     * @type {Guid}
     */
    static IID => Guid("{2c220b10-3a6c-4293-b9bc-fe987f6e0d52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindContactsAsync", "FindContactsWithSearchTextAsync", "GetContactAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<Contact>>} 
     */
    FindContactsAsync() {
        result := ComCall(6, this, "ptr*", &contacts := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Contact), contacts)
    }

    /**
     * 
     * @param {HSTRING} searchText 
     * @returns {IAsyncOperation<IVectorView<Contact>>} 
     */
    FindContactsWithSearchTextAsync(searchText) {
        if(searchText is String) {
            pin := HSTRING.Create(searchText)
            searchText := pin.Value
        }
        searchText := searchText is Win32Handle ? NumGet(searchText, "ptr") : searchText

        result := ComCall(7, this, "ptr", searchText, "ptr*", &contacts := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Contact), contacts)
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

        result := ComCall(8, this, "ptr", contactId, "ptr*", &contacts := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Contact, contacts)
    }
}
