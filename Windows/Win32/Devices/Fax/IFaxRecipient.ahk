#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxRecipient interface defines a FaxRecipient messaging object is used by a fax client application to retrieve and set the personal information for fax recipients.
 * @remarks
 * 
 * A default implementation of <b>IFaxRecipient</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxrecipient">FaxRecipient</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxrecipient
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipient-get_faxnumber
     */
    get_FaxNumber() {
        pbstrFaxNumber := BSTR()
        result := ComCall(7, this, "ptr", pbstrFaxNumber, "HRESULT")
        return pbstrFaxNumber
    }

    /**
     * 
     * @param {BSTR} bstrFaxNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipient-put_faxnumber
     */
    put_FaxNumber(bstrFaxNumber) {
        bstrFaxNumber := bstrFaxNumber is String ? BSTR.Alloc(bstrFaxNumber).Value : bstrFaxNumber

        result := ComCall(8, this, "ptr", bstrFaxNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipient-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(9, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipient-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, "ptr", bstrName, "HRESULT")
        return result
    }
}
