#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\COR_GC_THREAD_STATS.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRTask extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRTask
     * @type {Guid}
     */
    static IID => Guid("{28e66a4a-9906-4225-b231-9187c3eb8611}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SwitchIn", "SwitchOut", "GetMemStats", "Reset", "ExitTask", "Abort", "RudeAbort", "NeedsPriorityScheduling", "YieldTask", "LocksHeld", "SetTaskIdentifier"]

    /**
     * 
     * @param {HANDLE} threadHandle 
     * @returns {HRESULT} 
     */
    SwitchIn(threadHandle) {
        threadHandle := threadHandle is Win32Handle ? NumGet(threadHandle, "ptr") : threadHandle

        result := ComCall(3, this, "ptr", threadHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SwitchOut() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {COR_GC_THREAD_STATS} 
     */
    GetMemStats() {
        memUsage := COR_GC_THREAD_STATS()
        result := ComCall(5, this, "ptr", memUsage, "HRESULT")
        return memUsage
    }

    /**
     * Resets the time-out period or other mechanism that TPM manufacturers implement to protect against dictionary attacks on TPM authorization values.
     * @remarks
     * This method calls the TPM\_ResetLockValue command on the TPM. The exact behavior of this method varies among TPM manufacturers. Documentation from the computer or TPM manufacturer may provide additional information on the implementation of the anti-dictionary attack mechanism.
     * 
     * In general, manufacturers can detect dictionary attacks by keeping track of failed authentications. If the number or frequency of failures become high enough, the TPM will lock out further commands for a certain time. Generally, the initial time-out period will be short, to allow a legitimate user a chance to correct the situation. If failures continue, the duration of each subsequent time-out period may increase rapidly.
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {BOOL} fFull 
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned. The following table lists some of the common return values.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                            | Description                                                                                                                                                                                                                                                               |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                            | The method was successful.<br/>                                                                                                                                                                                                                                     |
     * | <dl> <dt>**TPM\_E\_AUTHFAIL**</dt> <dt>2150105089 (0x80280001)</dt> </dl> | The provided owner authorization value is incorrect. Additional attempts at resetting the lock will fail with this same error. Please wait until the time-out period or other manufacturer-specific mechanism has expired before retrying locked TPM commands.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/resetauthlockout-win32-tpm
     */
    Reset(fFull) {
        result := ComCall(6, this, "int", fFull, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExitTask() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The AbortDoc function stops the current print job and erases everything drawn since the last call to the StartDoc function.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * Applications should call the <b>AbortDoc</b> function to stop a print job if an error occurs, or to stop a print job after the user cancels that job. To end a successful print job, an application should call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enddoc">EndDoc</a> function.
     * 
     * If Print Manager was used to start the print job, calling <b>AbortDoc</b> erases the entire spool job, so that the printer receives nothing. If Print Manager was not used to start the print job, the data may already have been sent to the printer. In this case, the printer driver resets the printer (when possible) and ends the print job.
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-abortdoc
     */
    Abort() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RudeAbort() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    NeedsPriorityScheduling() {
        result := ComCall(10, this, "int*", &pbNeedsPriorityScheduling := 0, "HRESULT")
        return pbNeedsPriorityScheduling
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    YieldTask() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    LocksHeld() {
        result := ComCall(12, this, "ptr*", &pLockCount := 0, "HRESULT")
        return pLockCount
    }

    /**
     * 
     * @param {Integer} asked 
     * @returns {HRESULT} 
     */
    SetTaskIdentifier(asked) {
        result := ComCall(13, this, "uint", asked, "HRESULT")
        return result
    }
}
