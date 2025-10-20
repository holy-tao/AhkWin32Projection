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
     * 
     * @param {Pointer<BSTR>} mailFrom 
     * @returns {HRESULT} 
     */
    get_MailFrom(mailFrom) {
        result := ComCall(12, this, "ptr", mailFrom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} mailFrom 
     * @returns {HRESULT} 
     */
    put_MailFrom(mailFrom) {
        mailFrom := mailFrom is String ? BSTR.Alloc(mailFrom).Value : mailFrom

        result := ComCall(13, this, "ptr", mailFrom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailReplyTo 
     * @returns {HRESULT} 
     */
    get_MailReplyTo(mailReplyTo) {
        result := ComCall(14, this, "ptr", mailReplyTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} mailReplyTo 
     * @returns {HRESULT} 
     */
    put_MailReplyTo(mailReplyTo) {
        mailReplyTo := mailReplyTo is String ? BSTR.Alloc(mailReplyTo).Value : mailReplyTo

        result := ComCall(15, this, "ptr", mailReplyTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailTo 
     * @returns {HRESULT} 
     */
    get_MailTo(mailTo) {
        result := ComCall(16, this, "ptr", mailTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     */
    put_MailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(17, this, "ptr", mailTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailCc 
     * @returns {HRESULT} 
     */
    get_MailCc(mailCc) {
        result := ComCall(18, this, "ptr", mailCc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} mailCc 
     * @returns {HRESULT} 
     */
    put_MailCc(mailCc) {
        mailCc := mailCc is String ? BSTR.Alloc(mailCc).Value : mailCc

        result := ComCall(19, this, "ptr", mailCc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailBcc 
     * @returns {HRESULT} 
     */
    get_MailBcc(mailBcc) {
        result := ComCall(20, this, "ptr", mailBcc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} mailBcc 
     * @returns {HRESULT} 
     */
    put_MailBcc(mailBcc) {
        mailBcc := mailBcc is String ? BSTR.Alloc(mailBcc).Value : mailBcc

        result := ComCall(21, this, "ptr", mailBcc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailSubject 
     * @returns {HRESULT} 
     */
    get_MailSubject(mailSubject) {
        result := ComCall(22, this, "ptr", mailSubject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} mailSubject 
     * @returns {HRESULT} 
     */
    put_MailSubject(mailSubject) {
        mailSubject := mailSubject is String ? BSTR.Alloc(mailSubject).Value : mailSubject

        result := ComCall(23, this, "ptr", mailSubject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} messageText 
     * @returns {HRESULT} 
     */
    get_MessageText(messageText) {
        result := ComCall(24, this, "ptr", messageText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} messageText 
     * @returns {HRESULT} 
     */
    put_MessageText(messageText) {
        messageText := messageText is String ? BSTR.Alloc(messageText).Value : messageText

        result := ComCall(25, this, "ptr", messageText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
