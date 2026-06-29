#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBackgroundCopyJob.ahk" { IBackgroundCopyJob }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IEnumBackgroundCopyJobs.ahk" { IEnumBackgroundCopyJobs }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\BG_JOB_TYPE.ahk" { BG_JOB_TYPE }
#Import "..\..\System\Com\Apis.ahk" { CoTaskMemFree }

/**
 * Creates transfer jobs, retrieves an enumerator object that contains the jobs in the queue, and retrieves individual jobs from the queue.
 * @remarks
 * <b>Windows Vista and later:  </b>When an ActiveX control tries to instantiate this interface from an Internet Explorer process, the call will fail with access denied. This is because COM does not allow lower-integrity clients to bind to class instances at higher integrity levels. For details, see <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/">Understanding and Working in Protected Mode Internet Explorer</a> and <a href="https://docs.microsoft.com/previous-versions/dotnet/articles/bb625962(v=msdn.10)">How the Integrity Mechanism Is Implemented in Windows Vista</a>. A user can workaround the issue by adding the website to the Trusted site zone.
 * @see https://learn.microsoft.com/windows/win32/api/bits/nn-bits-ibackgroundcopymanager
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBackgroundCopyManager extends IUnknown {
    /**
     * The interface identifier for IBackgroundCopyManager
     * @type {Guid}
     */
    static IID := Guid("{5ce34c0d-0dc9-4c1f-897c-daa1b78cee7c}")

    /**
     * The class identifier for BackgroundCopyManager
     * @type {Guid}
     */
    static CLSID := Guid("{4991d34b-80a1-4291-83b6-3328366b9097}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBackgroundCopyManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateJob           : IntPtr
        GetJob              : IntPtr
        EnumJobs            : IntPtr
        GetErrorDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBackgroundCopyManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a job.
     * @remarks
     * Only the user who creates the job or a user with administrator privileges can <a href="https://docs.microsoft.com/windows/desktop/Bits/adding-files-to-a-job">add files to the job</a> and <a href="https://docs.microsoft.com/windows/desktop/Bits/setting-and-retrieving-the-properties-of-a-job">change the job's properties</a>.
     * 
     * By default, BITS supports a maximum of 300 jobs at one time. A single user can create a maximum of 60 jobs at one time. The user limit does not apply to administrators or service accounts. To change these defaults, set the <b>MaxJobsPerMachine</b> and <b>MaxJobsPerUser</b> group policies, respectively.
     * 
     * <b>Prior to Windows Vista:  </b>There is no limit on the number of jobs that BITS supports or that a user can create.
     * 
     * For scalability concerns, see <a href="https://docs.microsoft.com/windows/desktop/Bits/best-practices-when-using-bits">Best Practices When Using BITS</a>.
     * @param {PWSTR} DisplayName Null-terminated string that contains a display name for the job. Typically, the display name is used to identify the job in a user interface. Note that more than one job may have the same display name. Must not be <b>NULL</b>. The name is limited to 256 characters, not including the null terminator.
     * @param {BG_JOB_TYPE} Type Type of transfer job, such as BG_JOB_TYPE_DOWNLOAD. For a list of transfer types, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ne-bits-bg_job_type">BG_JOB_TYPE</a> enumeration.
     * @param {Pointer<Guid>} pJobId Uniquely identifies your job in the queue. Use this identifier when you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopymanager-getjob">IBackgroundCopyManager::GetJob</a> method to get a job from the queue.
     * @param {Pointer<IBackgroundCopyJob>} ppJob An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob</a> interface pointer that you use to modify the job's properties and specify the files to be transferred. To activate the job in the queue, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">IBackgroundCopyJob::Resume</a> method. Release <i>ppJob</i> when done.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully generated the new job.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display name is too long.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_TOO_MANY_JOBS_PER_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MaxJobsPerMachine Group Policy setting determines how many jobs can be created on the computer. Adding this job exceeds the MaxJobsPerMachine limit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_TOO_MANY_JOBS_PER_USER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MaxJobsPerUser Group Policy setting determines how many jobs a user can create. Adding this job exceeds the MaxJobsPerUser limit.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopymanager-createjob
     */
    CreateJob(DisplayName, Type, pJobId, ppJob) {
        DisplayName := DisplayName is String ? StrPtr(DisplayName) : DisplayName

        result := ComCall(3, this, "ptr", DisplayName, BG_JOB_TYPE, Type, Guid.Ptr, pJobId, IBackgroundCopyJob.Ptr, ppJob, "HRESULT")
        return result
    }

    /**
     * Retrieves a specified job from the transfer queue. Typically, your application persists the job identifier, so you can later retrieve the job from the queue.
     * @param {Pointer<Guid>} jobID Identifies the job to retrieve from the transfer queue. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopymanager-createjob">CreateJob</a> method returns the job identifier.
     * @returns {IBackgroundCopyJob} An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob</a> interface pointer to the job specified by <i>JobID</i>. When done, release <i>ppJob</i>.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopymanager-getjob
     */
    GetJob(jobID) {
        result := ComCall(4, this, Guid.Ptr, jobID, "ptr*", &ppJob := 0, "HRESULT")
        return IBackgroundCopyJob(ppJob)
    }

    /**
     * Retrieves an interface pointer to an enumerator object that you use to enumerate the jobs in the transfer queue. The order of the jobs in the enumerator is arbitrary.
     * @param {Integer} dwFlags Specifies whose jobs to include in the enumeration. If <i>dwFlags</i> is set to 0, the user receives all jobs that they own in the transfer queue. The following table lists the enumeration options. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Option</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_JOB_ENUM_ALL_USERS"></a><a id="bg_job_enum_all_users"></a><dl>
     * <dt><b>BG_JOB_ENUM_ALL_USERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Includes all jobs in the transfer queue—those owned by the user and those owned by others. The user must be an administrator to use this flag.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IEnumBackgroundCopyJobs} An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ienumbackgroundcopyjobs">IEnumBackgroundCopyJobs</a> interface pointer that you use to enumerate the jobs in the transfer queue. The contents of the enumerator depend on the value of <i>dwFlags</i>. Release <i>ppEnumJobs</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopymanager-enumjobs
     */
    EnumJobs(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumBackgroundCopyJobs(ppEnum)
    }

    /**
     * Retrieves a description for the specified error code.
     * @remarks
     * Descriptions for HTTP errors are  localized.
     * 
     * <b>Windows XP/2000:  </b>Descriptions for HTTP errors are not localized.
     * @param {HRESULT} _hResult Error code from a previous call to a BITS method.
     * @param {Integer} LanguageId Identifies the language identifier to use to generate the description. To create the language identifier, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-makelangid">MAKELANGID</a> macro. For example, to specify U.S. English, use the following code sample. 
     * 
     * 
     * 
     * 
     * <c>MAKELANGID(LANG_ENGLISH, SUBLANG_ENGLISH_US)</c>
     * 
     * To retrieve the system's default user language identifier, use the following calls.
     * 
     * <c>LANGIDFROMLCID(GetThreadLocale())</c>
     * @returns {PWSTR} Null-terminated string that contains a description of the error. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppErrorDescription</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopymanager-geterrordescription
     */
    GetErrorDescription(_hResult, LanguageId) {
        result := ComCall(6, this, "int", _hResult, "uint", LanguageId, PWSTR.Ptr, &pErrorDescription := 0, Int32)
        if(result != 0) {
            CoTaskMemFree(pErrorDescription.value)
            throw OSError()
        }

        return pErrorDescription
    }

    Query(iid) {
        if (IBackgroundCopyManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateJob := CallbackCreate(GetMethod(implObj, "CreateJob"), flags, 5)
        this.vtbl.GetJob := CallbackCreate(GetMethod(implObj, "GetJob"), flags, 3)
        this.vtbl.EnumJobs := CallbackCreate(GetMethod(implObj, "EnumJobs"), flags, 3)
        this.vtbl.GetErrorDescription := CallbackCreate(GetMethod(implObj, "GetErrorDescription"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateJob)
        CallbackFree(this.vtbl.GetJob)
        CallbackFree(this.vtbl.EnumJobs)
        CallbackFree(this.vtbl.GetErrorDescription)
    }
}
