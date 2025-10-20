#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to manage report jobs.
 * @remarks
 * 
  * A storage report job specifies a set of directories that will be analyzed to generate one or more different 
  *     report types that help administrators to better understand how storage is utilized in the specified directories. 
  *     You can configure report jobs to execute according to a schedule or on demand.
  * 
  * To create this object from a script, use the "Fsrm.FsrmReportManager" program 
  *     identifier.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nn-fsrmreports-ifsrmreportmanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmReportManager extends IDispatch{
    /**
     * The interface identifier for IFsrmReportManager
     * @type {Guid}
     */
    static IID => Guid("{27b899fe-6ffa-4481-a184-d3daade8a02b}")

    /**
     * The class identifier for FsrmReportManager
     * @type {Guid}
     */
    static CLSID => Guid("{0058ef37-aa66-4c48-bd5b-2fce432ab0c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<IFsrmCollection>} reportJobs 
     * @returns {HRESULT} 
     */
    EnumReportJobs(options, reportJobs) {
        result := ComCall(7, this, "int", options, "ptr", reportJobs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmReportJob>} reportJob 
     * @returns {HRESULT} 
     */
    CreateReportJob(reportJob) {
        result := ComCall(8, this, "ptr", reportJob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} taskName 
     * @param {Pointer<IFsrmReportJob>} reportJob 
     * @returns {HRESULT} 
     */
    GetReportJob(taskName, reportJob) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName

        result := ComCall(9, this, "ptr", taskName, "ptr", reportJob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} context 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     */
    GetOutputDirectory(context, path) {
        result := ComCall(10, this, "int", context, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} context 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    SetOutputDirectory(context, path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(11, this, "int", context, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} reportType 
     * @param {Integer} filter 
     * @param {Pointer<VARIANT_BOOL>} valid 
     * @returns {HRESULT} 
     */
    IsFilterValidForReportType(reportType, filter, valid) {
        result := ComCall(12, this, "int", reportType, "int", filter, "ptr", valid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} reportType 
     * @param {Integer} filter 
     * @param {Pointer<VARIANT>} filterValue 
     * @returns {HRESULT} 
     */
    GetDefaultFilter(reportType, filter, filterValue) {
        result := ComCall(13, this, "int", reportType, "int", filter, "ptr", filterValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} reportType 
     * @param {Integer} filter 
     * @param {VARIANT} filterValue 
     * @returns {HRESULT} 
     */
    SetDefaultFilter(reportType, filter, filterValue) {
        result := ComCall(14, this, "int", reportType, "int", filter, "ptr", filterValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} limit 
     * @param {Pointer<VARIANT>} limitValue 
     * @returns {HRESULT} 
     */
    GetReportSizeLimit(limit, limitValue) {
        result := ComCall(15, this, "int", limit, "ptr", limitValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} limit 
     * @param {VARIANT} limitValue 
     * @returns {HRESULT} 
     */
    SetReportSizeLimit(limit, limitValue) {
        result := ComCall(16, this, "int", limit, "ptr", limitValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
