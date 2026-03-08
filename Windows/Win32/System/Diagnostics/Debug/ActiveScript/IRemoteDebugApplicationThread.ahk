#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IRemoteDebugApplication.ahk
#Include .\IEnumDebugStackFrames.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IRemoteDebugApplicationThread extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDebugApplicationThread
     * @type {Guid}
     */
    static IID => Guid("{51973c37-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSystemThreadId", "GetApplication", "EnumStackFrames", "GetDescription", "SetNextStatement", "GetState", "Suspend", "Resume", "GetSuspendCount"]

    /**
     * 
     * @returns {Integer} 
     */
    GetSystemThreadId() {
        result := ComCall(3, this, "uint*", &dwThreadId := 0, "HRESULT")
        return dwThreadId
    }

    /**
     * Retrieves a pointer to the callback routine registered for the specified process. The address returned is in the virtual address space of the process.
     * @returns {IRemoteDebugApplication} 
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getapplicationrecoverycallback
     */
    GetApplication() {
        result := ComCall(4, this, "ptr*", &pprda := 0, "HRESULT")
        return IRemoteDebugApplication(pprda)
    }

    /**
     * 
     * @returns {IEnumDebugStackFrames} 
     */
    EnumStackFrames() {
        result := ComCall(5, this, "ptr*", &ppedsf := 0, "HRESULT")
        return IEnumDebugStackFrames(ppedsf)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetDescription
     * @param {Pointer<BSTR>} pbstrDescription 
     * @param {Pointer<BSTR>} pbstrState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getdescription
     */
    GetDescription(pbstrDescription, pbstrState) {
        result := ComCall(6, this, "ptr", pbstrDescription, "ptr", pbstrState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugStackFrame} pStackFrame 
     * @param {IDebugCodeContext} pCodeContext 
     * @returns {HRESULT} 
     */
    SetNextStatement(pStackFrame, pCodeContext) {
        result := ComCall(7, this, "ptr", pStackFrame, "ptr", pCodeContext, "HRESULT")
        return result
    }

    /**
     * Gets current Interaction Context state and the time when the context will return to idle state.
     * @remarks
     * After interaction ends, the interaction context might still be busy reporting inertia, or expecting second tap in a double tap gesture (in general, if multi-stroke gesture is possible). This function allows the caller to find out when it is safe to treat the Interaction Context object as idle. The main purpose of this function is management of pools of interaction contexts.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-getstateinteractioncontext
     */
    GetState() {
        result := ComCall(8, this, "uint*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Suspends the specified thread.
     * @remarks
     * If the function succeeds, execution of the specified thread is suspended and the thread's suspend count is incremented. Suspending a thread causes the thread to stop executing user-mode (application) code.
     * 
     * This function is primarily designed for use by debuggers. It is not intended to be used for thread synchronization. Calling 
     * <b>SuspendThread</b> on a thread that owns a synchronization object, such as a mutex or critical section, can lead to a deadlock if the calling thread tries to obtain a synchronization object owned by a suspended thread. To avoid this situation, a thread within an application that is not a debugger should signal the other thread to suspend itself. The target thread must be designed to watch for this signal and respond appropriately.
     * 
     * Each thread has a suspend count (with a maximum value of <b>MAXIMUM_SUSPEND_COUNT</b>). If the suspend count is greater than zero, the thread is suspended; otherwise, the thread is not suspended and is eligible for execution. Calling 
     * <b>SuspendThread</b> causes the target thread's suspend count to be incremented. Attempting to increment past the maximum suspend count causes an error without incrementing the count.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-resumethread">ResumeThread</a> function decrements the suspend count of a suspended thread.
     * 
     * <b>Windows Phone 8.1:</b> This function is supported for Windows Phone Store apps on Windows Phone 8.1 and later.
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-suspendthread
     */
    Suspend() {
        result := ComCall(9, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(10, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Retrieves the number of times BitLocker has been suspended.
     * @remarks
     * This method only applies to the OS volume, and only if it is actually suspended at the time. If the volume is not suspended or is not an OS volume, **ERROR\_NOT\_SUPPORTED** will be returned.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/SecProv/getsuspendcount-win32-encryptablevolume
     */
    GetSuspendCount() {
        result := ComCall(11, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }
}
