#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxRecipient interface defines a FaxRecipient messaging object is used by a fax client application to retrieve and set the personal information for fax recipients.
 * @remarks
 * A default implementation of <b>IFaxRecipient</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxrecipient">FaxRecipient</a> object.
 * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nn-faxcomex-ifaxrecipient
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxRecipient extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxRecipient
     * @type {Guid}
     */
    static IID => Guid("{9a3da3a0-538d-42b6-9444-aaa57d0ce2bc}")

    /**
     * The class identifier for FaxRecipient
     * @type {Guid}
     */
    static CLSID => Guid("{60bf3301-7df8-4bd8-9148-7b5801f9efdf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FaxNumber", "put_FaxNumber", "get_Name", "put_Name"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxrecipient-get_faxnumber
     */
    get_FaxNumber() {
        pbstrFaxNumber := BSTR()
        result := ComCall(7, this, "ptr", pbstrFaxNumber, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrFaxNumber
    }

    /**
     * The IFaxRecipient::get_FaxNumber property is a null-terminated string that contains the fax number associated with the recipient. (Put)
     * @remarks
     * If this string contains a canonical fax number (defined in the <a href="https://docs.microsoft.com/windows/desktop/Tapi/address-ovr">Address</a> topic of the Telephony Application Programming Interface (TAPI) documentation—see the <i>Canonical Addresses</i> subheading), then the outbound routing rules will be applied. Otherwise, the first available device will be used and the fax number we be dialed as it appears in the string.
     * @param {BSTR} bstrFaxNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxrecipient-put_faxnumber
     */
    put_FaxNumber(bstrFaxNumber) {
        if(bstrFaxNumber is String) {
            pin := BSTR.Alloc(bstrFaxNumber)
            bstrFaxNumber := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrFaxNumber, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxRecipient::get_Name property is a null-terminated string that contains the name of the recipient. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxrecipient-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(9, this, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }

    /**
     * The IFaxRecipient::get_Name property is a null-terminated string that contains the name of the recipient. (Put)
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxrecipient-put_name
     */
    put_Name(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
