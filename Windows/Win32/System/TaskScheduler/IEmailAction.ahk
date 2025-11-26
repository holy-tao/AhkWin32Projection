#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITaskNamedValueCollection.ahk
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
     */
    Server {
        get => this.get_Server()
        set => this.put_Server(value)
    }

    /**
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     */
    To {
        get => this.get_To()
        set => this.put_To(value)
    }

    /**
     */
    Cc {
        get => this.get_Cc()
        set => this.put_Cc(value)
    }

    /**
     */
    Bcc {
        get => this.get_Bcc()
        set => this.put_Bcc(value)
    }

    /**
     */
    ReplyTo {
        get => this.get_ReplyTo()
        set => this.put_ReplyTo(value)
    }

    /**
     */
    From {
        get => this.get_From()
        set => this.put_From(value)
    }

    /**
     * @type {ITaskNamedValueCollection} 
     */
    HeaderFields {
        get => this.get_HeaderFields()
        set => this.put_HeaderFields(value)
    }

    /**
     */
    Body {
        get => this.get_Body()
        set => this.put_Body(value)
    }

    /**
     */
    Attachments {
        get => this.get_Attachments()
        set => this.put_Attachments(value)
    }

    /**
     * Gets or sets the name of the SMTP server that you use to send email from.
     * @remarks
     * 
     * Make sure the SMTP server that sends the email is setup correctly. E-mail is sent using NTLM authentication for Windows SMTP servers, which means that the security credentials used for running the task must also have privileges on the SMTP server to send email message. If the SMTP server is a non-Windows based server, then the email will be sent if the server allows anonymous access.  For information about setting up the SMTP server, see <a href="https://www.microsoft.com/technet/prodtechnol/WindowsServer2003/Library/IIS/e4cf06f5-9a36-474b-ba78-3f287a2b88f2.mspx?mfr=true">SMTP Server Setup</a>, and for information about managing SMTP server settings, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc758258(v=ws.10)">SMTP Administration</a>.
     * 
     * 
     * @param {Pointer<BSTR>} pServer 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-get_server
     */
    get_Server(pServer) {
        result := ComCall(10, this, "ptr", pServer, "HRESULT")
        return result
    }

    /**
     * Gets or sets the name of the SMTP server that you use to send email from.
     * @remarks
     * 
     * Make sure the SMTP server that sends the email is setup correctly. E-mail is sent using NTLM authentication for Windows SMTP servers, which means that the security credentials used for running the task must also have privileges on the SMTP server to send email message. If the SMTP server is a non-Windows based server, then the email will be sent if the server allows anonymous access.  For information about setting up the SMTP server, see <a href="https://www.microsoft.com/technet/prodtechnol/WindowsServer2003/Library/IIS/e4cf06f5-9a36-474b-ba78-3f287a2b88f2.mspx?mfr=true">SMTP Server Setup</a>, and for information about managing SMTP server settings, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc758258(v=ws.10)">SMTP Administration</a>.
     * 
     * 
     * @param {BSTR} server 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-put_server
     */
    put_Server(server) {
        server := server is String ? BSTR.Alloc(server).Value : server

        result := ComCall(11, this, "ptr", server, "HRESULT")
        return result
    }

    /**
     * Gets or sets the subject of the email message.
     * @remarks
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {Pointer<BSTR>} pSubject 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-get_subject
     */
    get_Subject(pSubject) {
        result := ComCall(12, this, "ptr", pSubject, "HRESULT")
        return result
    }

    /**
     * Gets or sets the subject of the email message.
     * @remarks
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {BSTR} subject 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-put_subject
     */
    put_Subject(subject) {
        subject := subject is String ? BSTR.Alloc(subject).Value : subject

        result := ComCall(13, this, "ptr", subject, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address or addresses that you want to send the email to.
     * @param {Pointer<BSTR>} pTo 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-get_to
     */
    get_To(pTo) {
        result := ComCall(14, this, "ptr", pTo, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address or addresses that you want to send the email to.
     * @param {BSTR} to 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-put_to
     */
    put_To(to) {
        to := to is String ? BSTR.Alloc(to).Value : to

        result := ComCall(15, this, "ptr", to, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address or addresses that you want to Cc in the email message.
     * @param {Pointer<BSTR>} pCc 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-get_cc
     */
    get_Cc(pCc) {
        result := ComCall(16, this, "ptr", pCc, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address or addresses that you want to Cc in the email message.
     * @param {BSTR} cc 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-put_cc
     */
    put_Cc(cc) {
        cc := cc is String ? BSTR.Alloc(cc).Value : cc

        result := ComCall(17, this, "ptr", cc, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address or addresses that you want to Bcc in the email message.
     * @param {Pointer<BSTR>} pBcc 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-get_bcc
     */
    get_Bcc(pBcc) {
        result := ComCall(18, this, "ptr", pBcc, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address or addresses that you want to Bcc in the email message.
     * @param {BSTR} bcc 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-put_bcc
     */
    put_Bcc(bcc) {
        bcc := bcc is String ? BSTR.Alloc(bcc).Value : bcc

        result := ComCall(19, this, "ptr", bcc, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address that you want to reply to.
     * @param {Pointer<BSTR>} pReplyTo 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-get_replyto
     */
    get_ReplyTo(pReplyTo) {
        result := ComCall(20, this, "ptr", pReplyTo, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address that you want to reply to.
     * @param {BSTR} replyTo 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-put_replyto
     */
    put_ReplyTo(replyTo) {
        replyTo := replyTo is String ? BSTR.Alloc(replyTo).Value : replyTo

        result := ComCall(21, this, "ptr", replyTo, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address that you want to send the email from.
     * @param {Pointer<BSTR>} pFrom 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-get_from
     */
    get_From(pFrom) {
        result := ComCall(22, this, "ptr", pFrom, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address that you want to send the email from.
     * @param {BSTR} from 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-put_from
     */
    put_From(from) {
        from := from is String ? BSTR.Alloc(from).Value : from

        result := ComCall(23, this, "ptr", from, "HRESULT")
        return result
    }

    /**
     * Gets or sets the header information in the email message to send.
     * @returns {ITaskNamedValueCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-get_headerfields
     */
    get_HeaderFields() {
        result := ComCall(24, this, "ptr*", &ppHeaderFields := 0, "HRESULT")
        return ITaskNamedValueCollection(ppHeaderFields)
    }

    /**
     * Gets or sets the header information in the email message to send.
     * @param {ITaskNamedValueCollection} pHeaderFields 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-put_headerfields
     */
    put_HeaderFields(pHeaderFields) {
        result := ComCall(25, this, "ptr", pHeaderFields, "HRESULT")
        return result
    }

    /**
     * Gets or sets the body of the email that contains the email message.
     * @remarks
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {Pointer<BSTR>} pBody 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-get_body
     */
    get_Body(pBody) {
        result := ComCall(26, this, "ptr", pBody, "HRESULT")
        return result
    }

    /**
     * Gets or sets the body of the email that contains the email message.
     * @remarks
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {BSTR} body 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-put_body
     */
    put_Body(body) {
        body := body is String ? BSTR.Alloc(body).Value : body

        result := ComCall(27, this, "ptr", body, "HRESULT")
        return result
    }

    /**
     * Gets or sets the pointer to an array of attachments that is sent with the email message.
     * @remarks
     * 
     * A maximum of eight attachments can be in the array of attachments.
     * 
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pAttachements 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-get_attachments
     */
    get_Attachments(pAttachements) {
        pAttachementsMarshal := pAttachements is VarRef ? "ptr*" : "ptr"

        result := ComCall(28, this, pAttachementsMarshal, pAttachements, "HRESULT")
        return result
    }

    /**
     * Gets or sets the pointer to an array of attachments that is sent with the email message.
     * @remarks
     * 
     * A maximum of eight attachments can be in the array of attachments.
     * 
     * 
     * @param {Pointer<SAFEARRAY>} pAttachements 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iemailaction-put_attachments
     */
    put_Attachments(pAttachements) {
        result := ComCall(29, this, "ptr", pAttachements, "HRESULT")
        return result
    }
}
