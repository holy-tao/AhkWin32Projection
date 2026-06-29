#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IFaxRecipient interface defines a FaxRecipient messaging object is used by a fax client application to retrieve and set the personal information for fax recipients.
 * @remarks
 * A default implementation of <b>IFaxRecipient</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxrecipient">FaxRecipient</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxrecipient
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxRecipient extends IDispatch {
    /**
     * The interface identifier for IFaxRecipient
     * @type {Guid}
     */
    static IID := Guid("{9a3da3a0-538d-42b6-9444-aaa57d0ce2bc}")

    /**
     * The class identifier for FaxRecipient
     * @type {Guid}
     */
    static CLSID := Guid("{60bf3301-7df8-4bd8-9148-7b5801f9efdf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxRecipient interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_FaxNumber : IntPtr
        put_FaxNumber : IntPtr
        get_Name      : IntPtr
        put_Name      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxRecipient.Vtbl()
        }
        super.__New(implObj, flags)
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
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * The IFaxRecipient::get_FaxNumber property is a null-terminated string that contains the fax number associated with the recipient. (Get)
     * @remarks
     * If this string contains a canonical fax number (defined in the <a href="https://docs.microsoft.com/windows/desktop/Tapi/address-ovr">Address</a> topic of the Telephony Application Programming Interface (TAPI) documentation—see the <i>Canonical Addresses</i> subheading), then the outbound routing rules will be applied. Otherwise, the first available device will be used and the fax number we be dialed as it appears in the string.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipient-get_faxnumber
     */
    get_FaxNumber() {
        pbstrFaxNumber := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrFaxNumber, "HRESULT")
        return pbstrFaxNumber
    }

    /**
     * The IFaxRecipient::get_FaxNumber property is a null-terminated string that contains the fax number associated with the recipient. (Put)
     * @remarks
     * If this string contains a canonical fax number (defined in the <a href="https://docs.microsoft.com/windows/desktop/Tapi/address-ovr">Address</a> topic of the Telephony Application Programming Interface (TAPI) documentation—see the <i>Canonical Addresses</i> subheading), then the outbound routing rules will be applied. Otherwise, the first available device will be used and the fax number we be dialed as it appears in the string.
     * @param {BSTR} bstrFaxNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipient-put_faxnumber
     */
    put_FaxNumber(bstrFaxNumber) {
        bstrFaxNumber := bstrFaxNumber is String ? BSTR.Alloc(bstrFaxNumber).Value : bstrFaxNumber

        result := ComCall(8, this, BSTR, bstrFaxNumber, "HRESULT")
        return result
    }

    /**
     * The IFaxRecipient::get_Name property is a null-terminated string that contains the name of the recipient. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipient-get_name
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * The IFaxRecipient::get_Name property is a null-terminated string that contains the name of the recipient. (Put)
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipient-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, BSTR, bstrName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxRecipient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_FaxNumber := CallbackCreate(GetMethod(implObj, "get_FaxNumber"), flags, 2)
        this.vtbl.put_FaxNumber := CallbackCreate(GetMethod(implObj, "put_FaxNumber"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_FaxNumber)
        CallbackFree(this.vtbl.put_FaxNumber)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
    }
}
