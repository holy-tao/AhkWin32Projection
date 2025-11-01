#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAction.ahk

/**
 * Represents an action that sends an email message.
 * @remarks
 * 
  * The email action must have a valid value for the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_server">Server</a>, <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_from">From</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_to">To</a> or <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_cc">Cc</a> properties for the task to register and run correctly.
  * 
  * When reading or writing your own XML for a task, an email action is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-sendemail-actiongroup-element">SendEmail</a> element of the Task Scheduler schema.
  * 
  * <b>Windows 8 and Windows Server 2012:  </b>This interface has been removed. Please use IExecAction with the  powershell <a href="https://docs.microsoft.com/powershell/module/microsoft.powershell.utility/send-mailmessage">Send-MailMessage</a> cmdlet as a workaround.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iemailaction
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IEmailAction extends IAction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailAction
     * @type {Guid}
     */
    static IID => Guid("{10f62c64-7e16-4314-a0c2-0c3683f99d40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Server", "put_Server", "get_Subject", "put_Subject", "get_To", "put_To", "get_Cc", "put_Cc", "get_Bcc", "put_Bcc", "get_ReplyTo", "put_ReplyTo", "get_From", "put_From", "get_HeaderFields", "put_HeaderFields", "get_Body", "put_Body", "get_Attachments", "put_Attachments"]

    /**
     * 
     * @param {Pointer<BSTR>} pServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_server
     */
    get_Server(pServer) {
        result := ComCall(10, this, "ptr", pServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} server 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_server
     */
    put_Server(server) {
        server := server is String ? BSTR.Alloc(server).Value : server

        result := ComCall(11, this, "ptr", server, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pSubject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_subject
     */
    get_Subject(pSubject) {
        result := ComCall(12, this, "ptr", pSubject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} subject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_subject
     */
    put_Subject(subject) {
        subject := subject is String ? BSTR.Alloc(subject).Value : subject

        result := ComCall(13, this, "ptr", subject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_to
     */
    get_To(pTo) {
        result := ComCall(14, this, "ptr", pTo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} to 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_to
     */
    put_To(to) {
        to := to is String ? BSTR.Alloc(to).Value : to

        result := ComCall(15, this, "ptr", to, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pCc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_cc
     */
    get_Cc(pCc) {
        result := ComCall(16, this, "ptr", pCc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_cc
     */
    put_Cc(cc) {
        cc := cc is String ? BSTR.Alloc(cc).Value : cc

        result := ComCall(17, this, "ptr", cc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBcc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_bcc
     */
    get_Bcc(pBcc) {
        result := ComCall(18, this, "ptr", pBcc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bcc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_bcc
     */
    put_Bcc(bcc) {
        bcc := bcc is String ? BSTR.Alloc(bcc).Value : bcc

        result := ComCall(19, this, "ptr", bcc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pReplyTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_replyto
     */
    get_ReplyTo(pReplyTo) {
        result := ComCall(20, this, "ptr", pReplyTo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} replyTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_replyto
     */
    put_ReplyTo(replyTo) {
        replyTo := replyTo is String ? BSTR.Alloc(replyTo).Value : replyTo

        result := ComCall(21, this, "ptr", replyTo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pFrom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_from
     */
    get_From(pFrom) {
        result := ComCall(22, this, "ptr", pFrom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} from 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_from
     */
    put_From(from) {
        from := from is String ? BSTR.Alloc(from).Value : from

        result := ComCall(23, this, "ptr", from, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITaskNamedValueCollection>} ppHeaderFields 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_headerfields
     */
    get_HeaderFields(ppHeaderFields) {
        result := ComCall(24, this, "ptr*", ppHeaderFields, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITaskNamedValueCollection} pHeaderFields 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_headerfields
     */
    put_HeaderFields(pHeaderFields) {
        result := ComCall(25, this, "ptr", pHeaderFields, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBody 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_body
     */
    get_Body(pBody) {
        result := ComCall(26, this, "ptr", pBody, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} body 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_body
     */
    put_Body(body) {
        body := body is String ? BSTR.Alloc(body).Value : body

        result := ComCall(27, this, "ptr", body, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pAttachements 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_attachments
     */
    get_Attachments(pAttachements) {
        result := ComCall(28, this, "ptr*", pAttachements, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pAttachements 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_attachments
     */
    put_Attachments(pAttachements) {
        result := ComCall(29, this, "ptr", pAttachements, "HRESULT")
        return result
    }
}
