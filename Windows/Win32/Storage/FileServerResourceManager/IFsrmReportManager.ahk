#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmCollection.ahk
#Include .\IFsrmReportJob.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumReportJobs", "CreateReportJob", "GetReportJob", "GetOutputDirectory", "SetOutputDirectory", "IsFilterValidForReportType", "GetDefaultFilter", "SetDefaultFilter", "GetReportSizeLimit", "SetReportSizeLimit"]

    /**
     * 
     * @param {Integer} options 
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-enumreportjobs
     */
    EnumReportJobs(options) {
        result := ComCall(7, this, "int", options, "ptr*", &reportJobs := 0, "HRESULT")
        return IFsrmCollection(reportJobs)
    }

    /**
     * 
     * @returns {IFsrmReportJob} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-createreportjob
     */
    CreateReportJob() {
        result := ComCall(8, this, "ptr*", &reportJob := 0, "HRESULT")
        return IFsrmReportJob(reportJob)
    }

    /**
     * 
     * @param {BSTR} taskName 
     * @returns {IFsrmReportJob} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-getreportjob
     */
    GetReportJob(taskName) {
        taskName := taskName is String ? BSTR.Alloc(taskName).Value : taskName

        result := ComCall(9, this, "ptr", taskName, "ptr*", &reportJob := 0, "HRESULT")
        return IFsrmReportJob(reportJob)
    }

    /**
     * 
     * @param {Integer} context 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-getoutputdirectory
     */
    GetOutputDirectory(context) {
        path := BSTR()
        result := ComCall(10, this, "int", context, "ptr", path, "HRESULT")
        return path
    }

    /**
     * 
     * @param {Integer} context 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setoutputdirectory
     */
    SetOutputDirectory(context, path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(11, this, "int", context, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} reportType 
     * @param {Integer} filter 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-isfiltervalidforreporttype
     */
    IsFilterValidForReportType(reportType, filter) {
        result := ComCall(12, this, "int", reportType, "int", filter, "short*", &valid := 0, "HRESULT")
        return valid
    }

    /**
     * 
     * @param {Integer} reportType 
     * @param {Integer} filter 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-getdefaultfilter
     */
    GetDefaultFilter(reportType, filter) {
        filterValue := VARIANT()
        result := ComCall(13, this, "int", reportType, "int", filter, "ptr", filterValue, "HRESULT")
        return filterValue
    }

    /**
     * 
     * @param {Integer} reportType 
     * @param {Integer} filter 
     * @param {VARIANT} filterValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setdefaultfilter
     */
    SetDefaultFilter(reportType, filter, filterValue) {
        result := ComCall(14, this, "int", reportType, "int", filter, "ptr", filterValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} limit 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-getreportsizelimit
     */
    GetReportSizeLimit(limit) {
        limitValue := VARIANT()
        result := ComCall(15, this, "int", limit, "ptr", limitValue, "HRESULT")
        return limitValue
    }

    /**
     * 
     * @param {Integer} limit 
     * @param {VARIANT} limitValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setreportsizelimit
     */
    SetReportSizeLimit(limit, limitValue) {
        result := ComCall(16, this, "int", limit, "ptr", limitValue, "HRESULT")
        return result
    }
}
