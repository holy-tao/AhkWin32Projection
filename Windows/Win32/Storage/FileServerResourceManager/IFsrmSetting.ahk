#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\FsrmActionType.ahk" { FsrmActionType }

/**
 * Used to configure FSRM.
 * @remarks
 * To create this object from a script, use the program identifier, "Fsrm.FsrmSetting".
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmsetting
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmSetting extends IDispatch {
    /**
     * The interface identifier for IFsrmSetting
     * @type {Guid}
     */
    static IID := Guid("{f411d4fd-14be-4260-8c40-03b7c95e608a}")

    /**
     * The class identifier for FsrmSetting
     * @type {Guid}
     */
    static CLSID := Guid("{f556d708-6d4d-4594-9c61-7dbb0dae2a46}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmSetting interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_SmtpServer            : IntPtr
        put_SmtpServer            : IntPtr
        get_MailFrom              : IntPtr
        put_MailFrom              : IntPtr
        get_AdminEmail            : IntPtr
        put_AdminEmail            : IntPtr
        get_DisableCommandLine    : IntPtr
        put_DisableCommandLine    : IntPtr
        get_EnableScreeningAudit  : IntPtr
        put_EnableScreeningAudit  : IntPtr
        EmailTest                 : IntPtr
        SetActionRunLimitInterval : IntPtr
        GetActionRunLimitInterval : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmSetting.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    SmtpServer {
        get => this.get_SmtpServer()
        set => this.put_SmtpServer(value)
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
    AdminEmail {
        get => this.get_AdminEmail()
        set => this.put_AdminEmail(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DisableCommandLine {
        get => this.get_DisableCommandLine()
        set => this.put_DisableCommandLine(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EnableScreeningAudit {
        get => this.get_EnableScreeningAudit()
        set => this.put_EnableScreeningAudit(value)
    }

    /**
     * Retrieves or sets the SMTP server that FSRM uses to send email. (Get)
     * @remarks
     * This property must be set in order for FSRM to send email. To verify settings, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-emailtest">IFsrmSetting::EmailTest</a> method.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-get_smtpserver
     */
    get_SmtpServer() {
        smtpServer := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, smtpServer, "HRESULT")
        return smtpServer
    }

    /**
     * Retrieves or sets the SMTP server that FSRM uses to send email. (Put)
     * @remarks
     * This property must be set in order for FSRM to send email. To verify settings, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-emailtest">IFsrmSetting::EmailTest</a> method.
     * @param {BSTR} smtpServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-put_smtpserver
     */
    put_SmtpServer(smtpServer) {
        smtpServer := smtpServer is String ? BSTR.Alloc(smtpServer).Value : smtpServer

        result := ComCall(8, this, BSTR, smtpServer, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the default email address from which email messages are sent. (Get)
     * @remarks
     * The default is" FSRM@<i>local machine name</i>". You cannot set this to 
     *     "[Admin Email]".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-get_mailfrom
     */
    get_MailFrom() {
        mailFrom := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, mailFrom, "HRESULT")
        return mailFrom
    }

    /**
     * Retrieves or sets the default email address from which email messages are sent. (Put)
     * @remarks
     * The default is" FSRM@<i>local machine name</i>". You cannot set this to 
     *     "[Admin Email]".
     * @param {BSTR} mailFrom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-put_mailfrom
     */
    put_MailFrom(mailFrom) {
        mailFrom := mailFrom is String ? BSTR.Alloc(mailFrom).Value : mailFrom

        result := ComCall(10, this, BSTR, mailFrom, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the email address for the administrator. (Get)
     * @remarks
     * The address is used if a configured email address contains the string "[Admin Email]".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-get_adminemail
     */
    get_AdminEmail() {
        adminEmail := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, adminEmail, "HRESULT")
        return adminEmail
    }

    /**
     * Retrieves or sets the email address for the administrator. (Put)
     * @remarks
     * The address is used if a configured email address contains the string "[Admin Email]".
     * @param {BSTR} adminEmail 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-put_adminemail
     */
    put_AdminEmail(adminEmail) {
        adminEmail := adminEmail is String ? BSTR.Alloc(adminEmail).Value : adminEmail

        result := ComCall(12, this, BSTR, adminEmail, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that determines whether FSRM prevents command line actions from running. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-get_disablecommandline
     */
    get_DisableCommandLine() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &disableCommandLine := 0, "HRESULT")
        return disableCommandLine
    }

    /**
     * Retrieves or sets a value that determines whether FSRM prevents command line actions from running. (Put)
     * @param {VARIANT_BOOL} disableCommandLine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-put_disablecommandline
     */
    put_DisableCommandLine(disableCommandLine) {
        result := ComCall(14, this, VARIANT_BOOL, disableCommandLine, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that determines whether FSRM keeps audit records of the file screen violations. (Get)
     * @remarks
     * The records are included in a File Screen Audit report. An audit record contains the following items:
     * 
     * <ul>
     * <li>Folder path</li>
     * <li>Id</li>
     * <li>Blocked file group name</li>
     * <li>File screen mode</li>
     * <li>Time stamp of when the violation occurred</li>
     * <li>The name of the process image that generated the prohibited IO, if available</li>
     * <li>The SID of the user principal that issued the prohibited IO, if available</li>
     * <li>The full path of the prohibited file</li>
     * <li>The server name</li>
     * </ul>
     * If this property is false and a report specifies the 
     *     <b>FsrmReportType_FileScreenAudit</b> report type, the report will succeed but will not 
     *     contain any audit information (or will contain audits that were done before auditing was disabled).
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-get_enablescreeningaudit
     */
    get_EnableScreeningAudit() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &enableScreeningAudit := 0, "HRESULT")
        return enableScreeningAudit
    }

    /**
     * Retrieves or sets a value that determines whether FSRM keeps audit records of the file screen violations. (Put)
     * @remarks
     * The records are included in a File Screen Audit report. An audit record contains the following items:
     * 
     * <ul>
     * <li>Folder path</li>
     * <li>Id</li>
     * <li>Blocked file group name</li>
     * <li>File screen mode</li>
     * <li>Time stamp of when the violation occurred</li>
     * <li>The name of the process image that generated the prohibited IO, if available</li>
     * <li>The SID of the user principal that issued the prohibited IO, if available</li>
     * <li>The full path of the prohibited file</li>
     * <li>The server name</li>
     * </ul>
     * If this property is false and a report specifies the 
     *     <b>FsrmReportType_FileScreenAudit</b> report type, the report will succeed but will not 
     *     contain any audit information (or will contain audits that were done before auditing was disabled).
     * @param {VARIANT_BOOL} enableScreeningAudit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-put_enablescreeningaudit
     */
    put_EnableScreeningAudit(enableScreeningAudit) {
        result := ComCall(16, this, VARIANT_BOOL, enableScreeningAudit, "HRESULT")
        return result
    }

    /**
     * Send an email message to the specified email address.
     * @remarks
     * Use this method to test the SMTP server specified in the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-get_smtpserver">SmtpServer</a> property. The sender is specified in 
     *     the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-get_mailfrom">MailFrom</a> property (cannot be set to 
     *     "[Admin Email]").
     * 
     * The subject and message body are predefined, localized text.
     * @param {BSTR} mailTo The email address. The string is limited to 255 characters.
     * @returns {HRESULT} The method returns the following return codes:
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-emailtest
     */
    EmailTest(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(17, this, BSTR, mailTo, "HRESULT")
        return result
    }

    /**
     * Sets the time that an action that uses the global run limit interval must wait before the action is run again.
     * @remarks
     * Applies to actions that have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmaction-get_runlimitinterval">IFsrmAction::RunLimitInterval</a> property set to –1.
     * 
     * This property specifies the interval that should occur before the action is run again if the global run limit interval is used. For example, if the interval has expired since the action last ran, the server will run the action again in response to an event; otherwise, the server cannot run the action again.
     * @param {FsrmActionType} actionType The action type to limit. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmactiontype">FsrmActionType</a> enumeration.
     * @param {Integer} delayTimeMinutes The run limit interval, in minutes, to use for the action. The default is 60 minutes.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-setactionrunlimitinterval
     */
    SetActionRunLimitInterval(actionType, delayTimeMinutes) {
        result := ComCall(18, this, FsrmActionType, actionType, "int", delayTimeMinutes, "HRESULT")
        return result
    }

    /**
     * Gets the time that an action that uses the global run limit interval must wait before the action is run again.
     * @param {FsrmActionType} actionType The action type to limit. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmactiontype">FsrmActionType</a> enumeration.
     * @returns {Integer} The run limit interval, in minutes, that is used for the action.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-getactionrunlimitinterval
     */
    GetActionRunLimitInterval(actionType) {
        result := ComCall(19, this, FsrmActionType, actionType, "int*", &delayTimeMinutes := 0, "HRESULT")
        return delayTimeMinutes
    }

    Query(iid) {
        if (IFsrmSetting.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SmtpServer := CallbackCreate(GetMethod(implObj, "get_SmtpServer"), flags, 2)
        this.vtbl.put_SmtpServer := CallbackCreate(GetMethod(implObj, "put_SmtpServer"), flags, 2)
        this.vtbl.get_MailFrom := CallbackCreate(GetMethod(implObj, "get_MailFrom"), flags, 2)
        this.vtbl.put_MailFrom := CallbackCreate(GetMethod(implObj, "put_MailFrom"), flags, 2)
        this.vtbl.get_AdminEmail := CallbackCreate(GetMethod(implObj, "get_AdminEmail"), flags, 2)
        this.vtbl.put_AdminEmail := CallbackCreate(GetMethod(implObj, "put_AdminEmail"), flags, 2)
        this.vtbl.get_DisableCommandLine := CallbackCreate(GetMethod(implObj, "get_DisableCommandLine"), flags, 2)
        this.vtbl.put_DisableCommandLine := CallbackCreate(GetMethod(implObj, "put_DisableCommandLine"), flags, 2)
        this.vtbl.get_EnableScreeningAudit := CallbackCreate(GetMethod(implObj, "get_EnableScreeningAudit"), flags, 2)
        this.vtbl.put_EnableScreeningAudit := CallbackCreate(GetMethod(implObj, "put_EnableScreeningAudit"), flags, 2)
        this.vtbl.EmailTest := CallbackCreate(GetMethod(implObj, "EmailTest"), flags, 2)
        this.vtbl.SetActionRunLimitInterval := CallbackCreate(GetMethod(implObj, "SetActionRunLimitInterval"), flags, 3)
        this.vtbl.GetActionRunLimitInterval := CallbackCreate(GetMethod(implObj, "GetActionRunLimitInterval"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SmtpServer)
        CallbackFree(this.vtbl.put_SmtpServer)
        CallbackFree(this.vtbl.get_MailFrom)
        CallbackFree(this.vtbl.put_MailFrom)
        CallbackFree(this.vtbl.get_AdminEmail)
        CallbackFree(this.vtbl.put_AdminEmail)
        CallbackFree(this.vtbl.get_DisableCommandLine)
        CallbackFree(this.vtbl.put_DisableCommandLine)
        CallbackFree(this.vtbl.get_EnableScreeningAudit)
        CallbackFree(this.vtbl.put_EnableScreeningAudit)
        CallbackFree(this.vtbl.EmailTest)
        CallbackFree(this.vtbl.SetActionRunLimitInterval)
        CallbackFree(this.vtbl.GetActionRunLimitInterval)
    }
}
