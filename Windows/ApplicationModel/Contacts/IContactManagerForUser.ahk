#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Storage\Streams\RandomAccessStreamReference.ahk
#Include .\Contact.ahk
#Include .\ContactStore.ahk
#Include .\ContactAnnotationStore.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactManagerForUser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactManagerForUser
     * @type {Guid}
     */
    static IID => Guid("{b74bba57-1076-4bef-aef3-54686d18387d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConvertContactToVCardAsync", "ConvertContactToVCardAsyncWithMaxBytes", "ConvertVCardToContactAsync", "RequestStoreAsync", "RequestAnnotationStoreAsync", "get_SystemDisplayNameOrder", "put_SystemDisplayNameOrder", "get_SystemSortOrder", "put_SystemSortOrder", "get_User"]

    /**
     * @type {Integer} 
     */
    SystemDisplayNameOrder {
        get => this.get_SystemDisplayNameOrder()
        set => this.put_SystemDisplayNameOrder(value)
    }

    /**
     * @type {Integer} 
     */
    SystemSortOrder {
        get => this.get_SystemSortOrder()
        set => this.put_SystemSortOrder(value)
    }

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @returns {IAsyncOperation<RandomAccessStreamReference>} 
     */
    ConvertContactToVCardAsync(contact_) {
        result := ComCall(6, this, "ptr", contact_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RandomAccessStreamReference, result_)
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @param {Integer} maxBytes 
     * @returns {IAsyncOperation<RandomAccessStreamReference>} 
     */
    ConvertContactToVCardAsyncWithMaxBytes(contact_, maxBytes) {
        result := ComCall(7, this, "ptr", contact_, "uint", maxBytes, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RandomAccessStreamReference, result_)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} vCard 
     * @returns {IAsyncOperation<Contact>} 
     */
    ConvertVCardToContactAsync(vCard) {
        result := ComCall(8, this, "ptr", vCard, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Contact, result_)
    }

    /**
     * 
     * @param {Integer} accessType 
     * @returns {IAsyncOperation<ContactStore>} 
     */
    RequestStoreAsync(accessType) {
        result := ComCall(9, this, "int", accessType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ContactStore, result_)
    }

    /**
     * 
     * @param {Integer} accessType 
     * @returns {IAsyncOperation<ContactAnnotationStore>} 
     */
    RequestAnnotationStoreAsync(accessType) {
        result := ComCall(10, this, "int", accessType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ContactAnnotationStore, result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SystemDisplayNameOrder() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_SystemDisplayNameOrder(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SystemSortOrder() {
        result := ComCall(13, this, "int*", &value := 0, "int")
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
    put_SystemSortOrder(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }
}
