#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Storage\Streams\RandomAccessStreamReference.ahk
#Include .\Contact.ahk
#Include .\ContactStore.ahk
#Include .\ContactAnnotationStore.ahk
#Include .\ContactCardDelayedDataLoader.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactManagerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactManagerStatics3
     * @type {Guid}
     */
    static IID => Guid("{c4cc3d42-7586-492a-930b-7bc138fc2139}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConvertContactToVCardAsync", "ConvertContactToVCardAsyncWithMaxBytes", "ConvertVCardToContactAsync", "RequestStoreAsyncWithAccessType", "RequestAnnotationStoreAsync", "IsShowContactCardSupported", "ShowContactCardWithOptions", "IsShowDelayLoadedContactCardSupported", "ShowDelayLoadedContactCardWithOptions", "ShowFullContactCard", "get_SystemDisplayNameOrder", "put_SystemDisplayNameOrder", "get_SystemSortOrder", "put_SystemSortOrder"]

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
     * 
     * @param {Contact} contact_ 
     * @returns {IAsyncOperation<RandomAccessStreamReference>} 
     */
    ConvertContactToVCardAsync(contact_) {
        result := ComCall(6, this, "ptr", contact_, "ptr*", &vCard := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RandomAccessStreamReference, vCard)
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @param {Integer} maxBytes 
     * @returns {IAsyncOperation<RandomAccessStreamReference>} 
     */
    ConvertContactToVCardAsyncWithMaxBytes(contact_, maxBytes) {
        result := ComCall(7, this, "ptr", contact_, "uint", maxBytes, "ptr*", &vCard := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RandomAccessStreamReference, vCard)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} vCard 
     * @returns {IAsyncOperation<Contact>} 
     */
    ConvertVCardToContactAsync(vCard) {
        result := ComCall(8, this, "ptr", vCard, "ptr*", &contact_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Contact, contact_)
    }

    /**
     * 
     * @param {Integer} accessType 
     * @returns {IAsyncOperation<ContactStore>} 
     */
    RequestStoreAsyncWithAccessType(accessType) {
        result := ComCall(9, this, "int", accessType, "ptr*", &store := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ContactStore, store)
    }

    /**
     * 
     * @param {Integer} accessType 
     * @returns {IAsyncOperation<ContactAnnotationStore>} 
     */
    RequestAnnotationStoreAsync(accessType) {
        result := ComCall(10, this, "int", accessType, "ptr*", &store := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ContactAnnotationStore, store)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsShowContactCardSupported() {
        result := ComCall(11, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @param {ContactCardOptions} contactCardOptions_ 
     * @returns {HRESULT} 
     */
    ShowContactCardWithOptions(contact_, selection, preferredPlacement, contactCardOptions_) {
        result := ComCall(12, this, "ptr", contact_, "ptr", selection, "int", preferredPlacement, "ptr", contactCardOptions_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsShowDelayLoadedContactCardSupported() {
        result := ComCall(13, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @param {ContactCardOptions} contactCardOptions_ 
     * @returns {ContactCardDelayedDataLoader} 
     */
    ShowDelayLoadedContactCardWithOptions(contact_, selection, preferredPlacement, contactCardOptions_) {
        result := ComCall(14, this, "ptr", contact_, "ptr", selection, "int", preferredPlacement, "ptr", contactCardOptions_, "ptr*", &dataLoader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactCardDelayedDataLoader(dataLoader)
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @param {FullContactCardOptions} fullContactCardOptions_ 
     * @returns {HRESULT} 
     */
    ShowFullContactCard(contact_, fullContactCardOptions_) {
        result := ComCall(15, this, "ptr", contact_, "ptr", fullContactCardOptions_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SystemDisplayNameOrder() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
        result := ComCall(17, this, "int", value, "int")
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
        result := ComCall(18, this, "int*", &value := 0, "int")
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
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
