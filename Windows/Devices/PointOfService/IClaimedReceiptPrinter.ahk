#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include .\ReceiptPrintJob.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IClaimedReceiptPrinter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClaimedReceiptPrinter
     * @type {Guid}
     */
    static IID => Guid("{9ad27a74-dd61-4ee2-9837-5b5d72d538b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SidewaysMaxLines", "get_SidewaysMaxChars", "get_LinesToPaperCut", "get_PageSize", "get_PrintArea", "CreateJob"]

    /**
     * @type {Integer} 
     */
    SidewaysMaxLines {
        get => this.get_SidewaysMaxLines()
    }

    /**
     * @type {Integer} 
     */
    SidewaysMaxChars {
        get => this.get_SidewaysMaxChars()
    }

    /**
     * @type {Integer} 
     */
    LinesToPaperCut {
        get => this.get_LinesToPaperCut()
    }

    /**
     * @type {SIZE} 
     */
    PageSize {
        get => this.get_PageSize()
    }

    /**
     * @type {RECT} 
     */
    PrintArea {
        get => this.get_PrintArea()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SidewaysMaxLines() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SidewaysMaxChars() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LinesToPaperCut() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_PageSize() {
        value := SIZE()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_PrintArea() {
        value := RECT()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

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
     * @returns {ReceiptPrintJob} 
     * @see https://learn.microsoft.com/windows/win32/api//content/jobapi2/nf-jobapi2-createjobobjectw
     */
    CreateJob() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ReceiptPrintJob(value)
    }
}
