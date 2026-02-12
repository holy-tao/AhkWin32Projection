#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContactLocationField.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Creates fields for a contact's location.
  * 
  * > [!NOTE]
  * > IContactLocationFieldFactory may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactlocationfieldfactory
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactLocationFieldFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactLocationFieldFactory
     * @type {Guid}
     */
    static IID => Guid("{f79932d7-2fdf-43fe-8f18-41897390bcfe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLocation_Default", "CreateLocation_Category", "CreateLocation_All"]

    /**
     * Creates a field to contain information about a contact's location.
     * 
     * > [!NOTE]
     * > [IContactLocationFieldFactory](icontactlocationfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @param {HSTRING} unstructuredAddress The address of the contact in an unstructured format.
     * @returns {ContactLocationField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactlocationfieldfactory.createlocation
     */
    CreateLocation_Default(unstructuredAddress) {
        if(unstructuredAddress is String) {
            pin := HSTRING.Create(unstructuredAddress)
            unstructuredAddress := pin.Value
        }
        unstructuredAddress := unstructuredAddress is Win32Handle ? NumGet(unstructuredAddress, "ptr") : unstructuredAddress

        result := ComCall(6, this, "ptr", unstructuredAddress, "ptr*", &field := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactLocationField(field)
    }

    /**
     * Creates a field to contain information about a contact's location.
     * 
     * > [!NOTE]
     * > [IContactLocationFieldFactory](icontactlocationfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @param {HSTRING} unstructuredAddress The address of the contact in an unstructured format.
     * @param {Integer} category 
     * @returns {ContactLocationField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactlocationfieldfactory.createlocation
     */
    CreateLocation_Category(unstructuredAddress, category) {
        if(unstructuredAddress is String) {
            pin := HSTRING.Create(unstructuredAddress)
            unstructuredAddress := pin.Value
        }
        unstructuredAddress := unstructuredAddress is Win32Handle ? NumGet(unstructuredAddress, "ptr") : unstructuredAddress

        result := ComCall(7, this, "ptr", unstructuredAddress, "int", category, "ptr*", &field := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactLocationField(field)
    }

    /**
     * Creates a field to contain information about a contact's location.
     * 
     * > [!NOTE]
     * > [IContactLocationFieldFactory](icontactlocationfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @param {HSTRING} unstructuredAddress The address of the contact in an unstructured format.
     * @param {Integer} category 
     * @param {HSTRING} street 
     * @param {HSTRING} city 
     * @param {HSTRING} region_ 
     * @param {HSTRING} country 
     * @param {HSTRING} postalCode 
     * @returns {ContactLocationField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactlocationfieldfactory.createlocation
     */
    CreateLocation_All(unstructuredAddress, category, street, city, region_, country, postalCode) {
        if(unstructuredAddress is String) {
            pin := HSTRING.Create(unstructuredAddress)
            unstructuredAddress := pin.Value
        }
        unstructuredAddress := unstructuredAddress is Win32Handle ? NumGet(unstructuredAddress, "ptr") : unstructuredAddress
        if(street is String) {
            pin := HSTRING.Create(street)
            street := pin.Value
        }
        street := street is Win32Handle ? NumGet(street, "ptr") : street
        if(city is String) {
            pin := HSTRING.Create(city)
            city := pin.Value
        }
        city := city is Win32Handle ? NumGet(city, "ptr") : city
        if(region_ is String) {
            pin := HSTRING.Create(region_)
            region_ := pin.Value
        }
        region_ := region_ is Win32Handle ? NumGet(region_, "ptr") : region_
        if(country is String) {
            pin := HSTRING.Create(country)
            country := pin.Value
        }
        country := country is Win32Handle ? NumGet(country, "ptr") : country
        if(postalCode is String) {
            pin := HSTRING.Create(postalCode)
            postalCode := pin.Value
        }
        postalCode := postalCode is Win32Handle ? NumGet(postalCode, "ptr") : postalCode

        result := ComCall(8, this, "ptr", unstructuredAddress, "int", category, "ptr", street, "ptr", city, "ptr", region_, "ptr", country, "ptr", postalCode, "ptr*", &field := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactLocationField(field)
    }
}
