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
     * 
     * @param {Pointer<BSTR>} pbstrSubject 
     * @returns {HRESULT} 
     */
    get_Subject(pbstrSubject) {
        result := ComCall(20, this, "ptr", pbstrSubject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSubject 
     * @returns {HRESULT} 
     */
    put_Subject(bstrSubject) {
        bstrSubject := bstrSubject is String ? BSTR.Alloc(bstrSubject).Value : bstrSubject

        result := ComCall(21, this, "ptr", bstrSubject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSenderName 
     * @returns {HRESULT} 
     */
    get_SenderName(pbstrSenderName) {
        result := ComCall(22, this, "ptr", pbstrSenderName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSenderName 
     * @returns {HRESULT} 
     */
    put_SenderName(bstrSenderName) {
        bstrSenderName := bstrSenderName is String ? BSTR.Alloc(bstrSenderName).Value : bstrSenderName

        result := ComCall(23, this, "ptr", bstrSenderName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSenderFaxNumber 
     * @returns {HRESULT} 
     */
    get_SenderFaxNumber(pbstrSenderFaxNumber) {
        result := ComCall(24, this, "ptr", pbstrSenderFaxNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSenderFaxNumber 
     * @returns {HRESULT} 
     */
    put_SenderFaxNumber(bstrSenderFaxNumber) {
        bstrSenderFaxNumber := bstrSenderFaxNumber is String ? BSTR.Alloc(bstrSenderFaxNumber).Value : bstrSenderFaxNumber

        result := ComCall(25, this, "ptr", bstrSenderFaxNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbHasCoverPage 
     * @returns {HRESULT} 
     */
    get_HasCoverPage(pbHasCoverPage) {
        result := ComCall(26, this, "ptr", pbHasCoverPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bHasCoverPage 
     * @returns {HRESULT} 
     */
    put_HasCoverPage(bHasCoverPage) {
        result := ComCall(27, this, "short", bHasCoverPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRecipients 
     * @returns {HRESULT} 
     */
    get_Recipients(pbstrRecipients) {
        result := ComCall(28, this, "ptr", pbstrRecipients, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRecipients 
     * @returns {HRESULT} 
     */
    put_Recipients(bstrRecipients) {
        bstrRecipients := bstrRecipients is String ? BSTR.Alloc(bstrRecipients).Value : bstrRecipients

        result := ComCall(29, this, "ptr", bstrRecipients, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbWasReAssigned 
     * @returns {HRESULT} 
     */
    get_WasReAssigned(pbWasReAssigned) {
        result := ComCall(30, this, "ptr", pbWasReAssigned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRead 
     * @returns {HRESULT} 
     */
    get_Read(pbRead) {
        result := ComCall(31, this, "ptr", pbRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRead 
     * @returns {HRESULT} 
     */
    put_Read(bRead) {
        result := ComCall(32, this, "short", bRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReAssign() {
        result := ComCall(33, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(34, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(35, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
