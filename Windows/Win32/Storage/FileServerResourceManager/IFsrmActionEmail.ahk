#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmAction.ahk" { IFsrmAction }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Used to send an email message in response to a quota or file screen event.
 * @remarks
 * You must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailto">MailTo</a> and 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactionemail-get_messagetext">MessageText</a> properties; the other 
 *     properties are optional.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmactionemail
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmActionEmail extends IFsrmAction {
    /**
     * The interface identifier for IFsrmActionEmail
     * @type {Guid}
     */
    static IID := Guid("{d646567d-26ae-4caa-9f84-4e0aad207fca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmActionEmail interfaces
    */
    struct Vtbl extends IFsrmAction.Vtbl {
        get_MailFrom    : IntPtr
        put_MailFrom    : IntPtr
        get_MailReplyTo : IntPtr
        put_MailReplyTo : IntPtr
        get_MailTo      : IntPtr
        put_MailTo      : IntPtr
        get_MailCc      : IntPtr
        put_MailCc      : IntPtr
        get_MailBcc     : IntPtr
        put_MailBcc     : IntPtr
        get_MailSubject : IntPtr
        put_MailSubject : IntPtr
        get_MessageText : IntPtr
        put_MessageText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmActionEmail.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    MailFrom {
        get => this.get_MailFrom()
        set => this.put_MailFrom(value)
    }

    /**
     * @type {BSTR} 
     */
    MailReplyTo {
        get => this.get_MailReplyTo()
        set => this.put_MailReplyTo(value)
    }

    /**
     * @type {BSTR} 
     */
    MailTo {
        get => this.get_MailTo()
        set => this.put_MailTo(value)
    }

    /**
     * @type {BSTR} 
     */
    MailCc {
        get => this.get_MailCc()
        set => this.put_MailCc(value)
    }

    /**
     * @type {BSTR} 
     */
    MailBcc {
        get => this.get_MailBcc()
        set => this.put_MailBcc(value)
    }

    /**
     * @type {BSTR} 
     */
    MailSubject {
        get => this.get_MailSubject()
        set => this.put_MailSubject(value)
    }

    /**
     * @type {BSTR} 
     */
    MessageText {
        get => this.get_MessageText()
        set => this.put_MessageText(value)
    }

    /**
     * Retrieves or sets the email address to use as the sender of the email when the action generates an email message. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailfrom
     */
    get_MailFrom() {
        mailFrom := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, mailFrom, "HRESULT")
        return mailFrom
    }

    /**
     * Retrieves or sets the email address to use as the sender of the email when the action generates an email message. (Put)
     * @param {BSTR} mailFrom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_mailfrom
     */
    put_MailFrom(mailFrom) {
        mailFrom := mailFrom is String ? BSTR.Alloc(mailFrom).Value : mailFrom

        result := ComCall(13, this, BSTR, mailFrom, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the email address to use as the reply-to address when the recipient of the email message replies. (Get)
     * @remarks
     * If the user specified  in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailto">MailTo</a> 
     *     property replies to the email message (for example, the user wants to request a quota increase), the reply is sent 
     *     to the user specified in the <b>MailReplyTo</b> 
     *     property. If <b>MailReplyTo</b> is not set, the 
     *     reply is sent to the user specified in the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailfrom">MailFrom</a> property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailreplyto
     */
    get_MailReplyTo() {
        mailReplyTo := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, mailReplyTo, "HRESULT")
        return mailReplyTo
    }

    /**
     * Retrieves or sets the email address to use as the reply-to address when the recipient of the email message replies. (Put)
     * @remarks
     * If the user specified  in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailto">MailTo</a> 
     *     property replies to the email message (for example, the user wants to request a quota increase), the reply is sent 
     *     to the user specified in the <b>MailReplyTo</b> 
     *     property. If <b>MailReplyTo</b> is not set, the 
     *     reply is sent to the user specified in the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailfrom">MailFrom</a> property.
     * @param {BSTR} mailReplyTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_mailreplyto
     */
    put_MailReplyTo(mailReplyTo) {
        mailReplyTo := mailReplyTo is String ? BSTR.Alloc(mailReplyTo).Value : mailReplyTo

        result := ComCall(15, this, BSTR, mailReplyTo, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the email address to which email is sent when this action generates email. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailto
     */
    get_MailTo() {
        mailTo := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, mailTo, "HRESULT")
        return mailTo
    }

    /**
     * Retrieves or sets the email address to which email is sent when this action generates email. (Put)
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_mailto
     */
    put_MailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(17, this, BSTR, mailTo, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the carbon copy (Cc) email address to which email is sent when this action generates email. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailcc
     */
    get_MailCc() {
        mailCc := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, mailCc, "HRESULT")
        return mailCc
    }

    /**
     * Retrieves or sets the carbon copy (Cc) email address to which email is sent when this action generates email. (Put)
     * @param {BSTR} mailCc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_mailcc
     */
    put_MailCc(mailCc) {
        mailCc := mailCc is String ? BSTR.Alloc(mailCc).Value : mailCc

        result := ComCall(19, this, BSTR, mailCc, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the blind carbon copy (Bcc) email address to which email is sent when this action generates email. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailbcc
     */
    get_MailBcc() {
        mailBcc := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, mailBcc, "HRESULT")
        return mailBcc
    }

    /**
     * Retrieves or sets the blind carbon copy (Bcc) email address to which email is sent when this action generates email. (Put)
     * @param {BSTR} mailBcc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_mailbcc
     */
    put_MailBcc(mailBcc) {
        mailBcc := mailBcc is String ? BSTR.Alloc(mailBcc).Value : mailBcc

        result := ComCall(21, this, BSTR, mailBcc, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the subject of the email that is sent when this action generates email. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailsubject
     */
    get_MailSubject() {
        mailSubject := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, mailSubject, "HRESULT")
        return mailSubject
    }

    /**
     * Retrieves or sets the subject of the email that is sent when this action generates email. (Put)
     * @param {BSTR} mailSubject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_mailsubject
     */
    put_MailSubject(mailSubject) {
        mailSubject := mailSubject is String ? BSTR.Alloc(mailSubject).Value : mailSubject

        result := ComCall(23, this, BSTR, mailSubject, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the message text of the email that is sent when this action generates email. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_messagetext
     */
    get_MessageText() {
        messageText := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, messageText, "HRESULT")
        return messageText
    }

    /**
     * Retrieves or sets the message text of the email that is sent when this action generates email. (Put)
     * @param {BSTR} messageText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_messagetext
     */
    put_MessageText(messageText) {
        messageText := messageText is String ? BSTR.Alloc(messageText).Value : messageText

        result := ComCall(25, this, BSTR, messageText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmActionEmail.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MailFrom := CallbackCreate(GetMethod(implObj, "get_MailFrom"), flags, 2)
        this.vtbl.put_MailFrom := CallbackCreate(GetMethod(implObj, "put_MailFrom"), flags, 2)
        this.vtbl.get_MailReplyTo := CallbackCreate(GetMethod(implObj, "get_MailReplyTo"), flags, 2)
        this.vtbl.put_MailReplyTo := CallbackCreate(GetMethod(implObj, "put_MailReplyTo"), flags, 2)
        this.vtbl.get_MailTo := CallbackCreate(GetMethod(implObj, "get_MailTo"), flags, 2)
        this.vtbl.put_MailTo := CallbackCreate(GetMethod(implObj, "put_MailTo"), flags, 2)
        this.vtbl.get_MailCc := CallbackCreate(GetMethod(implObj, "get_MailCc"), flags, 2)
        this.vtbl.put_MailCc := CallbackCreate(GetMethod(implObj, "put_MailCc"), flags, 2)
        this.vtbl.get_MailBcc := CallbackCreate(GetMethod(implObj, "get_MailBcc"), flags, 2)
        this.vtbl.put_MailBcc := CallbackCreate(GetMethod(implObj, "put_MailBcc"), flags, 2)
        this.vtbl.get_MailSubject := CallbackCreate(GetMethod(implObj, "get_MailSubject"), flags, 2)
        this.vtbl.put_MailSubject := CallbackCreate(GetMethod(implObj, "put_MailSubject"), flags, 2)
        this.vtbl.get_MessageText := CallbackCreate(GetMethod(implObj, "get_MessageText"), flags, 2)
        this.vtbl.put_MessageText := CallbackCreate(GetMethod(implObj, "put_MessageText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MailFrom)
        CallbackFree(this.vtbl.put_MailFrom)
        CallbackFree(this.vtbl.get_MailReplyTo)
        CallbackFree(this.vtbl.put_MailReplyTo)
        CallbackFree(this.vtbl.get_MailTo)
        CallbackFree(this.vtbl.put_MailTo)
        CallbackFree(this.vtbl.get_MailCc)
        CallbackFree(this.vtbl.put_MailCc)
        CallbackFree(this.vtbl.get_MailBcc)
        CallbackFree(this.vtbl.put_MailBcc)
        CallbackFree(this.vtbl.get_MailSubject)
        CallbackFree(this.vtbl.put_MailSubject)
        CallbackFree(this.vtbl.get_MessageText)
        CallbackFree(this.vtbl.put_MessageText)
    }
}
