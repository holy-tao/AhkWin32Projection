#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmAction.ahk

/**
 * Used to send an email message in response to a quota or file screen event.
 * @remarks
 * You must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailto">MailTo</a> and 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactionemail-get_messagetext">MessageText</a> properties; the other 
 *     properties are optional.
 * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nn-fsrm-ifsrmactionemail
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmActionEmail extends IFsrmAction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmActionEmail
     * @type {Guid}
     */
    static IID => Guid("{d646567d-26ae-4caa-9f84-4e0aad207fca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MailFrom", "put_MailFrom", "get_MailReplyTo", "put_MailReplyTo", "get_MailTo", "put_MailTo", "get_MailCc", "put_MailCc", "get_MailBcc", "put_MailBcc", "get_MailSubject", "put_MailSubject", "get_MessageText", "put_MessageText"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-get_mailfrom
     */
    get_MailFrom() {
        mailFrom := BSTR()
        result := ComCall(12, this, "ptr", mailFrom, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return mailFrom
    }

    /**
     * Retrieves or sets the email address to use as the sender of the email when the action generates an email message. (Put)
     * @param {BSTR} mailFrom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-put_mailfrom
     */
    put_MailFrom(mailFrom) {
        if(mailFrom is String) {
            pin := BSTR.Alloc(mailFrom)
            mailFrom := pin.Value
        }

        result := ComCall(13, this, "ptr", mailFrom, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-get_mailreplyto
     */
    get_MailReplyTo() {
        mailReplyTo := BSTR()
        result := ComCall(14, this, "ptr", mailReplyTo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-put_mailreplyto
     */
    put_MailReplyTo(mailReplyTo) {
        if(mailReplyTo is String) {
            pin := BSTR.Alloc(mailReplyTo)
            mailReplyTo := pin.Value
        }

        result := ComCall(15, this, "ptr", mailReplyTo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets the email address to which email is sent when this action generates email. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-get_mailto
     */
    get_MailTo() {
        mailTo := BSTR()
        result := ComCall(16, this, "ptr", mailTo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return mailTo
    }

    /**
     * Retrieves or sets the email address to which email is sent when this action generates email. (Put)
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-put_mailto
     */
    put_MailTo(mailTo) {
        if(mailTo is String) {
            pin := BSTR.Alloc(mailTo)
            mailTo := pin.Value
        }

        result := ComCall(17, this, "ptr", mailTo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets the carbon copy (Cc) email address to which email is sent when this action generates email. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-get_mailcc
     */
    get_MailCc() {
        mailCc := BSTR()
        result := ComCall(18, this, "ptr", mailCc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return mailCc
    }

    /**
     * Retrieves or sets the carbon copy (Cc) email address to which email is sent when this action generates email. (Put)
     * @param {BSTR} mailCc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-put_mailcc
     */
    put_MailCc(mailCc) {
        if(mailCc is String) {
            pin := BSTR.Alloc(mailCc)
            mailCc := pin.Value
        }

        result := ComCall(19, this, "ptr", mailCc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets the blind carbon copy (Bcc) email address to which email is sent when this action generates email. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-get_mailbcc
     */
    get_MailBcc() {
        mailBcc := BSTR()
        result := ComCall(20, this, "ptr", mailBcc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return mailBcc
    }

    /**
     * Retrieves or sets the blind carbon copy (Bcc) email address to which email is sent when this action generates email. (Put)
     * @param {BSTR} mailBcc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-put_mailbcc
     */
    put_MailBcc(mailBcc) {
        if(mailBcc is String) {
            pin := BSTR.Alloc(mailBcc)
            mailBcc := pin.Value
        }

        result := ComCall(21, this, "ptr", mailBcc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets the subject of the email that is sent when this action generates email. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-get_mailsubject
     */
    get_MailSubject() {
        mailSubject := BSTR()
        result := ComCall(22, this, "ptr", mailSubject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return mailSubject
    }

    /**
     * Retrieves or sets the subject of the email that is sent when this action generates email. (Put)
     * @param {BSTR} mailSubject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-put_mailsubject
     */
    put_MailSubject(mailSubject) {
        if(mailSubject is String) {
            pin := BSTR.Alloc(mailSubject)
            mailSubject := pin.Value
        }

        result := ComCall(23, this, "ptr", mailSubject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets the message text of the email that is sent when this action generates email. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-get_messagetext
     */
    get_MessageText() {
        messageText := BSTR()
        result := ComCall(24, this, "ptr", messageText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return messageText
    }

    /**
     * Retrieves or sets the message text of the email that is sent when this action generates email. (Put)
     * @param {BSTR} messageText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactionemail-put_messagetext
     */
    put_MessageText(messageText) {
        if(messageText is String) {
            pin := BSTR.Alloc(messageText)
            messageText := pin.Value
        }

        result := ComCall(25, this, "ptr", messageText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
