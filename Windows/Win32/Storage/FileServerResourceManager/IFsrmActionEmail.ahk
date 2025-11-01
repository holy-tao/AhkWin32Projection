#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmAction.ahk

/**
 * Used to send an email message in response to a quota or file screen event.
 * @remarks
 * 
  * You must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailto">MailTo</a> and 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactionemail-get_messagetext">MessageText</a> properties; the other 
  *     properties are optional.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmactionemail
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
     * 
     * @param {Pointer<BSTR>} mailFrom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailfrom
     */
    get_MailFrom(mailFrom) {
        result := ComCall(12, this, "ptr", mailFrom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} mailFrom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_mailfrom
     */
    put_MailFrom(mailFrom) {
        mailFrom := mailFrom is String ? BSTR.Alloc(mailFrom).Value : mailFrom

        result := ComCall(13, this, "ptr", mailFrom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailReplyTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailreplyto
     */
    get_MailReplyTo(mailReplyTo) {
        result := ComCall(14, this, "ptr", mailReplyTo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} mailReplyTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_mailreplyto
     */
    put_MailReplyTo(mailReplyTo) {
        mailReplyTo := mailReplyTo is String ? BSTR.Alloc(mailReplyTo).Value : mailReplyTo

        result := ComCall(15, this, "ptr", mailReplyTo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailto
     */
    get_MailTo(mailTo) {
        result := ComCall(16, this, "ptr", mailTo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_mailto
     */
    put_MailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(17, this, "ptr", mailTo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailCc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailcc
     */
    get_MailCc(mailCc) {
        result := ComCall(18, this, "ptr", mailCc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} mailCc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_mailcc
     */
    put_MailCc(mailCc) {
        mailCc := mailCc is String ? BSTR.Alloc(mailCc).Value : mailCc

        result := ComCall(19, this, "ptr", mailCc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailBcc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailbcc
     */
    get_MailBcc(mailBcc) {
        result := ComCall(20, this, "ptr", mailBcc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} mailBcc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_mailbcc
     */
    put_MailBcc(mailBcc) {
        mailBcc := mailBcc is String ? BSTR.Alloc(mailBcc).Value : mailBcc

        result := ComCall(21, this, "ptr", mailBcc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailSubject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_mailsubject
     */
    get_MailSubject(mailSubject) {
        result := ComCall(22, this, "ptr", mailSubject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} mailSubject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_mailsubject
     */
    put_MailSubject(mailSubject) {
        mailSubject := mailSubject is String ? BSTR.Alloc(mailSubject).Value : mailSubject

        result := ComCall(23, this, "ptr", mailSubject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} messageText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-get_messagetext
     */
    get_MessageText(messageText) {
        result := ComCall(24, this, "ptr", messageText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} messageText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail-put_messagetext
     */
    put_MessageText(messageText) {
        messageText := messageText is String ? BSTR.Alloc(messageText).Value : messageText

        result := ComCall(25, this, "ptr", messageText, "HRESULT")
        return result
    }
}
