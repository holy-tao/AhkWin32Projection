#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxSender interface defines a messaging object used by a fax client application to retrieve and set sender information about fax senders. The object also includes methods to store sender data in and retrieve sender data from the local registry.
 * @remarks
 * 
 * A default implementation of <b>IFaxSender</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsender">FaxSender</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxsender
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_billingcode
     */
    get_BillingCode() {
        pbstrBillingCode := BSTR()
        result := ComCall(7, this, "ptr", pbstrBillingCode, "HRESULT")
        return pbstrBillingCode
    }

    /**
     * 
     * @param {BSTR} bstrBillingCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_billingcode
     */
    put_BillingCode(bstrBillingCode) {
        bstrBillingCode := bstrBillingCode is String ? BSTR.Alloc(bstrBillingCode).Value : bstrBillingCode

        result := ComCall(8, this, "ptr", bstrBillingCode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_City() {
        pbstrCity := BSTR()
        result := ComCall(9, this, "ptr", pbstrCity, "HRESULT")
        return pbstrCity
    }

    /**
     * 
     * @param {BSTR} bstrCity 
     * @returns {HRESULT} 
     */
    put_City(bstrCity) {
        bstrCity := bstrCity is String ? BSTR.Alloc(bstrCity).Value : bstrCity

        result := ComCall(10, this, "ptr", bstrCity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_company
     */
    get_Company() {
        pbstrCompany := BSTR()
        result := ComCall(11, this, "ptr", pbstrCompany, "HRESULT")
        return pbstrCompany
    }

    /**
     * 
     * @param {BSTR} bstrCompany 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_company
     */
    put_Company(bstrCompany) {
        bstrCompany := bstrCompany is String ? BSTR.Alloc(bstrCompany).Value : bstrCompany

        result := ComCall(12, this, "ptr", bstrCompany, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Country() {
        pbstrCountry := BSTR()
        result := ComCall(13, this, "ptr", pbstrCountry, "HRESULT")
        return pbstrCountry
    }

    /**
     * 
     * @param {BSTR} bstrCountry 
     * @returns {HRESULT} 
     */
    put_Country(bstrCountry) {
        bstrCountry := bstrCountry is String ? BSTR.Alloc(bstrCountry).Value : bstrCountry

        result := ComCall(14, this, "ptr", bstrCountry, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_department
     */
    get_Department() {
        pbstrDepartment := BSTR()
        result := ComCall(15, this, "ptr", pbstrDepartment, "HRESULT")
        return pbstrDepartment
    }

    /**
     * 
     * @param {BSTR} bstrDepartment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_department
     */
    put_Department(bstrDepartment) {
        bstrDepartment := bstrDepartment is String ? BSTR.Alloc(bstrDepartment).Value : bstrDepartment

        result := ComCall(16, this, "ptr", bstrDepartment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_email
     */
    get_Email() {
        pbstrEmail := BSTR()
        result := ComCall(17, this, "ptr", pbstrEmail, "HRESULT")
        return pbstrEmail
    }

    /**
     * 
     * @param {BSTR} bstrEmail 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_email
     */
    put_Email(bstrEmail) {
        bstrEmail := bstrEmail is String ? BSTR.Alloc(bstrEmail).Value : bstrEmail

        result := ComCall(18, this, "ptr", bstrEmail, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_faxnumber
     */
    get_FaxNumber() {
        pbstrFaxNumber := BSTR()
        result := ComCall(19, this, "ptr", pbstrFaxNumber, "HRESULT")
        return pbstrFaxNumber
    }

    /**
     * 
     * @param {BSTR} bstrFaxNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_faxnumber
     */
    put_FaxNumber(bstrFaxNumber) {
        bstrFaxNumber := bstrFaxNumber is String ? BSTR.Alloc(bstrFaxNumber).Value : bstrFaxNumber

        result := ComCall(20, this, "ptr", bstrFaxNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_homephone
     */
    get_HomePhone() {
        pbstrHomePhone := BSTR()
        result := ComCall(21, this, "ptr", pbstrHomePhone, "HRESULT")
        return pbstrHomePhone
    }

    /**
     * 
     * @param {BSTR} bstrHomePhone 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_homephone
     */
    put_HomePhone(bstrHomePhone) {
        bstrHomePhone := bstrHomePhone is String ? BSTR.Alloc(bstrHomePhone).Value : bstrHomePhone

        result := ComCall(22, this, "ptr", bstrHomePhone, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(23, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(24, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR()
        result := ComCall(25, this, "ptr", pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * 
     * @param {BSTR} bstrTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_tsid
     */
    put_TSID(bstrTSID) {
        bstrTSID := bstrTSID is String ? BSTR.Alloc(bstrTSID).Value : bstrTSID

        result := ComCall(26, this, "ptr", bstrTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_officephone
     */
    get_OfficePhone() {
        pbstrOfficePhone := BSTR()
        result := ComCall(27, this, "ptr", pbstrOfficePhone, "HRESULT")
        return pbstrOfficePhone
    }

    /**
     * 
     * @param {BSTR} bstrOfficePhone 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_officephone
     */
    put_OfficePhone(bstrOfficePhone) {
        bstrOfficePhone := bstrOfficePhone is String ? BSTR.Alloc(bstrOfficePhone).Value : bstrOfficePhone

        result := ComCall(28, this, "ptr", bstrOfficePhone, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_officelocation
     */
    get_OfficeLocation() {
        pbstrOfficeLocation := BSTR()
        result := ComCall(29, this, "ptr", pbstrOfficeLocation, "HRESULT")
        return pbstrOfficeLocation
    }

    /**
     * 
     * @param {BSTR} bstrOfficeLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_officelocation
     */
    put_OfficeLocation(bstrOfficeLocation) {
        bstrOfficeLocation := bstrOfficeLocation is String ? BSTR.Alloc(bstrOfficeLocation).Value : bstrOfficeLocation

        result := ComCall(30, this, "ptr", bstrOfficeLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_State() {
        pbstrState := BSTR()
        result := ComCall(31, this, "ptr", pbstrState, "HRESULT")
        return pbstrState
    }

    /**
     * 
     * @param {BSTR} bstrState 
     * @returns {HRESULT} 
     */
    put_State(bstrState) {
        bstrState := bstrState is String ? BSTR.Alloc(bstrState).Value : bstrState

        result := ComCall(32, this, "ptr", bstrState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_streetaddress
     */
    get_StreetAddress() {
        pbstrStreetAddress := BSTR()
        result := ComCall(33, this, "ptr", pbstrStreetAddress, "HRESULT")
        return pbstrStreetAddress
    }

    /**
     * 
     * @param {BSTR} bstrStreetAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_streetaddress
     */
    put_StreetAddress(bstrStreetAddress) {
        bstrStreetAddress := bstrStreetAddress is String ? BSTR.Alloc(bstrStreetAddress).Value : bstrStreetAddress

        result := ComCall(34, this, "ptr", bstrStreetAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_title
     */
    get_Title() {
        pbstrTitle := BSTR()
        result := ComCall(35, this, "ptr", pbstrTitle, "HRESULT")
        return pbstrTitle
    }

    /**
     * 
     * @param {BSTR} bstrTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_title
     */
    put_Title(bstrTitle) {
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(36, this, "ptr", bstrTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ZipCode() {
        pbstrZipCode := BSTR()
        result := ComCall(37, this, "ptr", pbstrZipCode, "HRESULT")
        return pbstrZipCode
    }

    /**
     * 
     * @param {BSTR} bstrZipCode 
     * @returns {HRESULT} 
     */
    put_ZipCode(bstrZipCode) {
        bstrZipCode := bstrZipCode is String ? BSTR.Alloc(bstrZipCode).Value : bstrZipCode

        result := ComCall(38, this, "ptr", bstrZipCode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-loaddefaultsender
     */
    LoadDefaultSender() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-savedefaultsender
     */
    SaveDefaultSender() {
        result := ComCall(40, this, "HRESULT")
        return result
    }
}
