#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxIncomingMessage.ahk" { IFaxIncomingMessage }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Used by a fax client application to retrieve information about a received fax message in the archive of inbound faxes. (IFaxIncomingMessage2)
 * @remarks
 * To create a <b>FaxIncomingMessage2</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-getmessage-vb">IFaxAccountIncomingArchive::GetMessage</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessageiterator-message-vb">IFaxIncomingMessageIterator::get_Message</a> method.
 * 
 * A default implementation of this interface is provided by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage">FaxIncomingMessage</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxincomingmessage2
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxIncomingMessage2 extends IFaxIncomingMessage {
    /**
     * The interface identifier for IFaxIncomingMessage2
     * @type {Guid}
     */
    static IID := Guid("{f9208503-e2bc-48f3-9ec0-e6236f9b509a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxIncomingMessage2 interfaces
    */
    struct Vtbl extends IFaxIncomingMessage.Vtbl {
        get_Subject         : IntPtr
        put_Subject         : IntPtr
        get_SenderName      : IntPtr
        put_SenderName      : IntPtr
        get_SenderFaxNumber : IntPtr
        put_SenderFaxNumber : IntPtr
        get_HasCoverPage    : IntPtr
        put_HasCoverPage    : IntPtr
        get_Recipients      : IntPtr
        put_Recipients      : IntPtr
        get_WasReAssigned   : IntPtr
        get_Read            : IntPtr
        put_Read            : IntPtr
        ReAssign            : IntPtr
        Save                : IntPtr
        Refresh             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxIncomingMessage2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The Subject property contains the subject associated with the inbound fax message. This property is a null-terminated string. (Get)
     * @remarks
     * A received message starts with a null value for the subject when it arrives. It can be given a subject by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> when it is reassigned.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_subject
     */
    get_Subject() {
        pbstrSubject := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, pbstrSubject, "HRESULT")
        return pbstrSubject
    }

    /**
     * The Subject property contains the subject associated with the inbound fax message. This property is a null-terminated string. (Put)
     * @remarks
     * A received message starts with a null value for the subject when it arrives. It can be given a subject by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> when it is reassigned.
     * @param {BSTR} bstrSubject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-put_subject
     */
    put_Subject(bstrSubject) {
        bstrSubject := bstrSubject is String ? BSTR.Alloc(bstrSubject).Value : bstrSubject

        result := ComCall(21, this, BSTR, bstrSubject, "HRESULT")
        return result
    }

    /**
     * Contains the name of the sender that is associated with the inbound fax message. This property is a null-terminated string. (Get)
     * @remarks
     * A received message starts with a null value for the sender when it arrives. A sender can be specified by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> when it is re-assigned.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_sendername
     */
    get_SenderName() {
        pbstrSenderName := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, pbstrSenderName, "HRESULT")
        return pbstrSenderName
    }

    /**
     * Contains the name of the sender that is associated with the inbound fax message. This property is a null-terminated string. (Put)
     * @remarks
     * A received message starts with a null value for the sender when it arrives. A sender can be specified by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> when it is re-assigned.
     * @param {BSTR} bstrSenderName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-put_sendername
     */
    put_SenderName(bstrSenderName) {
        bstrSenderName := bstrSenderName is String ? BSTR.Alloc(bstrSenderName).Value : bstrSenderName

        result := ComCall(23, this, BSTR, bstrSenderName, "HRESULT")
        return result
    }

    /**
     * Contains the sender's fax number associated with the inbound fax message. This property is a null-terminated string. (Get)
     * @remarks
     * A received message starts with a null value for the sender's fax number when it arrives. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> can specify the sender's fax number when the fax is reassigned.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_senderfaxnumber
     */
    get_SenderFaxNumber() {
        pbstrSenderFaxNumber := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, pbstrSenderFaxNumber, "HRESULT")
        return pbstrSenderFaxNumber
    }

    /**
     * Contains the sender's fax number associated with the inbound fax message. This property is a null-terminated string. (Put)
     * @remarks
     * A received message starts with a null value for the sender's fax number when it arrives. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> can specify the sender's fax number when the fax is reassigned.
     * @param {BSTR} bstrSenderFaxNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-put_senderfaxnumber
     */
    put_SenderFaxNumber(bstrSenderFaxNumber) {
        bstrSenderFaxNumber := bstrSenderFaxNumber is String ? BSTR.Alloc(bstrSenderFaxNumber).Value : bstrSenderFaxNumber

        result := ComCall(25, this, BSTR, bstrSenderFaxNumber, "HRESULT")
        return result
    }

    /**
     * A flag that indicates whether the fax has a cover page. (Get)
     * @remarks
     * A received message has a VARIANT_FALSE value when it arrives. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> application can set this to VARIANT_TRUE when it is reassigned. 
     * 
     * A change to this value is not committed to the server until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-save-vb">IFaxIncomingMessage2::Save</a> is called.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_hascoverpage
     */
    get_HasCoverPage() {
        result := ComCall(26, this, VARIANT_BOOL.Ptr, &pbHasCoverPage := 0, "HRESULT")
        return pbHasCoverPage
    }

    /**
     * A flag that indicates whether the fax has a cover page. (Put)
     * @remarks
     * A received message has a VARIANT_FALSE value when it arrives. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> application can set this to VARIANT_TRUE when it is reassigned. 
     * 
     * A change to this value is not committed to the server until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-save-vb">IFaxIncomingMessage2::Save</a> is called.
     * @param {VARIANT_BOOL} bHasCoverPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-put_hascoverpage
     */
    put_HasCoverPage(bHasCoverPage) {
        result := ComCall(27, this, VARIANT_BOOL, bHasCoverPage, "HRESULT")
        return result
    }

    /**
     * Contains the recipients associated with the inbound fax message. This property is a null-terminated string. (Get)
     * @remarks
     * A received message starts with a null value for the recipients when it arrives. A list of recipients can be specified by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> when it is reassigned.
     * 
     * Each recipient is identified on the pattern of &lt;DomainName&gt;\&lt;UserName&gt;. A colon ":" separates each recipient. For local users, &lt;DomainName&gt; is the local computer name.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_recipients
     */
    get_Recipients() {
        pbstrRecipients := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, pbstrRecipients, "HRESULT")
        return pbstrRecipients
    }

    /**
     * Contains the recipients associated with the inbound fax message. This property is a null-terminated string. (Put)
     * @remarks
     * A received message starts with a null value for the recipients when it arrives. A list of recipients can be specified by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> when it is reassigned.
     * 
     * Each recipient is identified on the pattern of &lt;DomainName&gt;\&lt;UserName&gt;. A colon ":" separates each recipient. For local users, &lt;DomainName&gt; is the local computer name.
     * @param {BSTR} bstrRecipients 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-put_recipients
     */
    put_Recipients(bstrRecipients) {
        bstrRecipients := bstrRecipients is String ? BSTR.Alloc(bstrRecipients).Value : bstrRecipients

        result := ComCall(29, this, BSTR, bstrRecipients, "HRESULT")
        return result
    }

    /**
     * Indicates if the fax has been reassigned.
     * @remarks
     * This property is always VARIANT_FALSE when the fax arrives at the server. If it is reassigned by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a>, the fax service sets it to VARIANT_TRUE.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_wasreassigned
     */
    get_WasReAssigned() {
        result := ComCall(30, this, VARIANT_BOOL.Ptr, &pbWasReAssigned := 0, "HRESULT")
        return pbWasReAssigned
    }

    /**
     * A flag that indicates if the fax has been read. (Get)
     * @remarks
     * Possible values are VARIANT_TRUE and VARIANT_FALSE.
     * 
     * A change to this value is not committed to the server until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-save-vb">IFaxIncomingMessage2::Save</a> is called.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-get_read
     */
    get_Read() {
        result := ComCall(31, this, VARIANT_BOOL.Ptr, &pbRead := 0, "HRESULT")
        return pbRead
    }

    /**
     * A flag that indicates if the fax has been read. (Put)
     * @remarks
     * Possible values are VARIANT_TRUE and VARIANT_FALSE.
     * 
     * A change to this value is not committed to the server until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-save-vb">IFaxIncomingMessage2::Save</a> is called.
     * @param {VARIANT_BOOL} bRead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-put_read
     */
    put_Read(bRead) {
        result := ComCall(32, this, VARIANT_BOOL, bRead, "HRESULT")
        return result
    }

    /**
     * Reassign the fax to one or more recipients. It also commits changes to the IFaxIncomingMessage2::Subject, IFaxIncomingMessage2::SenderName, IFaxIncomingMessage2::SenderFaxNumber, and IFaxIncomingMessage2::HasCoverPage properties.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2MANAGE_RECEIVE_FOLDER</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access rights. Also, IFaxConfiguration::IncomingFaxesArePublic must be set to false.
     * 
     * If the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">routing assistant</a> application is going to set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-subject-vb">IFaxIncomingMessage2::Subject</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-sendername-vb">IFaxIncomingMessage2::SenderName</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-senderfaxnumber-vb">IFaxIncomingMessage2::SenderFaxNumber</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-hascoverpage-vb">IFaxIncomingMessage2::HasCoverPage</a> properties, it should do this before calling <b>IFaxIncomingMessage2::Reassign</b>. <b>Reassign</b> will commit those changes, so it is not necessary to call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-save-vb">IFaxIncomingMessage2::Save</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-reassign
     */
    ReAssign() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * Saves the FaxIncomingMessage object's data.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2MANAGE_CONFIG</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access rights.
     * 
     * It is not necessary to call this method to commit changes to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-subject-vb">IFaxIncomingMessage2::Subject</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-sendername-vb">IFaxIncomingMessage2::SenderName</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-senderfaxnumber-vb">IFaxIncomingMessage2::SenderFaxNumber</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-hascoverpage-vb">IFaxIncomingMessage2::HasCoverPage</a> properties. They are committed with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage-reassign-vb">IFaxIncomingMessage2::Reassign</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-save
     */
    Save() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * Refreshes FaxIncomingMessage object information from the fax server.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access rights.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage2-refresh
     */
    Refresh() {
        result := ComCall(35, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxIncomingMessage2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Subject := CallbackCreate(GetMethod(implObj, "get_Subject"), flags, 2)
        this.vtbl.put_Subject := CallbackCreate(GetMethod(implObj, "put_Subject"), flags, 2)
        this.vtbl.get_SenderName := CallbackCreate(GetMethod(implObj, "get_SenderName"), flags, 2)
        this.vtbl.put_SenderName := CallbackCreate(GetMethod(implObj, "put_SenderName"), flags, 2)
        this.vtbl.get_SenderFaxNumber := CallbackCreate(GetMethod(implObj, "get_SenderFaxNumber"), flags, 2)
        this.vtbl.put_SenderFaxNumber := CallbackCreate(GetMethod(implObj, "put_SenderFaxNumber"), flags, 2)
        this.vtbl.get_HasCoverPage := CallbackCreate(GetMethod(implObj, "get_HasCoverPage"), flags, 2)
        this.vtbl.put_HasCoverPage := CallbackCreate(GetMethod(implObj, "put_HasCoverPage"), flags, 2)
        this.vtbl.get_Recipients := CallbackCreate(GetMethod(implObj, "get_Recipients"), flags, 2)
        this.vtbl.put_Recipients := CallbackCreate(GetMethod(implObj, "put_Recipients"), flags, 2)
        this.vtbl.get_WasReAssigned := CallbackCreate(GetMethod(implObj, "get_WasReAssigned"), flags, 2)
        this.vtbl.get_Read := CallbackCreate(GetMethod(implObj, "get_Read"), flags, 2)
        this.vtbl.put_Read := CallbackCreate(GetMethod(implObj, "put_Read"), flags, 2)
        this.vtbl.ReAssign := CallbackCreate(GetMethod(implObj, "ReAssign"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Subject)
        CallbackFree(this.vtbl.put_Subject)
        CallbackFree(this.vtbl.get_SenderName)
        CallbackFree(this.vtbl.put_SenderName)
        CallbackFree(this.vtbl.get_SenderFaxNumber)
        CallbackFree(this.vtbl.put_SenderFaxNumber)
        CallbackFree(this.vtbl.get_HasCoverPage)
        CallbackFree(this.vtbl.put_HasCoverPage)
        CallbackFree(this.vtbl.get_Recipients)
        CallbackFree(this.vtbl.put_Recipients)
        CallbackFree(this.vtbl.get_WasReAssigned)
        CallbackFree(this.vtbl.get_Read)
        CallbackFree(this.vtbl.put_Read)
        CallbackFree(this.vtbl.ReAssign)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.Refresh)
    }
}
