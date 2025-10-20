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
     * 
     * @param {Pointer<BSTR>} taskName 
     * @returns {HRESULT} 
     */
    get_Task(taskName) {
        result := ComCall(12, this, "ptr", taskName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} taskName 
     * @returns {HRESULT} 
     */
    put_Task(taskName) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName

        result := ComCall(13, this, "ptr", taskName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     */
    get_NamespaceRoots(namespaceRoots) {
        result := ComCall(14, this, "ptr", namespaceRoots, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     */
    put_NamespaceRoots(namespaceRoots) {
        result := ComCall(15, this, "ptr", namespaceRoots, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} formats 
     * @returns {HRESULT} 
     */
    get_Formats(formats) {
        result := ComCall(16, this, "ptr", formats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} formats 
     * @returns {HRESULT} 
     */
    put_Formats(formats) {
        result := ComCall(17, this, "ptr", formats, "int")
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
        result := ComCall(18, this, "ptr", mailTo, "int")
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

        result := ComCall(19, this, "ptr", mailTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} runningStatus 
     * @returns {HRESULT} 
     */
    get_RunningStatus(runningStatus) {
        result := ComCall(20, this, "int*", runningStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} lastRun 
     * @returns {HRESULT} 
     */
    get_LastRun(lastRun) {
        result := ComCall(21, this, "double*", lastRun, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} lastError 
     * @returns {HRESULT} 
     */
    get_LastError(lastError) {
        result := ComCall(22, this, "ptr", lastError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     */
    get_LastGeneratedInDirectory(path) {
        result := ComCall(23, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmCollection>} reports 
     * @returns {HRESULT} 
     */
    EnumReports(reports) {
        result := ComCall(24, this, "ptr", reports, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} reportType 
     * @param {Pointer<IFsrmReport>} report 
     * @returns {HRESULT} 
     */
    CreateReport(reportType, report) {
        result := ComCall(25, this, "int", reportType, "ptr", report, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} context 
     * @returns {HRESULT} 
     */
    Run(context) {
        result := ComCall(26, this, "int", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} waitSeconds 
     * @param {Pointer<VARIANT_BOOL>} completed 
     * @returns {HRESULT} 
     */
    WaitForCompletion(waitSeconds, completed) {
        result := ComCall(27, this, "int", waitSeconds, "ptr", completed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(28, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
