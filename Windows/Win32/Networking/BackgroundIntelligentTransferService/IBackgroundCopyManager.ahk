#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJob.ahk
#Include .\IEnumBackgroundCopyJobs.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates transfer jobs, retrieves an enumerator object that contains the jobs in the queue, and retrieves individual jobs from the queue.
 * @remarks
 * 
  * <b>Windows Vista and later:  </b>When an ActiveX control tries to instantiate this interface from an Internet Explorer process, the call will fail with access denied. This is because COM does not allow lower-integrity clients to bind to class instances at higher integrity levels. For details, see <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/">Understanding and Working in Protected Mode Internet Explorer</a> and <a href="https://docs.microsoft.com/previous-versions/dotnet/articles/bb625962(v=msdn.10)">How the Integrity Mechanism Is Implemented in Windows Vista</a>. A user can workaround the issue by adding the website to the Trusted site zone.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bits/nn-bits-ibackgroundcopymanager
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyManager
     * @type {Guid}
     */
    static IID => Guid("{5ce34c0d-0dc9-4c1f-897c-daa1b78cee7c}")

    /**
     * The class identifier for BackgroundCopyManager
     * @type {Guid}
     */
    static CLSID => Guid("{4991d34b-80a1-4291-83b6-3328366b9097}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateJob", "GetJob", "EnumJobs", "GetErrorDescription"]

    /**
     * 
     * @param {PWSTR} DisplayName 
     * @param {Integer} Type 
     * @param {Pointer<Guid>} pJobId 
     * @param {Pointer<IBackgroundCopyJob>} ppJob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopymanager-createjob
     */
    CreateJob(DisplayName, Type, pJobId, ppJob) {
        DisplayName := DisplayName is String ? StrPtr(DisplayName) : DisplayName

        result := ComCall(3, this, "ptr", DisplayName, "int", Type, "ptr", pJobId, "ptr*", ppJob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} jobID 
     * @returns {IBackgroundCopyJob} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopymanager-getjob
     */
    GetJob(jobID) {
        result := ComCall(4, this, "ptr", jobID, "ptr*", &ppJob := 0, "HRESULT")
        return IBackgroundCopyJob(ppJob)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {IEnumBackgroundCopyJobs} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopymanager-enumjobs
     */
    EnumJobs(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumBackgroundCopyJobs(ppEnum)
    }

    /**
     * 
     * @param {HRESULT} hResult 
     * @param {Integer} LanguageId 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopymanager-geterrordescription
     */
    GetErrorDescription(hResult, LanguageId) {
        result := ComCall(6, this, "int", hResult, "uint", LanguageId, "ptr*", &pErrorDescription := 0, "HRESULT")
        return pErrorDescription
    }
}
