#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\Contact.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactPicker2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactPicker2
     * @type {Guid}
     */
    static IID => Guid("{b35011cf-5cef-4d24-aa0c-340c5208725d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesiredFieldsWithContactFieldType", "PickContactAsync", "PickContactsAsync"]

    /**
     * @type {IVector<Integer>} 
     */
    DesiredFieldsWithContactFieldType {
        get => this.get_DesiredFieldsWithContactFieldType()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_DesiredFieldsWithContactFieldType() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Contact>} 
     */
    PickContactAsync() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Contact, result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVector<Contact>>} 
     */
    PickContactsAsync() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, Contact), result_)
    }
}
