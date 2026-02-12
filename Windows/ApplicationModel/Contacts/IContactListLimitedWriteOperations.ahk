#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactListLimitedWriteOperations extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactListLimitedWriteOperations
     * @type {Guid}
     */
    static IID => Guid("{e19813da-4a0b-44b8-9a1f-a0f3d218175f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCreateOrUpdateContactAsync", "TryDeleteContactAsync"]

    /**
     * 
     * @param {Contact} contact_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryCreateOrUpdateContactAsync(contact_) {
        result := ComCall(6, this, "ptr", contact_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} contactId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDeleteContactAsync(contactId) {
        if(contactId is String) {
            pin := HSTRING.Create(contactId)
            contactId := pin.Value
        }
        contactId := contactId is Win32Handle ? NumGet(contactId, "ptr") : contactId

        result := ComCall(7, this, "ptr", contactId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
