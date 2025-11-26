#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxIncomingMessageIterator.ahk
#Include .\IFaxIncomingMessage.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used by a fax client application to access a particular fax account's archive of successfully received inbound fax messages. Use this interface to retrieve messages and get the size of the archive.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxaccountincomingarchive
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccountIncomingArchive extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxAccountIncomingArchive
     * @type {Guid}
     */
    static IID => Guid("{a8a5b6ef-e0d6-4aee-955c-91625bec9db4}")

    /**
     * The class identifier for FaxAccountIncomingArchive
     * @type {Guid}
     */
    static CLSID => Guid("{14b33db5-4c40-4ecf-9ef8-a360cbe809ed}")

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
     * @type {Integer} 
     */
    SizeLow {
        get => this.get_SizeLow()
    }

    /**
     * @type {Integer} 
     */
    SizeHigh {
        get => this.get_SizeHigh()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-get_sizelow
     */
    get_SizeLow() {
        result := ComCall(7, this, "int*", &plSizeLow := 0, "HRESULT")
        return plSizeLow
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-get_sizehigh
     */
    get_SizeHigh() {
        result := ComCall(8, this, "int*", &plSizeHigh := 0, "HRESULT")
        return plSizeHigh
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-refresh
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPrefetchSize 
     * @returns {IFaxIncomingMessageIterator} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-getmessages
     */
    GetMessages(lPrefetchSize) {
        result := ComCall(10, this, "int", lPrefetchSize, "ptr*", &pFaxIncomingMessageIterator := 0, "HRESULT")
        return IFaxIncomingMessageIterator(pFaxIncomingMessageIterator)
    }

    /**
     * Retrieves a message from the calling thread's message queue. The function dispatches incoming sent messages until a posted message is available for retrieval.
     * @param {BSTR} bstrMessageId 
     * @returns {IFaxIncomingMessage} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmessage
     */
    GetMessage(bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(11, this, "ptr", bstrMessageId, "ptr*", &pFaxIncomingMessage := 0, "HRESULT")
        return IFaxIncomingMessage(pFaxIncomingMessage)
    }
}
