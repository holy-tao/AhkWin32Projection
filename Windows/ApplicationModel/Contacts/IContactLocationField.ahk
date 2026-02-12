#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
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
class IContactLocationField extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactLocationField
     * @type {Guid}
     */
    static IID => Guid("{9ec00f82-ab6e-4b36-89e3-b23bc0a1dacc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UnstructuredAddress", "get_Street", "get_City", "get_Region", "get_Country", "get_PostalCode"]

    /**
     * @type {HSTRING} 
     */
    UnstructuredAddress {
        get => this.get_UnstructuredAddress()
    }

    /**
     * @type {HSTRING} 
     */
    Street {
        get => this.get_Street()
    }

    /**
     * @type {HSTRING} 
     */
    City {
        get => this.get_City()
    }

    /**
     * @type {HSTRING} 
     */
    Region {
        get => this.get_Region()
    }

    /**
     * @type {HSTRING} 
     */
    Country {
        get => this.get_Country()
    }

    /**
     * @type {HSTRING} 
     */
    PostalCode {
        get => this.get_PostalCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnstructuredAddress() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Street() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_City() {
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
    get_Region() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Country() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PostalCode() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
