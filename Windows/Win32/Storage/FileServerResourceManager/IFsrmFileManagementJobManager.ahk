#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to manage file management jobs.
 * @remarks
 * 
  * To create this object from a script, use the "Fsrm.FsrmFileManagementJobManager" program identifier.
  * 
  * A file management job consumes the classification properties associated with a file. The job performs actions 
  *     based whether the property values set by classification meet the specified file management property conditions. 
  *     The primary action is to expire the file (move the file to an expired files folder) and send notification that the 
  *     file was expired; however, you can also perform custom actions.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nn-fsrmreports-ifsrmfilemanagementjobmanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileManagementJobManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileManagementJobManager
     * @type {Guid}
     */
    static IID => Guid("{ee321ecb-d95e-48e9-907c-c7685a013235}")

    /**
     * The class identifier for FsrmFileManagementJobManager
     * @type {Guid}
     */
    static CLSID => Guid("{eb18f9b2-4c3a-4321-b203-205120cff614}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActionVariables", "get_ActionVariableDescriptions", "EnumFileManagementJobs", "CreateFileManagementJob", "GetFileManagementJob"]

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} variables 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-get_actionvariables
     */
    get_ActionVariables(variables) {
        variablesMarshal := variables is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, variablesMarshal, variables, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} descriptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-get_actionvariabledescriptions
     */
    get_ActionVariableDescriptions(descriptions) {
        descriptionsMarshal := descriptions is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, descriptionsMarshal, descriptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<IFsrmCollection>} fileManagementJobs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-enumfilemanagementjobs
     */
    EnumFileManagementJobs(options, fileManagementJobs) {
        result := ComCall(9, this, "int", options, "ptr*", fileManagementJobs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmFileManagementJob>} fileManagementJob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-createfilemanagementjob
     */
    CreateFileManagementJob(fileManagementJob) {
        result := ComCall(10, this, "ptr*", fileManagementJob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IFsrmFileManagementJob>} fileManagementJob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-getfilemanagementjob
     */
    GetFileManagementJob(name, fileManagementJob) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, "ptr", name, "ptr*", fileManagementJob, "HRESULT")
        return result
    }
}
