#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-get__newenum
     */
    get__NewEnum(ppUnk) {
        result := ComCall(7, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IFaxRecipient>} ppFaxRecipient 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-get_item
     */
    get_Item(lIndex, ppFaxRecipient) {
        result := ComCall(8, this, "int", lIndex, "ptr*", ppFaxRecipient, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-get_count
     */
    get_Count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFaxNumber 
     * @param {BSTR} bstrRecipientName 
     * @param {Pointer<IFaxRecipient>} ppFaxRecipient 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-add
     */
    Add(bstrFaxNumber, bstrRecipientName, ppFaxRecipient) {
        bstrFaxNumber := bstrFaxNumber is String ? BSTR.Alloc(bstrFaxNumber).Value : bstrFaxNumber
        bstrRecipientName := bstrRecipientName is String ? BSTR.Alloc(bstrRecipientName).Value : bstrRecipientName

        result := ComCall(10, this, "ptr", bstrFaxNumber, "ptr", bstrRecipientName, "ptr*", ppFaxRecipient, "HRESULT")
        return result
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
