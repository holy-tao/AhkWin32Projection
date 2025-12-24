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
     * Specifies the low-order 32-bit value of the size (in bytes) of the archive of outbound fax messages for a particular fax account.
     * @remarks
     * 
     * Because the archive size can exceed 4 GB in size, its size is described as a 64-bit integer whose value is returned as two 32-bit integer values. SizeLow returns the low-order 32-bit value of the archive size. SizeHigh returns the high-order 32-bit value of the archive size. The 64-bit value of the archive size can be computed as: Size64 = (SizeHigh &lt;&lt; 32) + SizeLow.
     * 
     * If both the <b>SizeLow</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountoutgoingarchive-sizehigh-vb">SizeHigh</a> properties have the value 0xffffffff, they specify an invalid archive size, and you should ignore both property values.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-get_sizelow
     */
    get_SizeLow() {
        result := ComCall(7, this, "int*", &plSizeLow := 0, "HRESULT")
        return plSizeLow
    }

    /**
     * Specifies the high-order 32-bit value of the size (in bytes) of the archive of outbound fax messages for a particular fax account.
     * @remarks
     * 
     * Because the archive size can exceed 4 GB in size, its size is described as a 64-bit integer whose value is returned as two 32-bit integer values. SizeLow returns the low-order 32-bit value of the archive size. SizeHigh returns the high-order 32-bit value of the archive size. The 64-bit value of the archive size can be computed as: Size64 = (SizeHigh &lt;&lt; 32) + SizeLow.
     * 
     * If both the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountoutgoingarchive-sizelow-vb">SizeLow</a> and <b>SizeHigh</b> properties have the value 0xffffffff, they specify an invalid archive size, and you should ignore both property values.
     * 
     * The property is read-only.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-get_sizehigh
     */
    get_SizeHigh() {
        result := ComCall(8, this, "int*", &plSizeHigh := 0, "HRESULT")
        return plSizeHigh
    }

    /**
     * Refreshes FaxAccountOutgoingArchive object information for a particular fax account from the fax server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-refresh
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Returns a new iterator (archive cursor) for the archive of outbound fax messages for a particular fax account.
     * @param {Integer} lPrefetchSize Type: <b>long</b>
     * 
     * <b>long</b> value that indicates the size of the prefetch buffer. This value determines how many fax messages the iterator object retrieves from the fax server when the object needs to refresh its contents. The default value is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ldefault-prefetch-size">lDEFAULT_PREFETCH_SIZE</a>.
     * @returns {IFaxOutgoingMessageIterator} Type: <b>IFaxOutgoingMessageIterator**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessageiterator">FaxOutgoingMessageIterator</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-getmessages
     */
    GetMessages(lPrefetchSize) {
        result := ComCall(10, this, "int", lPrefetchSize, "ptr*", &pFaxOutgoingMessageIterator := 0, "HRESULT")
        return IFaxOutgoingMessageIterator(pFaxOutgoingMessageIterator)
    }

    /**
     * Returns a fax message from the archive of outbound faxes for a particular fax account, by using the fax message ID.
     * @param {BSTR} bstrMessageId Type: <b>BSTR</b>
     * 
     * Specifies a null-terminated string that contains the message ID of the fax to retrieve from the archive of outbound faxes.
     * @returns {IFaxOutgoingMessage} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutgoingmessage">IFaxOutgoingMessage</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutgoingmessage">IFaxOutgoingMessage</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-getmessage
     */
    GetMessage(bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(11, this, "ptr", bstrMessageId, "ptr*", &pFaxOutgoingMessage := 0, "HRESULT")
        return IFaxOutgoingMessage(pFaxOutgoingMessage)
    }
}
