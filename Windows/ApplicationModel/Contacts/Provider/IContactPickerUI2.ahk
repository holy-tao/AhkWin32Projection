#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts.Provider
 * @version WindowsRuntime 1.4
 */
class IContactPickerUI2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactPickerUI2
     * @type {Guid}
     */
    static IID => Guid("{6e449e28-7b25-4999-9b0b-875400a1e8c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddContact", "get_DesiredFieldsWithContactFieldType"]

    /**
     * @type {IVector<Integer>} 
     */
    DesiredFieldsWithContactFieldType {
        get => this.get_DesiredFieldsWithContactFieldType()
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @returns {Integer} 
     */
    AddContact(contact_) {
        result := ComCall(6, this, "ptr", contact_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_DesiredFieldsWithContactFieldType() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
