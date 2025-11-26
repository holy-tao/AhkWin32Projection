#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to configure FSRM.
 * @remarks
 * 
 * To create this object from a script, use the program identifier, "Fsrm.FsrmSetting".
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmsetting
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmSetting extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmSetting
     * @type {Guid}
     */
    static IID => Guid("{f411d4fd-14be-4260-8c40-03b7c95e608a}")

    /**
     * The class identifier for FsrmSetting
     * @type {Guid}
     */
    static CLSID => Guid("{f556d708-6d4d-4594-9c61-7dbb0dae2a46}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SmtpServer", "put_SmtpServer", "get_MailFrom", "put_MailFrom", "get_AdminEmail", "put_AdminEmail", "get_DisableCommandLine", "put_DisableCommandLine", "get_EnableScreeningAudit", "put_EnableScreeningAudit", "EmailTest", "SetActionRunLimitInterval", "GetActionRunLimitInterval"]

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
     * Retrieves or sets the SMTP server that FSRM uses to send email.
     * @remarks
     * 
     * This property must be set in order for FSRM to send email. To verify settings, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-emailtest">IFsrmSetting::EmailTest</a> method.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-get_smtpserver
     */
    get_SmtpServer() {
        smtpServer := BSTR()
        result := ComCall(7, this, "ptr", smtpServer, "HRESULT")
        return smtpServer
    }

    /**
     * Retrieves or sets the SMTP server that FSRM uses to send email.
     * @remarks
     * 
     * This property must be set in order for FSRM to send email. To verify settings, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-emailtest">IFsrmSetting::EmailTest</a> method.
     * 
     * 
     * 
     * @param {BSTR} smtpServer 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-put_smtpserver
     */
    put_SmtpServer(smtpServer) {
        smtpServer := smtpServer is String ? BSTR.Alloc(smtpServer).Value : smtpServer

        result := ComCall(8, this, "ptr", smtpServer, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the default email address from which email messages are sent.
     * @remarks
     * 
     * The default is" FSRM@<i>local machine name</i>". You cannot set this to 
     *     "[Admin Email]".
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-get_mailfrom
     */
    get_MailFrom() {
        mailFrom := BSTR()
        result := ComCall(9, this, "ptr", mailFrom, "HRESULT")
        return mailFrom
    }

    /**
     * Retrieves or sets the default email address from which email messages are sent.
     * @remarks
     * 
     * The default is" FSRM@<i>local machine name</i>". You cannot set this to 
     *     "[Admin Email]".
     * 
     * 
     * 
     * @param {BSTR} mailFrom 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-put_mailfrom
     */
    put_MailFrom(mailFrom) {
        mailFrom := mailFrom is String ? BSTR.Alloc(mailFrom).Value : mailFrom

        result := ComCall(10, this, "ptr", mailFrom, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the email address for the administrator.
     * @remarks
     * 
     * The address is used if a configured email address contains the string "[Admin Email]".
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-get_adminemail
     */
    get_AdminEmail() {
        adminEmail := BSTR()
        result := ComCall(11, this, "ptr", adminEmail, "HRESULT")
        return adminEmail
    }

    /**
     * Retrieves or sets the email address for the administrator.
     * @remarks
     * 
     * The address is used if a configured email address contains the string "[Admin Email]".
     * 
     * 
     * 
     * @param {BSTR} adminEmail 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-put_adminemail
     */
    put_AdminEmail(adminEmail) {
        adminEmail := adminEmail is String ? BSTR.Alloc(adminEmail).Value : adminEmail

        result := ComCall(12, this, "ptr", adminEmail, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that determines whether FSRM prevents command line actions from running.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-get_disablecommandline
     */
    get_DisableCommandLine() {
        result := ComCall(13, this, "short*", &disableCommandLine := 0, "HRESULT")
        return disableCommandLine
    }

    /**
     * Retrieves or sets a value that determines whether FSRM prevents command line actions from running.
     * @param {VARIANT_BOOL} disableCommandLine 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-put_disablecommandline
     */
    put_DisableCommandLine(disableCommandLine) {
        result := ComCall(14, this, "short", disableCommandLine, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that determines whether FSRM keeps audit records of the file screen violations.
     * @remarks
     * 
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
     * 
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-get_enablescreeningaudit
     */
    get_EnableScreeningAudit() {
        result := ComCall(15, this, "short*", &enableScreeningAudit := 0, "HRESULT")
        return enableScreeningAudit
    }

    /**
     * Retrieves or sets a value that determines whether FSRM keeps audit records of the file screen violations.
     * @remarks
     * 
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
     * 
     * 
     * 
     * @param {VARIANT_BOOL} enableScreeningAudit 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-put_enablescreeningaudit
     */
    put_EnableScreeningAudit(enableScreeningAudit) {
        result := ComCall(16, this, "short", enableScreeningAudit, "HRESULT")
        return result
    }

    /**
     * Send an email message to the specified email address.
     * @param {BSTR} mailTo The email address. The string is limited to 255 characters.
     * @returns {HRESULT} The method returns the following return codes:
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-emailtest
     */
    EmailTest(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(17, this, "ptr", mailTo, "HRESULT")
        return result
    }

    /**
     * Sets the time that an action that uses the global run limit interval must wait before the action is run again.
     * @param {Integer} actionType The action type to limit. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmactiontype">FsrmActionType</a> enumeration.
     * @param {Integer} delayTimeMinutes The run limit interval, in minutes, to use for the action. The default is 60 minutes.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-setactionrunlimitinterval
     */
    SetActionRunLimitInterval(actionType, delayTimeMinutes) {
        result := ComCall(18, this, "int", actionType, "int", delayTimeMinutes, "HRESULT")
        return result
    }

    /**
     * Gets the time that an action that uses the global run limit interval must wait before the action is run again.
     * @param {Integer} actionType The action type to limit. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmactiontype">FsrmActionType</a> enumeration.
     * @returns {Integer} The run limit interval, in minutes, that is used for the action.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmsetting-getactionrunlimitinterval
     */
    GetActionRunLimitInterval(actionType) {
        result := ComCall(19, this, "int", actionType, "int*", &delayTimeMinutes := 0, "HRESULT")
        return delayTimeMinutes
    }
}
