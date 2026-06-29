#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IFaxSender interface defines a messaging object used by a fax client application to retrieve and set sender information about fax senders. The object also includes methods to store sender data in and retrieve sender data from the local registry.
 * @remarks
 * A default implementation of <b>IFaxSender</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsender">FaxSender</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxsender
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxSender extends IDispatch {
    /**
     * The interface identifier for IFaxSender
     * @type {Guid}
     */
    static IID := Guid("{0d879d7d-f57a-4cc6-a6f9-3ee5d527b46a}")

    /**
     * The class identifier for FaxSender
     * @type {Guid}
     */
    static CLSID := Guid("{265d84d0-1850-4360-b7c8-758bbb5f0b96}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxSender interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_BillingCode    : IntPtr
        put_BillingCode    : IntPtr
        get_City           : IntPtr
        put_City           : IntPtr
        get_Company        : IntPtr
        put_Company        : IntPtr
        get_Country        : IntPtr
        put_Country        : IntPtr
        get_Department     : IntPtr
        put_Department     : IntPtr
        get_Email          : IntPtr
        put_Email          : IntPtr
        get_FaxNumber      : IntPtr
        put_FaxNumber      : IntPtr
        get_HomePhone      : IntPtr
        put_HomePhone      : IntPtr
        get_Name           : IntPtr
        put_Name           : IntPtr
        get_TSID           : IntPtr
        put_TSID           : IntPtr
        get_OfficePhone    : IntPtr
        put_OfficePhone    : IntPtr
        get_OfficeLocation : IntPtr
        put_OfficeLocation : IntPtr
        get_State          : IntPtr
        put_State          : IntPtr
        get_StreetAddress  : IntPtr
        put_StreetAddress  : IntPtr
        get_Title          : IntPtr
        put_Title          : IntPtr
        get_ZipCode        : IntPtr
        put_ZipCode        : IntPtr
        LoadDefaultSender  : IntPtr
        SaveDefaultSender  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxSender.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_billingcode
     */
    get_BillingCode() {
        pbstrBillingCode := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrBillingCode, "HRESULT")
        return pbstrBillingCode
    }

    /**
     * The IFaxSender::get_BillingCode property is a null-terminated string that contains the billing code associated with the sender. (Put)
     * @param {BSTR} bstrBillingCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_billingcode
     */
    put_BillingCode(bstrBillingCode) {
        bstrBillingCode := bstrBillingCode is String ? BSTR.Alloc(bstrBillingCode).Value : bstrBillingCode

        result := ComCall(8, this, BSTR, bstrBillingCode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_City() {
        pbstrCity := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrCity, "HRESULT")
        return pbstrCity
    }

    /**
     * 
     * @param {BSTR} bstrCity 
     * @returns {HRESULT} 
     */
    put_City(bstrCity) {
        bstrCity := bstrCity is String ? BSTR.Alloc(bstrCity).Value : bstrCity

        result := ComCall(10, this, BSTR, bstrCity, "HRESULT")
        return result
    }

    /**
     * The IFaxSender::get_Company property is a null-terminated string that contains the company name associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_company
     */
    get_Company() {
        pbstrCompany := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrCompany, "HRESULT")
        return pbstrCompany
    }

    /**
     * The IFaxSender::get_Company property is a null-terminated string that contains the company name associated with the sender. (Put)
     * @param {BSTR} bstrCompany 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_company
     */
    put_Company(bstrCompany) {
        bstrCompany := bstrCompany is String ? BSTR.Alloc(bstrCompany).Value : bstrCompany

        result := ComCall(12, this, BSTR, bstrCompany, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Country() {
        pbstrCountry := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrCountry, "HRESULT")
        return pbstrCountry
    }

    /**
     * 
     * @param {BSTR} bstrCountry 
     * @returns {HRESULT} 
     */
    put_Country(bstrCountry) {
        bstrCountry := bstrCountry is String ? BSTR.Alloc(bstrCountry).Value : bstrCountry

        result := ComCall(14, this, BSTR, bstrCountry, "HRESULT")
        return result
    }

    /**
     * The IFaxSender::get_Department property is a null-terminated string that contains the department associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_department
     */
    get_Department() {
        pbstrDepartment := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pbstrDepartment, "HRESULT")
        return pbstrDepartment
    }

    /**
     * The IFaxSender::get_Department property is a null-terminated string that contains the department associated with the sender. (Put)
     * @param {BSTR} bstrDepartment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_department
     */
    put_Department(bstrDepartment) {
        bstrDepartment := bstrDepartment is String ? BSTR.Alloc(bstrDepartment).Value : bstrDepartment

        result := ComCall(16, this, BSTR, bstrDepartment, "HRESULT")
        return result
    }

    /**
     * The IFaxSender::get_Email property is a null-terminated string that contains the email address associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_email
     */
    get_Email() {
        pbstrEmail := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pbstrEmail, "HRESULT")
        return pbstrEmail
    }

    /**
     * The IFaxSender::get_Email property is a null-terminated string that contains the email address associated with the sender. (Put)
     * @param {BSTR} bstrEmail 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_email
     */
    put_Email(bstrEmail) {
        bstrEmail := bstrEmail is String ? BSTR.Alloc(bstrEmail).Value : bstrEmail

        result := ComCall(18, this, BSTR, bstrEmail, "HRESULT")
        return result
    }

    /**
     * The IFaxSender::get_FaxNumber property is a null-terminated string that contains the fax number associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_faxnumber
     */
    get_FaxNumber() {
        pbstrFaxNumber := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, pbstrFaxNumber, "HRESULT")
        return pbstrFaxNumber
    }

    /**
     * The IFaxSender::get_FaxNumber property is a null-terminated string that contains the fax number associated with the sender. (Put)
     * @param {BSTR} bstrFaxNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_faxnumber
     */
    put_FaxNumber(bstrFaxNumber) {
        bstrFaxNumber := bstrFaxNumber is String ? BSTR.Alloc(bstrFaxNumber).Value : bstrFaxNumber

        result := ComCall(20, this, BSTR, bstrFaxNumber, "HRESULT")
        return result
    }

    /**
     * The IFaxSender::get_HomePhone property is a null-terminated string that contains the home telephone number associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_homephone
     */
    get_HomePhone() {
        pbstrHomePhone := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, pbstrHomePhone, "HRESULT")
        return pbstrHomePhone
    }

    /**
     * The IFaxSender::get_HomePhone property is a null-terminated string that contains the home telephone number associated with the sender. (Put)
     * @param {BSTR} bstrHomePhone 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_homephone
     */
    put_HomePhone(bstrHomePhone) {
        bstrHomePhone := bstrHomePhone is String ? BSTR.Alloc(bstrHomePhone).Value : bstrHomePhone

        result := ComCall(22, this, BSTR, bstrHomePhone, "HRESULT")
        return result
    }

    /**
     * The IFaxSender::get_Name property is a null-terminated string that contains the name of the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_name
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * The IFaxSender::get_Name property is a null-terminated string that contains the name of the sender. (Put)
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(24, this, BSTR, bstrName, "HRESULT")
        return result
    }

    /**
     * The IFaxSender::get_TSID property is a null-terminated string that contains the transmitting station identifier (TSID) for the sender's device. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR.Owned()
        result := ComCall(25, this, BSTR.Ptr, pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * The IFaxSender::get_TSID property is a null-terminated string that contains the transmitting station identifier (TSID) for the sender's device. (Put)
     * @param {BSTR} bstrTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_tsid
     */
    put_TSID(bstrTSID) {
        bstrTSID := bstrTSID is String ? BSTR.Alloc(bstrTSID).Value : bstrTSID

        result := ComCall(26, this, BSTR, bstrTSID, "HRESULT")
        return result
    }

    /**
     * The IFaxSender::get_OfficePhone property is a null-terminated string that contains the office telephone number associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_officephone
     */
    get_OfficePhone() {
        pbstrOfficePhone := BSTR.Owned()
        result := ComCall(27, this, BSTR.Ptr, pbstrOfficePhone, "HRESULT")
        return pbstrOfficePhone
    }

    /**
     * The IFaxSender::get_OfficePhone property is a null-terminated string that contains the office telephone number associated with the sender. (Put)
     * @param {BSTR} bstrOfficePhone 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_officephone
     */
    put_OfficePhone(bstrOfficePhone) {
        bstrOfficePhone := bstrOfficePhone is String ? BSTR.Alloc(bstrOfficePhone).Value : bstrOfficePhone

        result := ComCall(28, this, BSTR, bstrOfficePhone, "HRESULT")
        return result
    }

    /**
     * The IFaxSender::get_OfficeLocation property is a null-terminated string that contains the office location of the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_officelocation
     */
    get_OfficeLocation() {
        pbstrOfficeLocation := BSTR.Owned()
        result := ComCall(29, this, BSTR.Ptr, pbstrOfficeLocation, "HRESULT")
        return pbstrOfficeLocation
    }

    /**
     * The IFaxSender::get_OfficeLocation property is a null-terminated string that contains the office location of the sender. (Put)
     * @param {BSTR} bstrOfficeLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_officelocation
     */
    put_OfficeLocation(bstrOfficeLocation) {
        bstrOfficeLocation := bstrOfficeLocation is String ? BSTR.Alloc(bstrOfficeLocation).Value : bstrOfficeLocation

        result := ComCall(30, this, BSTR, bstrOfficeLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_State() {
        pbstrState := BSTR.Owned()
        result := ComCall(31, this, BSTR.Ptr, pbstrState, "HRESULT")
        return pbstrState
    }

    /**
     * 
     * @param {BSTR} bstrState 
     * @returns {HRESULT} 
     */
    put_State(bstrState) {
        bstrState := bstrState is String ? BSTR.Alloc(bstrState).Value : bstrState

        result := ComCall(32, this, BSTR, bstrState, "HRESULT")
        return result
    }

    /**
     * The IFaxSender::get_StreetAddress property is a null-terminated string that contains the street address associated with the sender. (Get)
     * @remarks
     * The street address should also include the city, state, zip code (postal code) and country/region for the sender.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_streetaddress
     */
    get_StreetAddress() {
        pbstrStreetAddress := BSTR.Owned()
        result := ComCall(33, this, BSTR.Ptr, pbstrStreetAddress, "HRESULT")
        return pbstrStreetAddress
    }

    /**
     * The IFaxSender::get_StreetAddress property is a null-terminated string that contains the street address associated with the sender. (Put)
     * @remarks
     * The street address should also include the city, state, zip code (postal code) and country/region for the sender.
     * @param {BSTR} bstrStreetAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_streetaddress
     */
    put_StreetAddress(bstrStreetAddress) {
        bstrStreetAddress := bstrStreetAddress is String ? BSTR.Alloc(bstrStreetAddress).Value : bstrStreetAddress

        result := ComCall(34, this, BSTR, bstrStreetAddress, "HRESULT")
        return result
    }

    /**
     * The IFaxSender::get_Title property is a null-terminated string that contains the title associated with the sender. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-get_title
     */
    get_Title() {
        pbstrTitle := BSTR.Owned()
        result := ComCall(35, this, BSTR.Ptr, pbstrTitle, "HRESULT")
        return pbstrTitle
    }

    /**
     * The IFaxSender::get_Title property is a null-terminated string that contains the title associated with the sender. (Put)
     * @param {BSTR} bstrTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-put_title
     */
    put_Title(bstrTitle) {
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(36, this, BSTR, bstrTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ZipCode() {
        pbstrZipCode := BSTR.Owned()
        result := ComCall(37, this, BSTR.Ptr, pbstrZipCode, "HRESULT")
        return pbstrZipCode
    }

    /**
     * 
     * @param {BSTR} bstrZipCode 
     * @returns {HRESULT} 
     */
    put_ZipCode(bstrZipCode) {
        bstrZipCode := bstrZipCode is String ? BSTR.Alloc(bstrZipCode).Value : bstrZipCode

        result := ComCall(38, this, BSTR, bstrZipCode, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-loaddefaultsender
     */
    LoadDefaultSender() {
        result := ComCall(39, this, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsender-savedefaultsender
     */
    SaveDefaultSender() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxSender.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BillingCode := CallbackCreate(GetMethod(implObj, "get_BillingCode"), flags, 2)
        this.vtbl.put_BillingCode := CallbackCreate(GetMethod(implObj, "put_BillingCode"), flags, 2)
        this.vtbl.get_City := CallbackCreate(GetMethod(implObj, "get_City"), flags, 2)
        this.vtbl.put_City := CallbackCreate(GetMethod(implObj, "put_City"), flags, 2)
        this.vtbl.get_Company := CallbackCreate(GetMethod(implObj, "get_Company"), flags, 2)
        this.vtbl.put_Company := CallbackCreate(GetMethod(implObj, "put_Company"), flags, 2)
        this.vtbl.get_Country := CallbackCreate(GetMethod(implObj, "get_Country"), flags, 2)
        this.vtbl.put_Country := CallbackCreate(GetMethod(implObj, "put_Country"), flags, 2)
        this.vtbl.get_Department := CallbackCreate(GetMethod(implObj, "get_Department"), flags, 2)
        this.vtbl.put_Department := CallbackCreate(GetMethod(implObj, "put_Department"), flags, 2)
        this.vtbl.get_Email := CallbackCreate(GetMethod(implObj, "get_Email"), flags, 2)
        this.vtbl.put_Email := CallbackCreate(GetMethod(implObj, "put_Email"), flags, 2)
        this.vtbl.get_FaxNumber := CallbackCreate(GetMethod(implObj, "get_FaxNumber"), flags, 2)
        this.vtbl.put_FaxNumber := CallbackCreate(GetMethod(implObj, "put_FaxNumber"), flags, 2)
        this.vtbl.get_HomePhone := CallbackCreate(GetMethod(implObj, "get_HomePhone"), flags, 2)
        this.vtbl.put_HomePhone := CallbackCreate(GetMethod(implObj, "put_HomePhone"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_TSID := CallbackCreate(GetMethod(implObj, "get_TSID"), flags, 2)
        this.vtbl.put_TSID := CallbackCreate(GetMethod(implObj, "put_TSID"), flags, 2)
        this.vtbl.get_OfficePhone := CallbackCreate(GetMethod(implObj, "get_OfficePhone"), flags, 2)
        this.vtbl.put_OfficePhone := CallbackCreate(GetMethod(implObj, "put_OfficePhone"), flags, 2)
        this.vtbl.get_OfficeLocation := CallbackCreate(GetMethod(implObj, "get_OfficeLocation"), flags, 2)
        this.vtbl.put_OfficeLocation := CallbackCreate(GetMethod(implObj, "put_OfficeLocation"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.put_State := CallbackCreate(GetMethod(implObj, "put_State"), flags, 2)
        this.vtbl.get_StreetAddress := CallbackCreate(GetMethod(implObj, "get_StreetAddress"), flags, 2)
        this.vtbl.put_StreetAddress := CallbackCreate(GetMethod(implObj, "put_StreetAddress"), flags, 2)
        this.vtbl.get_Title := CallbackCreate(GetMethod(implObj, "get_Title"), flags, 2)
        this.vtbl.put_Title := CallbackCreate(GetMethod(implObj, "put_Title"), flags, 2)
        this.vtbl.get_ZipCode := CallbackCreate(GetMethod(implObj, "get_ZipCode"), flags, 2)
        this.vtbl.put_ZipCode := CallbackCreate(GetMethod(implObj, "put_ZipCode"), flags, 2)
        this.vtbl.LoadDefaultSender := CallbackCreate(GetMethod(implObj, "LoadDefaultSender"), flags, 1)
        this.vtbl.SaveDefaultSender := CallbackCreate(GetMethod(implObj, "SaveDefaultSender"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BillingCode)
        CallbackFree(this.vtbl.put_BillingCode)
        CallbackFree(this.vtbl.get_City)
        CallbackFree(this.vtbl.put_City)
        CallbackFree(this.vtbl.get_Company)
        CallbackFree(this.vtbl.put_Company)
        CallbackFree(this.vtbl.get_Country)
        CallbackFree(this.vtbl.put_Country)
        CallbackFree(this.vtbl.get_Department)
        CallbackFree(this.vtbl.put_Department)
        CallbackFree(this.vtbl.get_Email)
        CallbackFree(this.vtbl.put_Email)
        CallbackFree(this.vtbl.get_FaxNumber)
        CallbackFree(this.vtbl.put_FaxNumber)
        CallbackFree(this.vtbl.get_HomePhone)
        CallbackFree(this.vtbl.put_HomePhone)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_TSID)
        CallbackFree(this.vtbl.put_TSID)
        CallbackFree(this.vtbl.get_OfficePhone)
        CallbackFree(this.vtbl.put_OfficePhone)
        CallbackFree(this.vtbl.get_OfficeLocation)
        CallbackFree(this.vtbl.put_OfficeLocation)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.put_State)
        CallbackFree(this.vtbl.get_StreetAddress)
        CallbackFree(this.vtbl.put_StreetAddress)
        CallbackFree(this.vtbl.get_Title)
        CallbackFree(this.vtbl.put_Title)
        CallbackFree(this.vtbl.get_ZipCode)
        CallbackFree(this.vtbl.put_ZipCode)
        CallbackFree(this.vtbl.LoadDefaultSender)
        CallbackFree(this.vtbl.SaveDefaultSender)
    }
}
