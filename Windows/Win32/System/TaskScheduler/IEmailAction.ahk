#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAction.ahk" { IAction }
#Import ".\ITaskNamedValueCollection.ahk" { ITaskNamedValueCollection }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Represents an action that sends an email message.
 * @remarks
 * The email action must have a valid value for the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_server">Server</a>, <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_from">From</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_to">To</a> or <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_cc">Cc</a> properties for the task to register and run correctly.
 * 
 * When reading or writing your own XML for a task, an email action is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-sendemail-actiongroup-element">SendEmail</a> element of the Task Scheduler schema.
 * 
 * <b>Windows 8 and Windows Server 2012:  </b>This interface has been removed. Please use IExecAction with the  powershell <a href="https://docs.microsoft.com/powershell/module/microsoft.powershell.utility/send-mailmessage">Send-MailMessage</a> cmdlet as a workaround.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-iemailaction
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IEmailAction extends IAction {
    /**
     * The interface identifier for IEmailAction
     * @type {Guid}
     */
    static IID := Guid("{10f62c64-7e16-4314-a0c2-0c3683f99d40}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEmailAction interfaces
    */
    struct Vtbl extends IAction.Vtbl {
        get_Server       : IntPtr
        put_Server       : IntPtr
        get_Subject      : IntPtr
        put_Subject      : IntPtr
        get_To           : IntPtr
        put_To           : IntPtr
        get_Cc           : IntPtr
        put_Cc           : IntPtr
        get_Bcc          : IntPtr
        put_Bcc          : IntPtr
        get_ReplyTo      : IntPtr
        put_ReplyTo      : IntPtr
        get_From         : IntPtr
        put_From         : IntPtr
        get_HeaderFields : IntPtr
        put_HeaderFields : IntPtr
        get_Body         : IntPtr
        put_Body         : IntPtr
        get_Attachments  : IntPtr
        put_Attachments  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEmailAction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Server {
        get => this.get_Server()
        set => this.put_Server(value)
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
    To {
        get => this.get_To()
        set => this.put_To(value)
    }

    /**
     * @type {BSTR} 
     */
    Cc {
        get => this.get_Cc()
        set => this.put_Cc(value)
    }

    /**
     * @type {BSTR} 
     */
    Bcc {
        get => this.get_Bcc()
        set => this.put_Bcc(value)
    }

    /**
     * @type {BSTR} 
     */
    ReplyTo {
        get => this.get_ReplyTo()
        set => this.put_ReplyTo(value)
    }

    /**
     * @type {BSTR} 
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
     * @type {BSTR} 
     */
    Body {
        get => this.get_Body()
        set => this.put_Body(value)
    }

    /**
     * @type {SAFEARRAY} 
     */
    Attachments {
        get => this.get_Attachments()
        set => this.put_Attachments(value)
    }

    /**
     * Gets or sets the name of the SMTP server that you use to send email from. (Get)
     * @remarks
     * Make sure the SMTP server that sends the email is setup correctly. E-mail is sent using NTLM authentication for Windows SMTP servers, which means that the security credentials used for running the task must also have privileges on the SMTP server to send email message. If the SMTP server is a non-Windows based server, then the email will be sent if the server allows anonymous access.  For information about setting up the SMTP server, see <a href="https://www.microsoft.com/technet/prodtechnol/WindowsServer2003/Library/IIS/e4cf06f5-9a36-474b-ba78-3f287a2b88f2.mspx?mfr=true">SMTP Server Setup</a>, and for information about managing SMTP server settings, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc758258(v=ws.10)">SMTP Administration</a>.
     * @param {Pointer<BSTR>} pServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_server
     */
    get_Server(pServer) {
        result := ComCall(10, this, BSTR.Ptr, pServer, "HRESULT")
        return result
    }

    /**
     * Gets or sets the name of the SMTP server that you use to send email from. (Put)
     * @remarks
     * Make sure the SMTP server that sends the email is setup correctly. E-mail is sent using NTLM authentication for Windows SMTP servers, which means that the security credentials used for running the task must also have privileges on the SMTP server to send email message. If the SMTP server is a non-Windows based server, then the email will be sent if the server allows anonymous access.  For information about setting up the SMTP server, see <a href="https://www.microsoft.com/technet/prodtechnol/WindowsServer2003/Library/IIS/e4cf06f5-9a36-474b-ba78-3f287a2b88f2.mspx?mfr=true">SMTP Server Setup</a>, and for information about managing SMTP server settings, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc758258(v=ws.10)">SMTP Administration</a>.
     * @param {BSTR} server 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_server
     */
    put_Server(server) {
        server := server is String ? BSTR.Alloc(server).Value : server

        result := ComCall(11, this, BSTR, server, "HRESULT")
        return result
    }

    /**
     * Gets or sets the subject of the email message. (Get)
     * @remarks
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {Pointer<BSTR>} pSubject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_subject
     */
    get_Subject(pSubject) {
        result := ComCall(12, this, BSTR.Ptr, pSubject, "HRESULT")
        return result
    }

    /**
     * Gets or sets the subject of the email message. (Put)
     * @remarks
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {BSTR} subject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_subject
     */
    put_Subject(subject) {
        subject := subject is String ? BSTR.Alloc(subject).Value : subject

        result := ComCall(13, this, BSTR, subject, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address or addresses that you want to send the email to. (Get)
     * @param {Pointer<BSTR>} pTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_to
     */
    get_To(pTo) {
        result := ComCall(14, this, BSTR.Ptr, pTo, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address or addresses that you want to send the email to. (Put)
     * @param {BSTR} to 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_to
     */
    put_To(to) {
        to := to is String ? BSTR.Alloc(to).Value : to

        result := ComCall(15, this, BSTR, to, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address or addresses that you want to Cc in the email message. (Get)
     * @param {Pointer<BSTR>} pCc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_cc
     */
    get_Cc(pCc) {
        result := ComCall(16, this, BSTR.Ptr, pCc, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address or addresses that you want to Cc in the email message. (Put)
     * @param {BSTR} cc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_cc
     */
    put_Cc(cc) {
        cc := cc is String ? BSTR.Alloc(cc).Value : cc

        result := ComCall(17, this, BSTR, cc, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address or addresses that you want to Bcc in the email message. (Get)
     * @param {Pointer<BSTR>} pBcc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_bcc
     */
    get_Bcc(pBcc) {
        result := ComCall(18, this, BSTR.Ptr, pBcc, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address or addresses that you want to Bcc in the email message. (Put)
     * @param {BSTR} bcc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_bcc
     */
    put_Bcc(bcc) {
        bcc := bcc is String ? BSTR.Alloc(bcc).Value : bcc

        result := ComCall(19, this, BSTR, bcc, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address that you want to reply to. (Get)
     * @param {Pointer<BSTR>} pReplyTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_replyto
     */
    get_ReplyTo(pReplyTo) {
        result := ComCall(20, this, BSTR.Ptr, pReplyTo, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address that you want to reply to. (Put)
     * @param {BSTR} replyTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_replyto
     */
    put_ReplyTo(replyTo) {
        replyTo := replyTo is String ? BSTR.Alloc(replyTo).Value : replyTo

        result := ComCall(21, this, BSTR, replyTo, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address that you want to send the email from. (Get)
     * @param {Pointer<BSTR>} pFrom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_from
     */
    get_From(pFrom) {
        result := ComCall(22, this, BSTR.Ptr, pFrom, "HRESULT")
        return result
    }

    /**
     * Gets or sets the email address that you want to send the email from. (Put)
     * @param {BSTR} from 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_from
     */
    put_From(from) {
        from := from is String ? BSTR.Alloc(from).Value : from

        result := ComCall(23, this, BSTR, from, "HRESULT")
        return result
    }

    /**
     * Gets or sets the header information in the email message to send. (Get)
     * @returns {ITaskNamedValueCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_headerfields
     */
    get_HeaderFields() {
        result := ComCall(24, this, "ptr*", &ppHeaderFields := 0, "HRESULT")
        return ITaskNamedValueCollection(ppHeaderFields)
    }

    /**
     * Gets or sets the header information in the email message to send. (Put)
     * @param {ITaskNamedValueCollection} pHeaderFields 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_headerfields
     */
    put_HeaderFields(pHeaderFields) {
        result := ComCall(25, this, "ptr", pHeaderFields, "HRESULT")
        return result
    }

    /**
     * Gets or sets the body of the email that contains the email message. (Get)
     * @remarks
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {Pointer<BSTR>} pBody 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_body
     */
    get_Body(pBody) {
        result := ComCall(26, this, BSTR.Ptr, pBody, "HRESULT")
        return result
    }

    /**
     * Gets or sets the body of the email that contains the email message. (Put)
     * @remarks
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {BSTR} body 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_body
     */
    put_Body(body) {
        body := body is String ? BSTR.Alloc(body).Value : body

        result := ComCall(27, this, BSTR, body, "HRESULT")
        return result
    }

    /**
     * Gets or sets the pointer to an array of attachments that is sent with the email message. (Get)
     * @remarks
     * A maximum of eight attachments can be in the array of attachments.
     * @param {Pointer<Pointer<SAFEARRAY>>} pAttachements 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-get_attachments
     */
    get_Attachments(pAttachements) {
        pAttachementsMarshal := pAttachements is VarRef ? "ptr*" : "ptr"

        result := ComCall(28, this, pAttachementsMarshal, pAttachements, "HRESULT")
        return result
    }

    /**
     * Gets or sets the pointer to an array of attachments that is sent with the email message. (Put)
     * @remarks
     * A maximum of eight attachments can be in the array of attachments.
     * @param {Pointer<SAFEARRAY>} pAttachements 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iemailaction-put_attachments
     */
    put_Attachments(pAttachements) {
        result := ComCall(29, this, SAFEARRAY.Ptr, pAttachements, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEmailAction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Server := CallbackCreate(GetMethod(implObj, "get_Server"), flags, 2)
        this.vtbl.put_Server := CallbackCreate(GetMethod(implObj, "put_Server"), flags, 2)
        this.vtbl.get_Subject := CallbackCreate(GetMethod(implObj, "get_Subject"), flags, 2)
        this.vtbl.put_Subject := CallbackCreate(GetMethod(implObj, "put_Subject"), flags, 2)
        this.vtbl.get_To := CallbackCreate(GetMethod(implObj, "get_To"), flags, 2)
        this.vtbl.put_To := CallbackCreate(GetMethod(implObj, "put_To"), flags, 2)
        this.vtbl.get_Cc := CallbackCreate(GetMethod(implObj, "get_Cc"), flags, 2)
        this.vtbl.put_Cc := CallbackCreate(GetMethod(implObj, "put_Cc"), flags, 2)
        this.vtbl.get_Bcc := CallbackCreate(GetMethod(implObj, "get_Bcc"), flags, 2)
        this.vtbl.put_Bcc := CallbackCreate(GetMethod(implObj, "put_Bcc"), flags, 2)
        this.vtbl.get_ReplyTo := CallbackCreate(GetMethod(implObj, "get_ReplyTo"), flags, 2)
        this.vtbl.put_ReplyTo := CallbackCreate(GetMethod(implObj, "put_ReplyTo"), flags, 2)
        this.vtbl.get_From := CallbackCreate(GetMethod(implObj, "get_From"), flags, 2)
        this.vtbl.put_From := CallbackCreate(GetMethod(implObj, "put_From"), flags, 2)
        this.vtbl.get_HeaderFields := CallbackCreate(GetMethod(implObj, "get_HeaderFields"), flags, 2)
        this.vtbl.put_HeaderFields := CallbackCreate(GetMethod(implObj, "put_HeaderFields"), flags, 2)
        this.vtbl.get_Body := CallbackCreate(GetMethod(implObj, "get_Body"), flags, 2)
        this.vtbl.put_Body := CallbackCreate(GetMethod(implObj, "put_Body"), flags, 2)
        this.vtbl.get_Attachments := CallbackCreate(GetMethod(implObj, "get_Attachments"), flags, 2)
        this.vtbl.put_Attachments := CallbackCreate(GetMethod(implObj, "put_Attachments"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Server)
        CallbackFree(this.vtbl.put_Server)
        CallbackFree(this.vtbl.get_Subject)
        CallbackFree(this.vtbl.put_Subject)
        CallbackFree(this.vtbl.get_To)
        CallbackFree(this.vtbl.put_To)
        CallbackFree(this.vtbl.get_Cc)
        CallbackFree(this.vtbl.put_Cc)
        CallbackFree(this.vtbl.get_Bcc)
        CallbackFree(this.vtbl.put_Bcc)
        CallbackFree(this.vtbl.get_ReplyTo)
        CallbackFree(this.vtbl.put_ReplyTo)
        CallbackFree(this.vtbl.get_From)
        CallbackFree(this.vtbl.put_From)
        CallbackFree(this.vtbl.get_HeaderFields)
        CallbackFree(this.vtbl.put_HeaderFields)
        CallbackFree(this.vtbl.get_Body)
        CallbackFree(this.vtbl.put_Body)
        CallbackFree(this.vtbl.get_Attachments)
        CallbackFree(this.vtbl.put_Attachments)
    }
}
