#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxSender interface defines a messaging object used by a fax client application to retrieve and set sender information about fax senders. The object also includes methods to store sender data in and retrieve sender data from the local registry.
 * @remarks
 * A default implementation of <b>IFaxSender</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsender">FaxSender</a> object.
 * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nn-faxcomex-ifaxsender
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxSender extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxSender
     * @type {Guid}
     */
    static IID => Guid("{0d879d7d-f57a-4cc6-a6f9-3ee5d527b46a}")

    /**
     * The class identifier for FaxSender
     * @type {Guid}
     */
    static CLSID => Guid("{265d84d0-1850-4360-b7c8-758bbb5f0b96}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BillingCode", "put_BillingCode", "get_City", "put_City", "get_Company", "put_Company", "get_Country", "put_Country", "get_Department", "put_Department", "get_Email", "put_Email", "get_FaxNumber", "put_FaxNumber", "get_HomePhone", "put_HomePhone", "get_Name", "put_Name", "get_TSID", "put_TSID", "get_OfficePhone", "put_OfficePhone", "get_OfficeLocation", "put_OfficeLocation", "get_State", "put_State", "get_StreetAddress", "put_StreetAddress", "get_Title", "put_Title", "get_ZipCode", "put_ZipCode", "LoadDefaultSender", "SaveDefaultSender"]

    /**
     * @type {BSTR} 
     */
    BillingCode {
        get => this.get_BillingCode()
        set => this.put_BillingCode(value)
    }

    /**
     * @type {BSTR} 
     */
    City {
        get => this.get_City()
        set => this.put_City(value)
    }

    /**
     * @type {BSTR} 
     */
    Company {
        get => this.get_Company()
        set => this.put_Company(value)
    }

    /**
     * @type {BSTR} 
     */
    Country {
        get => this.get_Country()
        set => this.put_Country(value)
    }

    /**
     * @type {BSTR} 
     */
    Department {
        get => this.get_Department()
        set => this.put_Department(value)
    }

    /**
     * @type {BSTR} 
     */
    Email {
        get => this.get_Email()
        set => this.put_Email(value)
    }

    /**
     * @type {BSTR} 
     */
    FaxNumber {
        get => this.get_FaxNumber()
        set => this.put_FaxNumber(value)
    }

    /**
     * @type {BSTR} 
     */
    HomePhone {
        get => this.get_HomePhone()
        set => this.put_HomePhone(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    TSID {
        get => this.get_TSID()
        set => this.put_TSID(value)
    }

    /**
     * @type {BSTR} 
     */
    OfficePhone {
        get => this.get_OfficePhone()
        set => this.put_OfficePhone(value)
    }

    /**
     * @type {BSTR} 
     */
    OfficeLocation {
        get => this.get_OfficeLocation()
        set => this.put_OfficeLocation(value)
    }

    /**
     * @type {BSTR} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * @type {BSTR} 
     */
    StreetAddress {
        get => this.get_StreetAddress()
        set => this.put_StreetAddress(value)
    }

    /**
     * @type {BSTR} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * @type {BSTR} 
     */
    ZipCode {
        get => this.get_ZipCode()
        set => this.put_ZipCode(value)
    }

    /**
     * The IFaxSender::get_BillingCode property is a null-terminated string that contains the billing code associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-get_billingcode
     */
    get_BillingCode() {
        pbstrBillingCode := BSTR()
        result := ComCall(7, this, "ptr", pbstrBillingCode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrBillingCode
    }

    /**
     * The IFaxSender::get_BillingCode property is a null-terminated string that contains the billing code associated with the sender. (Put)
     * @param {BSTR} bstrBillingCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-put_billingcode
     */
    put_BillingCode(bstrBillingCode) {
        if(bstrBillingCode is String) {
            pin := BSTR.Alloc(bstrBillingCode)
            bstrBillingCode := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrBillingCode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_City() {
        pbstrCity := BSTR()
        result := ComCall(9, this, "ptr", pbstrCity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrCity
    }

    /**
     * 
     * @param {BSTR} bstrCity 
     * @returns {HRESULT} 
     */
    put_City(bstrCity) {
        if(bstrCity is String) {
            pin := BSTR.Alloc(bstrCity)
            bstrCity := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrCity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::get_Company property is a null-terminated string that contains the company name associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-get_company
     */
    get_Company() {
        pbstrCompany := BSTR()
        result := ComCall(11, this, "ptr", pbstrCompany, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrCompany
    }

    /**
     * The IFaxSender::get_Company property is a null-terminated string that contains the company name associated with the sender. (Put)
     * @param {BSTR} bstrCompany 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-put_company
     */
    put_Company(bstrCompany) {
        if(bstrCompany is String) {
            pin := BSTR.Alloc(bstrCompany)
            bstrCompany := pin.Value
        }

        result := ComCall(12, this, "ptr", bstrCompany, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Country() {
        pbstrCountry := BSTR()
        result := ComCall(13, this, "ptr", pbstrCountry, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrCountry
    }

    /**
     * 
     * @param {BSTR} bstrCountry 
     * @returns {HRESULT} 
     */
    put_Country(bstrCountry) {
        if(bstrCountry is String) {
            pin := BSTR.Alloc(bstrCountry)
            bstrCountry := pin.Value
        }

        result := ComCall(14, this, "ptr", bstrCountry, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::get_Department property is a null-terminated string that contains the department associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-get_department
     */
    get_Department() {
        pbstrDepartment := BSTR()
        result := ComCall(15, this, "ptr", pbstrDepartment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrDepartment
    }

    /**
     * The IFaxSender::get_Department property is a null-terminated string that contains the department associated with the sender. (Put)
     * @param {BSTR} bstrDepartment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-put_department
     */
    put_Department(bstrDepartment) {
        if(bstrDepartment is String) {
            pin := BSTR.Alloc(bstrDepartment)
            bstrDepartment := pin.Value
        }

        result := ComCall(16, this, "ptr", bstrDepartment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::get_Email property is a null-terminated string that contains the email address associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-get_email
     */
    get_Email() {
        pbstrEmail := BSTR()
        result := ComCall(17, this, "ptr", pbstrEmail, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrEmail
    }

    /**
     * The IFaxSender::get_Email property is a null-terminated string that contains the email address associated with the sender. (Put)
     * @param {BSTR} bstrEmail 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-put_email
     */
    put_Email(bstrEmail) {
        if(bstrEmail is String) {
            pin := BSTR.Alloc(bstrEmail)
            bstrEmail := pin.Value
        }

        result := ComCall(18, this, "ptr", bstrEmail, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::get_FaxNumber property is a null-terminated string that contains the fax number associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-get_faxnumber
     */
    get_FaxNumber() {
        pbstrFaxNumber := BSTR()
        result := ComCall(19, this, "ptr", pbstrFaxNumber, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrFaxNumber
    }

    /**
     * The IFaxSender::get_FaxNumber property is a null-terminated string that contains the fax number associated with the sender. (Put)
     * @param {BSTR} bstrFaxNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-put_faxnumber
     */
    put_FaxNumber(bstrFaxNumber) {
        if(bstrFaxNumber is String) {
            pin := BSTR.Alloc(bstrFaxNumber)
            bstrFaxNumber := pin.Value
        }

        result := ComCall(20, this, "ptr", bstrFaxNumber, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::get_HomePhone property is a null-terminated string that contains the home telephone number associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-get_homephone
     */
    get_HomePhone() {
        pbstrHomePhone := BSTR()
        result := ComCall(21, this, "ptr", pbstrHomePhone, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrHomePhone
    }

    /**
     * The IFaxSender::get_HomePhone property is a null-terminated string that contains the home telephone number associated with the sender. (Put)
     * @param {BSTR} bstrHomePhone 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-put_homephone
     */
    put_HomePhone(bstrHomePhone) {
        if(bstrHomePhone is String) {
            pin := BSTR.Alloc(bstrHomePhone)
            bstrHomePhone := pin.Value
        }

        result := ComCall(22, this, "ptr", bstrHomePhone, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::get_Name property is a null-terminated string that contains the name of the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(23, this, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }

    /**
     * The IFaxSender::get_Name property is a null-terminated string that contains the name of the sender. (Put)
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-put_name
     */
    put_Name(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(24, this, "ptr", bstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::get_TSID property is a null-terminated string that contains the transmitting station identifier (TSID) for the sender's device. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR()
        result := ComCall(25, this, "ptr", pbstrTSID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrTSID
    }

    /**
     * The IFaxSender::get_TSID property is a null-terminated string that contains the transmitting station identifier (TSID) for the sender's device. (Put)
     * @param {BSTR} bstrTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-put_tsid
     */
    put_TSID(bstrTSID) {
        if(bstrTSID is String) {
            pin := BSTR.Alloc(bstrTSID)
            bstrTSID := pin.Value
        }

        result := ComCall(26, this, "ptr", bstrTSID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::get_OfficePhone property is a null-terminated string that contains the office telephone number associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-get_officephone
     */
    get_OfficePhone() {
        pbstrOfficePhone := BSTR()
        result := ComCall(27, this, "ptr", pbstrOfficePhone, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrOfficePhone
    }

    /**
     * The IFaxSender::get_OfficePhone property is a null-terminated string that contains the office telephone number associated with the sender. (Put)
     * @param {BSTR} bstrOfficePhone 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-put_officephone
     */
    put_OfficePhone(bstrOfficePhone) {
        if(bstrOfficePhone is String) {
            pin := BSTR.Alloc(bstrOfficePhone)
            bstrOfficePhone := pin.Value
        }

        result := ComCall(28, this, "ptr", bstrOfficePhone, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::get_OfficeLocation property is a null-terminated string that contains the office location of the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-get_officelocation
     */
    get_OfficeLocation() {
        pbstrOfficeLocation := BSTR()
        result := ComCall(29, this, "ptr", pbstrOfficeLocation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrOfficeLocation
    }

    /**
     * The IFaxSender::get_OfficeLocation property is a null-terminated string that contains the office location of the sender. (Put)
     * @param {BSTR} bstrOfficeLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-put_officelocation
     */
    put_OfficeLocation(bstrOfficeLocation) {
        if(bstrOfficeLocation is String) {
            pin := BSTR.Alloc(bstrOfficeLocation)
            bstrOfficeLocation := pin.Value
        }

        result := ComCall(30, this, "ptr", bstrOfficeLocation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_State() {
        pbstrState := BSTR()
        result := ComCall(31, this, "ptr", pbstrState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrState
    }

    /**
     * 
     * @param {BSTR} bstrState 
     * @returns {HRESULT} 
     */
    put_State(bstrState) {
        if(bstrState is String) {
            pin := BSTR.Alloc(bstrState)
            bstrState := pin.Value
        }

        result := ComCall(32, this, "ptr", bstrState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::get_StreetAddress property is a null-terminated string that contains the street address associated with the sender. (Get)
     * @remarks
     * The street address should also include the city, state, zip code (postal code) and country/region for the sender.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-get_streetaddress
     */
    get_StreetAddress() {
        pbstrStreetAddress := BSTR()
        result := ComCall(33, this, "ptr", pbstrStreetAddress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrStreetAddress
    }

    /**
     * The IFaxSender::get_StreetAddress property is a null-terminated string that contains the street address associated with the sender. (Put)
     * @remarks
     * The street address should also include the city, state, zip code (postal code) and country/region for the sender.
     * @param {BSTR} bstrStreetAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-put_streetaddress
     */
    put_StreetAddress(bstrStreetAddress) {
        if(bstrStreetAddress is String) {
            pin := BSTR.Alloc(bstrStreetAddress)
            bstrStreetAddress := pin.Value
        }

        result := ComCall(34, this, "ptr", bstrStreetAddress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::get_Title property is a null-terminated string that contains the title associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-get_title
     */
    get_Title() {
        pbstrTitle := BSTR()
        result := ComCall(35, this, "ptr", pbstrTitle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrTitle
    }

    /**
     * The IFaxSender::get_Title property is a null-terminated string that contains the title associated with the sender. (Put)
     * @param {BSTR} bstrTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-put_title
     */
    put_Title(bstrTitle) {
        if(bstrTitle is String) {
            pin := BSTR.Alloc(bstrTitle)
            bstrTitle := pin.Value
        }

        result := ComCall(36, this, "ptr", bstrTitle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ZipCode() {
        pbstrZipCode := BSTR()
        result := ComCall(37, this, "ptr", pbstrZipCode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrZipCode
    }

    /**
     * 
     * @param {BSTR} bstrZipCode 
     * @returns {HRESULT} 
     */
    put_ZipCode(bstrZipCode) {
        if(bstrZipCode is String) {
            pin := BSTR.Alloc(bstrZipCode)
            bstrZipCode := pin.Value
        }

        result := ComCall(38, this, "ptr", bstrZipCode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::get_LoadDefaultSender method fills the FaxSender object with the default sender information.
     * @remarks
     * The default sender information is saved using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsender-savedefaultsender-vb">IFaxSender::SaveDefaultSender</a> method.
     * 
     * This method can return remote procedure call (RPC) return values. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-loaddefaultsender
     */
    LoadDefaultSender() {
        result := ComCall(39, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxSender::SaveDefaultSender method stores information about the default sender from the FaxSender object.
     * @remarks
     * To load the default sender information into a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsender">FaxSender</a> object, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsender-loaddefaultsender-vb">IFaxSender::get_LoadDefaultSender</a> method.
     * 
     * This method can return remote procedure call (RPC) return values. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxsender-savedefaultsender
     */
    SaveDefaultSender() {
        result := ComCall(40, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
