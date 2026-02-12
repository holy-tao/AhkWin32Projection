#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContactField.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Creates fields that contain information about a contact. Available only to apps that support the Contacts contract.
  * 
  * > [!NOTE]
  * > IContactFieldFactory may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactPhone](contactphone.md) or [ContactEmail](contactemail.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactfieldfactory
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactFieldFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactFieldFactory
     * @type {Guid}
     */
    static IID => Guid("{85e2913f-0e4a-4a3e-8994-406ae7ed646e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateField_Default", "CreateField_Category", "CreateField_Custom"]

    /**
     * Creates a field to contain information about a contact.
     * 
     * > [!NOTE]
     * > [IContactFieldFactory](icontactfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactPhone](contactphone.md) or [ContactEmail](contactemail.md).
     * @param {HSTRING} value The value of the field.
     * @param {Integer} type The type of field.
     * @returns {ContactField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactfieldfactory.createfield
     */
    CreateField_Default(value, type) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", value, "int", type, "ptr*", &field := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactField(field)
    }

    /**
     * Creates a field to contain information about a contact.
     * 
     * > [!NOTE]
     * > [IContactFieldFactory](icontactfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactPhone](contactphone.md) or [ContactEmail](contactemail.md).
     * @param {HSTRING} value The value the field contains.
     * @param {Integer} type The type of field.
     * @param {Integer} category The category the field belongs to.
     * @returns {ContactField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactfieldfactory.createfield
     */
    CreateField_Category(value, type, category) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int", type, "int", category, "ptr*", &field := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactField(field)
    }

    /**
     * Creates a field to contain information about a contact.
     * 
     * > [!NOTE]
     * > [IContactFieldFactory](icontactfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactPhone](contactphone.md) or [ContactEmail](contactemail.md).
     * @param {HSTRING} name 
     * @param {HSTRING} value The value for the field.
     * @param {Integer} type The type of field.
     * @param {Integer} category 
     * @returns {ContactField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactfieldfactory.createfield
     */
    CreateField_Custom(name, value, type, category) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", name, "ptr", value, "int", type, "int", category, "ptr*", &field := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactField(field)
    }
}
