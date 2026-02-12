#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\SlipPrintJob.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IClaimedSlipPrinter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClaimedSlipPrinter
     * @type {Guid}
     */
    static IID => Guid("{bd5deff2-af90-4e8a-b77b-e3ae9ca63a7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SidewaysMaxLines", "get_SidewaysMaxChars", "get_MaxLines", "get_LinesNearEndToEnd", "get_PrintSide", "get_PageSize", "get_PrintArea", "OpenJaws", "CloseJaws", "InsertSlipAsync", "RemoveSlipAsync", "ChangePrintSide", "CreateJob"]

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
    MaxLines {
        get => this.get_MaxLines()
    }

    /**
     * @type {Integer} 
     */
    LinesNearEndToEnd {
        get => this.get_LinesNearEndToEnd()
    }

    /**
     * @type {Integer} 
     */
    PrintSide {
        get => this.get_PrintSide()
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
    get_MaxLines() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LinesNearEndToEnd() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrintSide() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
        result := ComCall(11, this, "ptr", value, "int")
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
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenJaws() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseJaws() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TimeSpan} timeout 
     * @returns {IAsyncOperation<Boolean>} 
     */
    InsertSlipAsync(timeout) {
        result := ComCall(15, this, "ptr", timeout, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {TimeSpan} timeout 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RemoveSlipAsync(timeout) {
        result := ComCall(16, this, "ptr", timeout, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {Integer} printSide 
     * @returns {HRESULT} 
     */
    ChangePrintSide(printSide) {
        result := ComCall(17, this, "int", printSide, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
     * @returns {SlipPrintJob} 
     * @see https://learn.microsoft.com/windows/win32/api//content/jobapi2/nf-jobapi2-createjobobjectw
     */
    CreateJob() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SlipPrintJob(value)
    }
}
