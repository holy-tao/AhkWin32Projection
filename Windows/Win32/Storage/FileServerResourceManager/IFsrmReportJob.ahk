#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<BSTR>} taskName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_task
     */
    get_Task(taskName) {
        result := ComCall(12, this, "ptr", taskName, "HRESULT")
        return result
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
     * @param {Pointer<Pointer<SAFEARRAY>>} namespaceRoots 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_namespaceroots
     */
    get_NamespaceRoots(namespaceRoots) {
        result := ComCall(14, this, "ptr*", namespaceRoots, "HRESULT")
        return result
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
     * @param {Pointer<Pointer<SAFEARRAY>>} formats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_formats
     */
    get_Formats(formats) {
        result := ComCall(16, this, "ptr*", formats, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} mailTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_mailto
     */
    get_MailTo(mailTo) {
        result := ComCall(18, this, "ptr", mailTo, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} runningStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_runningstatus
     */
    get_RunningStatus(runningStatus) {
        runningStatusMarshal := runningStatus is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, runningStatusMarshal, runningStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} lastRun 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lastrun
     */
    get_LastRun(lastRun) {
        lastRunMarshal := lastRun is VarRef ? "double*" : "ptr"

        result := ComCall(21, this, lastRunMarshal, lastRun, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} lastError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lasterror
     */
    get_LastError(lastError) {
        result := ComCall(22, this, "ptr", lastError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_lastgeneratedindirectory
     */
    get_LastGeneratedInDirectory(path) {
        result := ComCall(23, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmCollection>} reports 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-enumreports
     */
    EnumReports(reports) {
        result := ComCall(24, this, "ptr*", reports, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} reportType 
     * @param {Pointer<IFsrmReport>} report 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-createreport
     */
    CreateReport(reportType, report) {
        result := ComCall(25, this, "int", reportType, "ptr*", report, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} completed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-waitforcompletion
     */
    WaitForCompletion(waitSeconds, completed) {
        result := ComCall(27, this, "int", waitSeconds, "ptr", completed, "HRESULT")
        return result
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
