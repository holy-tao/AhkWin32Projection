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
     * 
     * @param {Pointer<BSTR>} pbstrBillingCode 
     * @returns {HRESULT} 
     */
    get_BillingCode(pbstrBillingCode) {
        result := ComCall(7, this, "ptr", pbstrBillingCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrBillingCode 
     * @returns {HRESULT} 
     */
    put_BillingCode(bstrBillingCode) {
        bstrBillingCode := bstrBillingCode is String ? BSTR.Alloc(bstrBillingCode).Value : bstrBillingCode

        result := ComCall(8, this, "ptr", bstrBillingCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCity 
     * @returns {HRESULT} 
     */
    get_City(pbstrCity) {
        result := ComCall(9, this, "ptr", pbstrCity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCity 
     * @returns {HRESULT} 
     */
    put_City(bstrCity) {
        bstrCity := bstrCity is String ? BSTR.Alloc(bstrCity).Value : bstrCity

        result := ComCall(10, this, "ptr", bstrCity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCompany 
     * @returns {HRESULT} 
     */
    get_Company(pbstrCompany) {
        result := ComCall(11, this, "ptr", pbstrCompany, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCompany 
     * @returns {HRESULT} 
     */
    put_Company(bstrCompany) {
        bstrCompany := bstrCompany is String ? BSTR.Alloc(bstrCompany).Value : bstrCompany

        result := ComCall(12, this, "ptr", bstrCompany, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCountry 
     * @returns {HRESULT} 
     */
    get_Country(pbstrCountry) {
        result := ComCall(13, this, "ptr", pbstrCountry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCountry 
     * @returns {HRESULT} 
     */
    put_Country(bstrCountry) {
        bstrCountry := bstrCountry is String ? BSTR.Alloc(bstrCountry).Value : bstrCountry

        result := ComCall(14, this, "ptr", bstrCountry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDepartment 
     * @returns {HRESULT} 
     */
    get_Department(pbstrDepartment) {
        result := ComCall(15, this, "ptr", pbstrDepartment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDepartment 
     * @returns {HRESULT} 
     */
    put_Department(bstrDepartment) {
        bstrDepartment := bstrDepartment is String ? BSTR.Alloc(bstrDepartment).Value : bstrDepartment

        result := ComCall(16, this, "ptr", bstrDepartment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrEmail 
     * @returns {HRESULT} 
     */
    get_Email(pbstrEmail) {
        result := ComCall(17, this, "ptr", pbstrEmail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrEmail 
     * @returns {HRESULT} 
     */
    put_Email(bstrEmail) {
        bstrEmail := bstrEmail is String ? BSTR.Alloc(bstrEmail).Value : bstrEmail

        result := ComCall(18, this, "ptr", bstrEmail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFaxNumber 
     * @returns {HRESULT} 
     */
    get_FaxNumber(pbstrFaxNumber) {
        result := ComCall(19, this, "ptr", pbstrFaxNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFaxNumber 
     * @returns {HRESULT} 
     */
    put_FaxNumber(bstrFaxNumber) {
        bstrFaxNumber := bstrFaxNumber is String ? BSTR.Alloc(bstrFaxNumber).Value : bstrFaxNumber

        result := ComCall(20, this, "ptr", bstrFaxNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrHomePhone 
     * @returns {HRESULT} 
     */
    get_HomePhone(pbstrHomePhone) {
        result := ComCall(21, this, "ptr", pbstrHomePhone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrHomePhone 
     * @returns {HRESULT} 
     */
    put_HomePhone(bstrHomePhone) {
        bstrHomePhone := bstrHomePhone is String ? BSTR.Alloc(bstrHomePhone).Value : bstrHomePhone

        result := ComCall(22, this, "ptr", bstrHomePhone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(23, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(24, this, "ptr", bstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTSID 
     * @returns {HRESULT} 
     */
    get_TSID(pbstrTSID) {
        result := ComCall(25, this, "ptr", pbstrTSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTSID 
     * @returns {HRESULT} 
     */
    put_TSID(bstrTSID) {
        bstrTSID := bstrTSID is String ? BSTR.Alloc(bstrTSID).Value : bstrTSID

        result := ComCall(26, this, "ptr", bstrTSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrOfficePhone 
     * @returns {HRESULT} 
     */
    get_OfficePhone(pbstrOfficePhone) {
        result := ComCall(27, this, "ptr", pbstrOfficePhone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrOfficePhone 
     * @returns {HRESULT} 
     */
    put_OfficePhone(bstrOfficePhone) {
        bstrOfficePhone := bstrOfficePhone is String ? BSTR.Alloc(bstrOfficePhone).Value : bstrOfficePhone

        result := ComCall(28, this, "ptr", bstrOfficePhone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrOfficeLocation 
     * @returns {HRESULT} 
     */
    get_OfficeLocation(pbstrOfficeLocation) {
        result := ComCall(29, this, "ptr", pbstrOfficeLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrOfficeLocation 
     * @returns {HRESULT} 
     */
    put_OfficeLocation(bstrOfficeLocation) {
        bstrOfficeLocation := bstrOfficeLocation is String ? BSTR.Alloc(bstrOfficeLocation).Value : bstrOfficeLocation

        result := ComCall(30, this, "ptr", bstrOfficeLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrState 
     * @returns {HRESULT} 
     */
    get_State(pbstrState) {
        result := ComCall(31, this, "ptr", pbstrState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrState 
     * @returns {HRESULT} 
     */
    put_State(bstrState) {
        bstrState := bstrState is String ? BSTR.Alloc(bstrState).Value : bstrState

        result := ComCall(32, this, "ptr", bstrState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrStreetAddress 
     * @returns {HRESULT} 
     */
    get_StreetAddress(pbstrStreetAddress) {
        result := ComCall(33, this, "ptr", pbstrStreetAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrStreetAddress 
     * @returns {HRESULT} 
     */
    put_StreetAddress(bstrStreetAddress) {
        bstrStreetAddress := bstrStreetAddress is String ? BSTR.Alloc(bstrStreetAddress).Value : bstrStreetAddress

        result := ComCall(34, this, "ptr", bstrStreetAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTitle 
     * @returns {HRESULT} 
     */
    get_Title(pbstrTitle) {
        result := ComCall(35, this, "ptr", pbstrTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTitle 
     * @returns {HRESULT} 
     */
    put_Title(bstrTitle) {
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(36, this, "ptr", bstrTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrZipCode 
     * @returns {HRESULT} 
     */
    get_ZipCode(pbstrZipCode) {
        result := ComCall(37, this, "ptr", pbstrZipCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrZipCode 
     * @returns {HRESULT} 
     */
    put_ZipCode(bstrZipCode) {
        bstrZipCode := bstrZipCode is String ? BSTR.Alloc(bstrZipCode).Value : bstrZipCode

        result := ComCall(38, this, "ptr", bstrZipCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LoadDefaultSender() {
        result := ComCall(39, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SaveDefaultSender() {
        result := ComCall(40, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
