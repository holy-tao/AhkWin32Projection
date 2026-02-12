#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\JournalPrintJob.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IClaimedJournalPrinter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClaimedJournalPrinter
     * @type {Guid}
     */
    static IID => Guid("{67ea0630-517d-487f-9fdf-d2e0a0a264a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateJob"]

    /**
     * Creates or opens a job object. (CreateJobObjectW)
     * @remarks
     * When a job is created, its accounting information is initialized to zero, all limits are inactive, and there are no associated processes. To assign a process to  a job object, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-assignprocesstojobobject">AssignProcessToJobObject</a> function. To set limits for a job, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-setinformationjobobject">SetInformationJobObject</a> function. To query accounting information, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-queryinformationjobobject">QueryInformationJobObject</a> function.
     * 
     * All processes associated with a job must run in the same session. A job is associated with the session of the first process to be assigned to the job.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>A job is associated with the session of the  process that created it.
     * 
     * To close a job object handle, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function. The job is destroyed when its last handle has been closed and all associated processes have exited. However, if the job has the <b>JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE</b> flag specified, closing the last job object handle terminates all associated processes and then destroys the job object itself.
     * 
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0500 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @returns {JournalPrintJob} 
     * @see https://learn.microsoft.com/windows/win32/api//content/jobapi2/nf-jobapi2-createjobobjectw
     */
    CreateJob() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JournalPrintJob(value)
    }
}
