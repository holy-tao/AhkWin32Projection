#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxIncomingMessage.ahk

/**
 * Used by a fax client application to retrieve information about a received fax message in the archive of inbound faxes.
 * @remarks
 * 
 * To create a <b>FaxIncomingMessage2</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-getmessage-vb">IFaxAccountIncomingArchive::GetMessage</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessageiterator-message-vb">IFaxIncomingMessageIterator::get_Message</a> method.
 * 
 * A default implementation of this interface is provided by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage">FaxIncomingMessage</a> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxincomingmessage2
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxIncomingMessage2 extends IFaxIncomingMessage{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxIncomingMessage2
     * @type {Guid}
     */
    static IID => Guid("{f9208503-e2bc-48f3-9ec0-e6236f9b509a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Subject", "put_Subject", "get_SenderName", "put_SenderName", "get_SenderFaxNumber", "put_SenderFaxNumber", "get_HasCoverPage", "put_HasCoverPage", "get_Recipients", "put_Recipients", "get_WasReAssigned", "get_Read", "put_Read", "ReAssign", "Save", "Refresh"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_subject
     */
    get_Subject() {
        pbstrSubject := BSTR()
        result := ComCall(20, this, "ptr", pbstrSubject, "HRESULT")
        return pbstrSubject
    }

    /**
     * 
     * @param {BSTR} bstrSubject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-put_subject
     */
    put_Subject(bstrSubject) {
        bstrSubject := bstrSubject is String ? BSTR.Alloc(bstrSubject).Value : bstrSubject

        result := ComCall(21, this, "ptr", bstrSubject, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_sendername
     */
    get_SenderName() {
        pbstrSenderName := BSTR()
        result := ComCall(22, this, "ptr", pbstrSenderName, "HRESULT")
        return pbstrSenderName
    }

    /**
     * 
     * @param {BSTR} bstrSenderName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-put_sendername
     */
    put_SenderName(bstrSenderName) {
        bstrSenderName := bstrSenderName is String ? BSTR.Alloc(bstrSenderName).Value : bstrSenderName

        result := ComCall(23, this, "ptr", bstrSenderName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_senderfaxnumber
     */
    get_SenderFaxNumber() {
        pbstrSenderFaxNumber := BSTR()
        result := ComCall(24, this, "ptr", pbstrSenderFaxNumber, "HRESULT")
        return pbstrSenderFaxNumber
    }

    /**
     * 
     * @param {BSTR} bstrSenderFaxNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-put_senderfaxnumber
     */
    put_SenderFaxNumber(bstrSenderFaxNumber) {
        bstrSenderFaxNumber := bstrSenderFaxNumber is String ? BSTR.Alloc(bstrSenderFaxNumber).Value : bstrSenderFaxNumber

        result := ComCall(25, this, "ptr", bstrSenderFaxNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_hascoverpage
     */
    get_HasCoverPage() {
        result := ComCall(26, this, "short*", &pbHasCoverPage := 0, "HRESULT")
        return pbHasCoverPage
    }

    /**
     * 
     * @param {VARIANT_BOOL} bHasCoverPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-put_hascoverpage
     */
    put_HasCoverPage(bHasCoverPage) {
        result := ComCall(27, this, "short", bHasCoverPage, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_recipients
     */
    get_Recipients() {
        pbstrRecipients := BSTR()
        result := ComCall(28, this, "ptr", pbstrRecipients, "HRESULT")
        return pbstrRecipients
    }

    /**
     * 
     * @param {BSTR} bstrRecipients 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-put_recipients
     */
    put_Recipients(bstrRecipients) {
        bstrRecipients := bstrRecipients is String ? BSTR.Alloc(bstrRecipients).Value : bstrRecipients

        result := ComCall(29, this, "ptr", bstrRecipients, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_wasreassigned
     */
    get_WasReAssigned() {
        result := ComCall(30, this, "short*", &pbWasReAssigned := 0, "HRESULT")
        return pbWasReAssigned
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_read
     */
    get_Read() {
        result := ComCall(31, this, "short*", &pbRead := 0, "HRESULT")
        return pbRead
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-put_read
     */
    put_Read(bRead) {
        result := ComCall(32, this, "short", bRead, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-reassign
     */
    ReAssign() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-save
     */
    Save() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-refresh
     */
    Refresh() {
        result := ComCall(35, this, "HRESULT")
        return result
    }
}
