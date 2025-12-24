#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmCollection.ahk
#Include .\IFsrmFileManagementJob.ahk
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
     * Retrieves a list of macros that you can specify in action property values.
     * @remarks
     * 
     * FSRM parses the action property for the macros and substitutes the macro string with the values that are specific to the event and computer on which the action occurred.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-get_actionvariables
     */
    get_ActionVariables() {
        result := ComCall(7, this, "ptr*", &variables := 0, "HRESULT")
        return variables
    }

    /**
     * Retrieves the descriptions for the macros contained in the IFsrmFileManagementJobManager::ActionVariables property.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-get_actionvariabledescriptions
     */
    get_ActionVariableDescriptions() {
        result := ComCall(8, this, "ptr*", &descriptions := 0, "HRESULT")
        return descriptions
    }

    /**
     * Enumerates the list of existing file management jobs.
     * @param {Integer} options One or more options to use when enumerating the management jobs. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * 
     * <div class="alert"><b>Note</b>  This parameter must be set to either <b>FsrmEnumOptions_IncludeClusterNodes</b> or <b>FsrmEnumOptions_None</b> for this method.</div>
     * <div> </div>
     * @returns {IFsrmCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> interface that contains a collection of file management jobs.  The variant type of each item in the collection is <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant to get an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmfilemanagementjob">IFsrmFileManagementJob</a> interface to the job.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-enumfilemanagementjobs
     */
    EnumFileManagementJobs(options) {
        result := ComCall(9, this, "int", options, "ptr*", &fileManagementJobs := 0, "HRESULT")
        return IFsrmCollection(fileManagementJobs)
    }

    /**
     * Creates a file management job.
     * @returns {IFsrmFileManagementJob} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmfilemanagementjob">IFsrmFileManagementJob</a> interface that you use to define the new file management job.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-createfilemanagementjob
     */
    CreateFileManagementJob() {
        result := ComCall(10, this, "ptr*", &fileManagementJob := 0, "HRESULT")
        return IFsrmFileManagementJob(fileManagementJob)
    }

    /**
     * Gets the specified file management job.
     * @param {BSTR} name The name of the file management job to retrieve.
     * @returns {IFsrmFileManagementJob} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmfilemanagementjob">IFsrmFileManagementJob</a> interface to the specified file management job.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nf-fsrmreports-ifsrmfilemanagementjobmanager-getfilemanagementjob
     */
    GetFileManagementJob(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, "ptr", name, "ptr*", &fileManagementJob := 0, "HRESULT")
        return IFsrmFileManagementJob(fileManagementJob)
    }
}
