#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IFaxRecipient.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxRecipients interface defines a FaxRecipients messaging collection is used by a fax client application to manage the fax recipient objects (FaxRecipient) that represent the recipients of a single fax document.
 * @remarks
 * 
 * A default implementation of <b>IFaxRecipients</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxrecipients">FaxRecipients</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxrecipients
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxRecipients extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxRecipients
     * @type {Guid}
     */
    static IID => Guid("{b9c9de5a-894e-4492-9fa3-08c627c11d5d}")

    /**
     * The class identifier for FaxRecipients
     * @type {Guid}
     */
    static CLSID => Guid("{ea9bdf53-10a9-4d4f-a067-63c8f84f01b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "Add", "Remove"]

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {IFaxRecipient} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-get_item
     */
    get_Item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &ppFaxRecipient := 0, "HRESULT")
        return IFaxRecipient(ppFaxRecipient)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @param {BSTR} bstrFaxNumber 
     * @param {BSTR} bstrRecipientName 
     * @returns {IFaxRecipient} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-add
     */
    Add(bstrFaxNumber, bstrRecipientName) {
        bstrFaxNumber := bstrFaxNumber is String ? BSTR.Alloc(bstrFaxNumber).Value : bstrFaxNumber
        bstrRecipientName := bstrRecipientName is String ? BSTR.Alloc(bstrRecipientName).Value : bstrRecipientName

        result := ComCall(10, this, "ptr", bstrFaxNumber, "ptr", bstrRecipientName, "ptr*", &ppFaxRecipient := 0, "HRESULT")
        return IFaxRecipient(ppFaxRecipient)
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-remove
     */
    Remove(lIndex) {
        result := ComCall(11, this, "int", lIndex, "HRESULT")
        return result
    }
}
