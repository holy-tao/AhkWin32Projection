#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFsrmCollection.ahk" { IFsrmCollection }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFsrmFileManagementJob.ahk" { IFsrmFileManagementJob }
#Import ".\FsrmEnumOptions.ahk" { FsrmEnumOptions }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Used to manage file management jobs.
 * @remarks
 * To create this object from a script, use the "Fsrm.FsrmFileManagementJobManager" program identifier.
 * 
 * A file management job consumes the classification properties associated with a file. The job performs actions 
 *     based whether the property values set by classification meet the specified file management property conditions. 
 *     The primary action is to expire the file (move the file to an expired files folder) and send notification that the 
 *     file was expired; however, you can also perform custom actions.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nn-fsrmreports-ifsrmfilemanagementjobmanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmFileManagementJobManager extends IDispatch {
    /**
     * The interface identifier for IFsrmFileManagementJobManager
     * @type {Guid}
     */
    static IID := Guid("{ee321ecb-d95e-48e9-907c-c7685a013235}")

    /**
     * The class identifier for FsrmFileManagementJobManager
     * @type {Guid}
     */
    static CLSID := Guid("{eb18f9b2-4c3a-4321-b203-205120cff614}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmFileManagementJobManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ActionVariables            : IntPtr
        get_ActionVariableDescriptions : IntPtr
        EnumFileManagementJobs         : IntPtr
        CreateFileManagementJob        : IntPtr
        GetFileManagementJob           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmFileManagementJobManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ActionVariables {
        get => this.get_ActionVariables()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ActionVariableDescriptions {
        get => this.get_ActionVariableDescriptions()
    }

    /**
     * Retrieves a list of macros that you can specify in action property values. (IFsrmFileManagementJobManager.get_ActionVariables)
     * @remarks
     * FSRM parses the action property for the macros and substitutes the macro string with the values that are specific to the event and computer on which the action occurred.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-get_actionvariables
     */
    get_ActionVariables() {
        result := ComCall(7, this, "ptr*", &variables := 0, "HRESULT")
        return variables
    }

    /**
     * Retrieves the descriptions for the macros contained in the IFsrmFileManagementJobManager::ActionVariables property.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-get_actionvariabledescriptions
     */
    get_ActionVariableDescriptions() {
        result := ComCall(8, this, "ptr*", &descriptions := 0, "HRESULT")
        return descriptions
    }

    /**
     * Enumerates the list of existing file management jobs.
     * @param {FsrmEnumOptions} options One or more options to use when enumerating the management jobs. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * 
     * <div class="alert"><b>Note</b>  This parameter must be set to either <b>FsrmEnumOptions_IncludeClusterNodes</b> or <b>FsrmEnumOptions_None</b> for this method.</div>
     * <div> </div>
     * @returns {IFsrmCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> interface that contains a collection of file management jobs.  The variant type of each item in the collection is <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant to get an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmfilemanagementjob">IFsrmFileManagementJob</a> interface to the job.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-enumfilemanagementjobs
     */
    EnumFileManagementJobs(options) {
        result := ComCall(9, this, FsrmEnumOptions, options, "ptr*", &fileManagementJobs := 0, "HRESULT")
        return IFsrmCollection(fileManagementJobs)
    }

    /**
     * Creates a file management job.
     * @returns {IFsrmFileManagementJob} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmfilemanagementjob">IFsrmFileManagementJob</a> interface that you use to define the new file management job.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-createfilemanagementjob
     */
    CreateFileManagementJob() {
        result := ComCall(10, this, "ptr*", &fileManagementJob := 0, "HRESULT")
        return IFsrmFileManagementJob(fileManagementJob)
    }

    /**
     * Gets the specified file management job.
     * @param {BSTR} name The name of the file management job to retrieve.
     * @returns {IFsrmFileManagementJob} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmfilemanagementjob">IFsrmFileManagementJob</a> interface to the specified file management job.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-getfilemanagementjob
     */
    GetFileManagementJob(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, BSTR, name, "ptr*", &fileManagementJob := 0, "HRESULT")
        return IFsrmFileManagementJob(fileManagementJob)
    }

    Query(iid) {
        if (IFsrmFileManagementJobManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ActionVariables := CallbackCreate(GetMethod(implObj, "get_ActionVariables"), flags, 2)
        this.vtbl.get_ActionVariableDescriptions := CallbackCreate(GetMethod(implObj, "get_ActionVariableDescriptions"), flags, 2)
        this.vtbl.EnumFileManagementJobs := CallbackCreate(GetMethod(implObj, "EnumFileManagementJobs"), flags, 3)
        this.vtbl.CreateFileManagementJob := CallbackCreate(GetMethod(implObj, "CreateFileManagementJob"), flags, 2)
        this.vtbl.GetFileManagementJob := CallbackCreate(GetMethod(implObj, "GetFileManagementJob"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ActionVariables)
        CallbackFree(this.vtbl.get_ActionVariableDescriptions)
        CallbackFree(this.vtbl.EnumFileManagementJobs)
        CallbackFree(this.vtbl.CreateFileManagementJob)
        CallbackFree(this.vtbl.GetFileManagementJob)
    }
}
