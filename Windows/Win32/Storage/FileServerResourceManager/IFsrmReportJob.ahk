#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmCollection.ahk
#Include .\IFsrmReport.ahk
#Include .\IFsrmObject.ahk

/**
 * Used to configure a report job.
 * @remarks
 * 
 * To <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">commit</a> the job, you must specify at least one 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-createreport">report type</a>, at least one 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_namespaceroots">namespace root</a>, and the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_task">task name</a>.
 * 
 * To <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-run">run</a> the job, you must specify at least one 
 *    <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-createreport">report type</a> and 
 *    <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_namespaceroots">namespace root</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nn-fsrmreports-ifsrmreportjob
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmReportJob extends IFsrmObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmReportJob
     * @type {Guid}
     */
    static IID => Guid("{38e87280-715c-4c7d-a280-ea1651a19fef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Task", "put_Task", "get_NamespaceRoots", "put_NamespaceRoots", "get_Formats", "put_Formats", "get_MailTo", "put_MailTo", "get_RunningStatus", "get_LastRun", "get_LastError", "get_LastGeneratedInDirectory", "EnumReports", "CreateReport", "Run", "WaitForCompletion", "Cancel"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_task
     */
    get_Task() {
        taskName := BSTR()
        result := ComCall(12, this, "ptr", taskName, "HRESULT")
        return taskName
    }

    /**
     * 
     * @param {BSTR} taskName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-put_task
     */
    put_Task(taskName) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName

        result := ComCall(13, this, "ptr", taskName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_namespaceroots
     */
    get_NamespaceRoots() {
        result := ComCall(14, this, "ptr*", &namespaceRoots := 0, "HRESULT")
        return namespaceRoots
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-put_namespaceroots
     */
    put_NamespaceRoots(namespaceRoots) {
        result := ComCall(15, this, "ptr", namespaceRoots, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_formats
     */
    get_Formats() {
        result := ComCall(16, this, "ptr*", &formats := 0, "HRESULT")
        return formats
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} formats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-put_formats
     */
    put_Formats(formats) {
        result := ComCall(17, this, "ptr", formats, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_mailto
     */
    get_MailTo() {
        mailTo := BSTR()
        result := ComCall(18, this, "ptr", mailTo, "HRESULT")
        return mailTo
    }

    /**
     * 
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-put_mailto
     */
    put_MailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(19, this, "ptr", mailTo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_runningstatus
     */
    get_RunningStatus() {
        result := ComCall(20, this, "int*", &runningStatus := 0, "HRESULT")
        return runningStatus
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lastrun
     */
    get_LastRun() {
        result := ComCall(21, this, "double*", &lastRun := 0, "HRESULT")
        return lastRun
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lasterror
     */
    get_LastError() {
        lastError := BSTR()
        result := ComCall(22, this, "ptr", lastError, "HRESULT")
        return lastError
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lastgeneratedindirectory
     */
    get_LastGeneratedInDirectory() {
        path := BSTR()
        result := ComCall(23, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * 
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-enumreports
     */
    EnumReports() {
        result := ComCall(24, this, "ptr*", &reports := 0, "HRESULT")
        return IFsrmCollection(reports)
    }

    /**
     * 
     * @param {Integer} reportType 
     * @returns {IFsrmReport} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-createreport
     */
    CreateReport(reportType) {
        result := ComCall(25, this, "int", reportType, "ptr*", &report := 0, "HRESULT")
        return IFsrmReport(report)
    }

    /**
     * 
     * @param {Integer} context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-run
     */
    Run(context) {
        result := ComCall(26, this, "int", context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} waitSeconds 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-waitforcompletion
     */
    WaitForCompletion(waitSeconds) {
        result := ComCall(27, this, "int", waitSeconds, "short*", &completed := 0, "HRESULT")
        return completed
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-cancel
     */
    Cancel() {
        result := ComCall(28, this, "HRESULT")
        return result
    }
}
