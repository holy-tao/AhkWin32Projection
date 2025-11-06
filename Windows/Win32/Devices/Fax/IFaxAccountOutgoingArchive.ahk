#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxOutgoingMessageIterator.ahk
#Include .\IFaxOutgoingMessage.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used by a fax client application to access a specified fax account's archive of successfully sent outbound fax messages. Use this interface to retrieve messages and get the size of the archive.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxaccountoutgoingarchive
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccountOutgoingArchive extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxAccountOutgoingArchive
     * @type {Guid}
     */
    static IID => Guid("{5463076d-ec14-491f-926e-b3ceda5e5662}")

    /**
     * The class identifier for FaxAccountOutgoingArchive
     * @type {Guid}
     */
    static CLSID => Guid("{851e7af5-433a-4739-a2df-ad245c2cb98e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SizeLow", "get_SizeHigh", "Refresh", "GetMessages", "GetMessage"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-get_sizelow
     */
    get_SizeLow() {
        result := ComCall(7, this, "int*", &plSizeLow := 0, "HRESULT")
        return plSizeLow
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-get_sizehigh
     */
    get_SizeHigh() {
        result := ComCall(8, this, "int*", &plSizeHigh := 0, "HRESULT")
        return plSizeHigh
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-refresh
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPrefetchSize 
     * @returns {IFaxOutgoingMessageIterator} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-getmessages
     */
    GetMessages(lPrefetchSize) {
        result := ComCall(10, this, "int", lPrefetchSize, "ptr*", &pFaxOutgoingMessageIterator := 0, "HRESULT")
        return IFaxOutgoingMessageIterator(pFaxOutgoingMessageIterator)
    }

    /**
     * Retrieves a message from the calling thread's message queue. The function dispatches incoming sent messages until a posted message is available for retrieval.
     * @param {BSTR} bstrMessageId 
     * @returns {IFaxOutgoingMessage} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmessage
     */
    GetMessage(bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(11, this, "ptr", bstrMessageId, "ptr*", &pFaxOutgoingMessage := 0, "HRESULT")
        return IFaxOutgoingMessage(pFaxOutgoingMessage)
    }
}
