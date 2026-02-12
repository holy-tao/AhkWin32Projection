#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\Contact.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IAggregateContactManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAggregateContactManager
     * @type {Guid}
     */
    static IID => Guid("{0379d5dd-db5a-4fd3-b54e-4df17917a212}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindRawContactsAsync", "TryLinkContactsAsync", "UnlinkRawContactAsync", "TrySetPreferredSourceForPictureAsync"]

    /**
     * 
     * @param {Contact} contact_ 
     * @returns {IAsyncOperation<IVectorView<Contact>>} 
     */
    FindRawContactsAsync(contact_) {
        result := ComCall(6, this, "ptr", contact_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Contact), value)
    }

    /**
     * 
     * @param {Contact} primaryContact 
     * @param {Contact} secondaryContact 
     * @returns {IAsyncOperation<Contact>} 
     */
    TryLinkContactsAsync(primaryContact, secondaryContact) {
        result := ComCall(7, this, "ptr", primaryContact, "ptr", secondaryContact, "ptr*", &contact_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Contact, contact_)
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @returns {IAsyncAction} 
     */
    UnlinkRawContactAsync(contact_) {
        result := ComCall(8, this, "ptr", contact_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @param {Contact} aggregateContact 
     * @param {Contact} rawContact 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetPreferredSourceForPictureAsync(aggregateContact, rawContact) {
        result := ComCall(9, this, "ptr", aggregateContact, "ptr", rawContact, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), value)
    }
}
