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
        result := ComCall(3, this, "uint*", &dwThreadId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return dwThreadId
    }

    /**
     * Retrieves a pointer to the callback routine registered for the specified process. The address returned is in the virtual address space of the process.
     * @returns {IRemoteDebugApplication} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-getapplicationrecoverycallback
     */
    GetApplication() {
        result := ComCall(4, this, "ptr*", &pprda := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRemoteDebugApplication(pprda)
    }

    /**
     * 
     * @returns {IEnumDebugStackFrames} 
     */
    EnumStackFrames() {
        result := ComCall(5, this, "ptr*", &ppedsf := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumDebugStackFrames(ppedsf)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetDescription
     * @param {Pointer<BSTR>} pbstrDescription 
     * @param {Pointer<BSTR>} pbstrState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecstrings-getdescription
     */
    GetDescription(pbstrDescription, pbstrState) {
        result := ComCall(6, this, "ptr", pbstrDescription, "ptr", pbstrState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDebugStackFrame} pStackFrame 
     * @param {IDebugCodeContext} pCodeContext 
     * @returns {HRESULT} 
     */
    SetNextStatement(pStackFrame, pCodeContext) {
        result := ComCall(7, this, "ptr", pStackFrame, "ptr", pCodeContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets current Interaction Context state and the time when the context will return to idle state.
     * @remarks
     * After interaction ends, the interaction context might still be busy reporting inertia, or expecting second tap in a double tap gesture (in general, if multi-stroke gesture is possible). This function allows the caller to find out when it is safe to treat the Interaction Context object as idle. The main purpose of this function is management of pools of interaction contexts.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-getstateinteractioncontext
     */
    GetState() {
        result := ComCall(8, this, "uint*", &pState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pState
    }

    /**
     * Notifies the system that the app has saved its data and is ready to be suspended.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.suspendingdeferral.complete
     */
    Suspend() {
        result := ComCall(9, this, "uint*", &pdwCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCount
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(10, this, "uint*", &pdwCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCount
    }

    /**
     * Retrieves the number of times BitLocker has been suspended.
     * @remarks
     * This method only applies to the OS volume, and only if it is actually suspended at the time. If the volume is not suspended or is not an OS volume, **ERROR\_NOT\_SUPPORTED** will be returned.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecProv/getsuspendcount-win32-encryptablevolume
     */
    GetSuspendCount() {
        result := ComCall(11, this, "uint*", &pdwCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCount
    }
}
