#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmAction.ahk" { IFsrmAction }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Used to generate a report in response to a quota or file screen event.
 * @remarks
 * You must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactionreport-get_reporttypes">ReportTypes</a> property; 
 *     the other property is optional.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmactionreport
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmActionReport extends IFsrmAction {
    /**
     * The interface identifier for IFsrmActionReport
     * @type {Guid}
     */
    static IID := Guid("{2dbe63c4-b340-48a0-a5b0-158e07fc567e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmActionReport interfaces
    */
    struct Vtbl extends IFsrmAction.Vtbl {
        get_ReportTypes : IntPtr
        put_ReportTypes : IntPtr
        get_MailTo      : IntPtr
        put_MailTo      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmActionReport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ReportTypes {
        get => this.get_ReportTypes()
        set => this.put_ReportTypes(value)
    }

    /**
     * @type {BSTR} 
     */
    MailTo {
        get => this.get_MailTo()
        set => this.put_MailTo(value)
    }

    /**
     * Retrieves or sets the types of reports to generate. (Get)
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionreport-get_reporttypes
     */
    get_ReportTypes() {
        result := ComCall(12, this, "ptr*", &reportTypes := 0, "HRESULT")
        return reportTypes
    }

    /**
     * Retrieves or sets the types of reports to generate. (Put)
     * @param {Pointer<SAFEARRAY>} reportTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionreport-put_reporttypes
     */
    put_ReportTypes(reportTypes) {
        result := ComCall(13, this, SAFEARRAY.Ptr, reportTypes, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the email address to which the reports are sent. (Get)
     * @remarks
     * The email message contains the reports as attachments. It is possible that the mail server may reject the 
     *     message if the server limits attachment sizes. The 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-get_mailfrom">IFsrmSetting::MailFrom</a> property specifies the 
     *     sender of the email. The subject and message body contain predefined text that identifies the quota that caused 
     *     the notification. The email addresses are not checked for format until the action is run.
     * 
     * You can also call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setoutputdirectory">IFsrmReportManager::SetOutputDirectory</a> 
     *     method to specify the storage location for these incident reports.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionreport-get_mailto
     */
    get_MailTo() {
        mailTo := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, mailTo, "HRESULT")
        return mailTo
    }

    /**
     * Retrieves or sets the email address to which the reports are sent. (Put)
     * @remarks
     * The email message contains the reports as attachments. It is possible that the mail server may reject the 
     *     message if the server limits attachment sizes. The 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-get_mailfrom">IFsrmSetting::MailFrom</a> property specifies the 
     *     sender of the email. The subject and message body contain predefined text that identifies the quota that caused 
     *     the notification. The email addresses are not checked for format until the action is run.
     * 
     * You can also call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setoutputdirectory">IFsrmReportManager::SetOutputDirectory</a> 
     *     method to specify the storage location for these incident reports.
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionreport-put_mailto
     */
    put_MailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(15, this, BSTR, mailTo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmActionReport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ReportTypes := CallbackCreate(GetMethod(implObj, "get_ReportTypes"), flags, 2)
        this.vtbl.put_ReportTypes := CallbackCreate(GetMethod(implObj, "put_ReportTypes"), flags, 2)
        this.vtbl.get_MailTo := CallbackCreate(GetMethod(implObj, "get_MailTo"), flags, 2)
        this.vtbl.put_MailTo := CallbackCreate(GetMethod(implObj, "put_MailTo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ReportTypes)
        CallbackFree(this.vtbl.put_ReportTypes)
        CallbackFree(this.vtbl.get_MailTo)
        CallbackFree(this.vtbl.put_MailTo)
    }
}
