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
     * 
     * @param {Pointer<SAFEARRAY>} variables 
     * @returns {HRESULT} 
     */
    get_ActionVariables(variables) {
        result := ComCall(7, this, "ptr", variables, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} descriptions 
     * @returns {HRESULT} 
     */
    get_ActionVariableDescriptions(descriptions) {
        result := ComCall(8, this, "ptr", descriptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<IFsrmCollection>} fileManagementJobs 
     * @returns {HRESULT} 
     */
    EnumFileManagementJobs(options, fileManagementJobs) {
        result := ComCall(9, this, "int", options, "ptr", fileManagementJobs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmFileManagementJob>} fileManagementJob 
     * @returns {HRESULT} 
     */
    CreateFileManagementJob(fileManagementJob) {
        result := ComCall(10, this, "ptr", fileManagementJob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IFsrmFileManagementJob>} fileManagementJob 
     * @returns {HRESULT} 
     */
    GetFileManagementJob(name, fileManagementJob) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, "ptr", name, "ptr", fileManagementJob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
