#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Specifies an object that describes a piece of contact data.
  * 
  * > [!NOTE]
  * > IContactField may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactfield
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactField extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactField
     * @type {Guid}
     */
    static IID => Guid("{b176486a-d293-492c-a058-db575b3e3c0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Category", "get_Name", "get_Value"]

    /**
     * Gets the contact field type for the data.
     * 
     * > [!NOTE]
     * > [IContactField](icontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactfield.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the category for the contact data.
     * 
     * > [!NOTE]
     * > [IContactField](icontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactfield.category
     * @type {Integer} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * Gets the name of the field.
     * 
     * > [!NOTE]
     * > [IContactField](icontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactfield.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the value of the contact data.
     * 
     * > [!NOTE]
     * > [IContactField](icontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactfield.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Category() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
