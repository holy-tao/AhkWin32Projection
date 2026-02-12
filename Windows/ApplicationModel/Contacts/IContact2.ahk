#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\ContactPhone.ahk
#Include .\ContactEmail.ahk
#Include .\ContactAddress.ahk
#Include .\ContactConnectedServiceAccount.ahk
#Include .\ContactDate.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\ContactJobInfo.ahk
#Include .\ContactSignificantOther.ahk
#Include .\ContactWebsite.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContact2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContact2
     * @type {Guid}
     */
    static IID => Guid("{f312f365-bb77-4c94-802d-8328cee40c08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "put_Id", "get_Notes", "put_Notes", "get_Phones", "get_Emails", "get_Addresses", "get_ConnectedServiceAccounts", "get_ImportantDates", "get_DataSuppliers", "get_JobInfo", "get_SignificantOthers", "get_Websites", "get_ProviderProperties"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * @type {HSTRING} 
     */
    Notes {
        get => this.get_Notes()
        set => this.put_Notes(value)
    }

    /**
     * @type {IVector<ContactPhone>} 
     */
    Phones {
        get => this.get_Phones()
    }

    /**
     * @type {IVector<ContactEmail>} 
     */
    Emails {
        get => this.get_Emails()
    }

    /**
     * @type {IVector<ContactAddress>} 
     */
    Addresses {
        get => this.get_Addresses()
    }

    /**
     * @type {IVector<ContactConnectedServiceAccount>} 
     */
    ConnectedServiceAccounts {
        get => this.get_ConnectedServiceAccounts()
    }

    /**
     * @type {IVector<ContactDate>} 
     */
    ImportantDates {
        get => this.get_ImportantDates()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    DataSuppliers {
        get => this.get_DataSuppliers()
    }

    /**
     * @type {IVector<ContactJobInfo>} 
     */
    JobInfo {
        get => this.get_JobInfo()
    }

    /**
     * @type {IVector<ContactSignificantOther>} 
     */
    SignificantOthers {
        get => this.get_SignificantOthers()
    }

    /**
     * @type {IVector<ContactWebsite>} 
     */
    Websites {
        get => this.get_Websites()
    }

    /**
     * @type {IPropertySet} 
     */
    ProviderProperties {
        get => this.get_ProviderProperties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Notes() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Notes(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<ContactPhone>} 
     */
    get_Phones() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ContactPhone, value)
    }

    /**
     * 
     * @returns {IVector<ContactEmail>} 
     */
    get_Emails() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ContactEmail, value)
    }

    /**
     * 
     * @returns {IVector<ContactAddress>} 
     */
    get_Addresses() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ContactAddress, value)
    }

    /**
     * 
     * @returns {IVector<ContactConnectedServiceAccount>} 
     */
    get_ConnectedServiceAccounts() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ContactConnectedServiceAccount, value)
    }

    /**
     * 
     * @returns {IVector<ContactDate>} 
     */
    get_ImportantDates() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ContactDate, value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DataSuppliers() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<ContactJobInfo>} 
     */
    get_JobInfo() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ContactJobInfo, value)
    }

    /**
     * 
     * @returns {IVector<ContactSignificantOther>} 
     */
    get_SignificantOthers() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ContactSignificantOther, value)
    }

    /**
     * 
     * @returns {IVector<ContactWebsite>} 
     */
    get_Websites() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ContactWebsite, value)
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_ProviderProperties() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }
}
