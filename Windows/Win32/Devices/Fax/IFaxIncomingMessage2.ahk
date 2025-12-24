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
     * @type {BSTR} 
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     * @type {BSTR} 
     */
    SenderName {
        get => this.get_SenderName()
        set => this.put_SenderName(value)
    }

    /**
     * @type {BSTR} 
     */
    SenderFaxNumber {
        get => this.get_SenderFaxNumber()
        set => this.put_SenderFaxNumber(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    HasCoverPage {
        get => this.get_HasCoverPage()
        set => this.put_HasCoverPage(value)
    }

    /**
     * @type {BSTR} 
     */
    Recipients {
        get => this.get_Recipients()
        set => this.put_Recipients(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    WasReAssigned {
        get => this.get_WasReAssigned()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Read {
        get => this.get_Read()
        set => this.put_Read(value)
    }

    /**
     * The Subject property contains the subject associated with the inbound fax message. This property is a null-terminated string.
     * @remarks
     * 
     * A received message starts with a null value for the subject when it arrives. It can be given a subject by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> when it is reassigned.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-get_subject
     */
    get_Subject() {
        pbstrSubject := BSTR()
        result := ComCall(20, this, "ptr", pbstrSubject, "HRESULT")
        return pbstrSubject
    }

    /**
     * The Subject property contains the subject associated with the inbound fax message. This property is a null-terminated string.
     * @remarks
     * 
     * A received message starts with a null value for the subject when it arrives. It can be given a subject by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> when it is reassigned.
     * 
     * 
     * @param {BSTR} bstrSubject 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-put_subject
     */
    put_Subject(bstrSubject) {
        bstrSubject := bstrSubject is String ? BSTR.Alloc(bstrSubject).Value : bstrSubject

        result := ComCall(21, this, "ptr", bstrSubject, "HRESULT")
        return result
    }

    /**
     * Contains the name of the sender that is associated with the inbound fax message. This property is a null-terminated string.
     * @remarks
     * 
     * A received message starts with a null value for the sender when it arrives. A sender can be specified by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a>when it is re-assigned.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-get_sendername
     */
    get_SenderName() {
        pbstrSenderName := BSTR()
        result := ComCall(22, this, "ptr", pbstrSenderName, "HRESULT")
        return pbstrSenderName
    }

    /**
     * Contains the name of the sender that is associated with the inbound fax message. This property is a null-terminated string.
     * @remarks
     * 
     * A received message starts with a null value for the sender when it arrives. A sender can be specified by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a>when it is re-assigned.
     * 
     * 
     * @param {BSTR} bstrSenderName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-put_sendername
     */
    put_SenderName(bstrSenderName) {
        bstrSenderName := bstrSenderName is String ? BSTR.Alloc(bstrSenderName).Value : bstrSenderName

        result := ComCall(23, this, "ptr", bstrSenderName, "HRESULT")
        return result
    }

    /**
     * Contains the sender's fax number associated with the inbound fax message. This property is a null-terminated string.
     * @remarks
     * 
     * A received message starts with a null value for the sender's fax number when it arrives. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> can specify the sender's fax number when the fax is reassigned.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-get_senderfaxnumber
     */
    get_SenderFaxNumber() {
        pbstrSenderFaxNumber := BSTR()
        result := ComCall(24, this, "ptr", pbstrSenderFaxNumber, "HRESULT")
        return pbstrSenderFaxNumber
    }

    /**
     * Contains the sender's fax number associated with the inbound fax message. This property is a null-terminated string.
     * @remarks
     * 
     * A received message starts with a null value for the sender's fax number when it arrives. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> can specify the sender's fax number when the fax is reassigned.
     * 
     * 
     * @param {BSTR} bstrSenderFaxNumber 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-put_senderfaxnumber
     */
    put_SenderFaxNumber(bstrSenderFaxNumber) {
        bstrSenderFaxNumber := bstrSenderFaxNumber is String ? BSTR.Alloc(bstrSenderFaxNumber).Value : bstrSenderFaxNumber

        result := ComCall(25, this, "ptr", bstrSenderFaxNumber, "HRESULT")
        return result
    }

    /**
     * A flag that indicates whether the fax has a cover page.
     * @remarks
     * 
     * A received message has a VARIANT_FALSE value when it arrives. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> application can set this to VARIANT_TRUE when it is reassigned. 
     * 
     * A change to this value is not committed to the server until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-save-vb">IFaxIncomingMessage2::Save</a> is called.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-get_hascoverpage
     */
    get_HasCoverPage() {
        result := ComCall(26, this, "short*", &pbHasCoverPage := 0, "HRESULT")
        return pbHasCoverPage
    }

    /**
     * A flag that indicates whether the fax has a cover page.
     * @remarks
     * 
     * A received message has a VARIANT_FALSE value when it arrives. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> application can set this to VARIANT_TRUE when it is reassigned. 
     * 
     * A change to this value is not committed to the server until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-save-vb">IFaxIncomingMessage2::Save</a> is called.
     * 
     * 
     * @param {VARIANT_BOOL} bHasCoverPage 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-put_hascoverpage
     */
    put_HasCoverPage(bHasCoverPage) {
        result := ComCall(27, this, "short", bHasCoverPage, "HRESULT")
        return result
    }

    /**
     * Contains the recipients associated with the inbound fax message. This property is a null-terminated string.
     * @remarks
     * 
     * A received message starts with a null value for the recipients when it arrives. A list of recipients can be specified by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> when it is reassigned.
     * 
     * Each recipient is identified on the pattern of &lt;DomainName&gt;\&lt;UserName&gt;. A colon ":" separates each recipient. For local users, &lt;DomainName&gt; is the local computer name.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-get_recipients
     */
    get_Recipients() {
        pbstrRecipients := BSTR()
        result := ComCall(28, this, "ptr", pbstrRecipients, "HRESULT")
        return pbstrRecipients
    }

    /**
     * Contains the recipients associated with the inbound fax message. This property is a null-terminated string.
     * @remarks
     * 
     * A received message starts with a null value for the recipients when it arrives. A list of recipients can be specified by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> when it is reassigned.
     * 
     * Each recipient is identified on the pattern of &lt;DomainName&gt;\&lt;UserName&gt;. A colon ":" separates each recipient. For local users, &lt;DomainName&gt; is the local computer name.
     * 
     * 
     * @param {BSTR} bstrRecipients 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-put_recipients
     */
    put_Recipients(bstrRecipients) {
        bstrRecipients := bstrRecipients is String ? BSTR.Alloc(bstrRecipients).Value : bstrRecipients

        result := ComCall(29, this, "ptr", bstrRecipients, "HRESULT")
        return result
    }

    /**
     * Indicates if the fax has been reassigned.
     * @remarks
     * 
     * This property is always VARIANT_FALSE when the fax arrives at the server. If it is reassigned by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a>, the fax service sets it to VARIANT_TRUE.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-get_wasreassigned
     */
    get_WasReAssigned() {
        result := ComCall(30, this, "short*", &pbWasReAssigned := 0, "HRESULT")
        return pbWasReAssigned
    }

    /**
     * A flag that indicates if the fax has been read.
     * @remarks
     * 
     * Possible values are VARIANT_TRUE and VARIANT_FALSE.
     * 
     * A change to this value is not committed to the server until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-save-vb">IFaxIncomingMessage2::Save</a> is called.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-get_read
     */
    get_Read() {
        result := ComCall(31, this, "short*", &pbRead := 0, "HRESULT")
        return pbRead
    }

    /**
     * A flag that indicates if the fax has been read.
     * @remarks
     * 
     * Possible values are VARIANT_TRUE and VARIANT_FALSE.
     * 
     * A change to this value is not committed to the server until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-save-vb">IFaxIncomingMessage2::Save</a> is called.
     * 
     * 
     * @param {VARIANT_BOOL} bRead 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-put_read
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
     * Saves the FaxIncomingMessage object's data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-save
     */
    Save() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * Refreshes FaxIncomingMessage object information from the fax server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage2-refresh
     */
    Refresh() {
        result := ComCall(35, this, "HRESULT")
        return result
    }
}
