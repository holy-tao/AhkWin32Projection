#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerThreadEnum.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerThreadEnum extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerThreadEnum
     * @type {Guid}
     */
    static IID => Guid("{571194f7-25ed-419f-aa8b-7016b3159701}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Skip", "Reset", "Clone", "GetCount", "Next"]

    /**
     * Determines which pointer input frame generated the most recently retrieved message for the specified pointer and discards any queued (unretrieved) pointer input messages generated from the same pointer input frame.
     * @remarks
     * Parallel-mode devices may report pointer input in frames, that is, they may report the state and position of all pointers from that device in a single input report to the system. Ideally, applications should view the entire frame as a single input unless the application-specific requirements dictate otherwise.
     * 
     * The <b>SkipPointerFrameMessages</b> function can be used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a> function (or one of its type-specific variants) to consume entire frames as a single input.
     * 
     * When an application sees a pointer message, it can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a> function to retrieve the entire pointer input frame to which the pointer message belongs, hence obtaining an updated view of all of the pointers currently owned by the window. Note that the returned frame contains only pointers that are currently owned by the same window as the specified pointer.
     * 
     * Having retrieved the entire frame of information, the application can then call the <b>SkipPointerFrameMessages</b> function to skip remaining pointer messages associated with this frame that are pending retrieval. This saves the application the overhead of retrieving and processing the remaining messages one by one.
     * 
     * <div class="alert"><b>Warning</b>  The <b>SkipPointerFrameMessages</b> function should be used only when the caller can be sure that no other entity on the caller’s thread (such as  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>) is expecting to retrieve pending pointer messages. For this reason, <b>SkipPointerFrameMessages</b> should not be used in conjunction with Direct Manipulation when processing multiple, simultaneous interactions.</div>
     * <div> </div>
     * Note that the information retrieved is associated with the pointer frame most recently retrieved by the calling thread. Once the calling thread retrieves its next message, the information associated with the previous pointer frame may no longer be available.
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds with no action.
     * 
     * If the calling thread does not own the window to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
     * @param {Integer} celt 
     * @returns {HRESULT} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-skippointerframemessages
     */
    Skip(celt) {
        result := ComCall(3, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the time-out period or other mechanism that TPM manufacturers implement to protect against dictionary attacks on TPM authorization values.
     * @remarks
     * This method calls the TPM\_ResetLockValue command on the TPM. The exact behavior of this method varies among TPM manufacturers. Documentation from the computer or TPM manufacturer may provide additional information on the implementation of the anti-dictionary attack mechanism.
     * 
     * In general, manufacturers can detect dictionary attacks by keeping track of failed authentications. If the number or frequency of failures become high enough, the TPM will lock out further commands for a certain time. Generally, the initial time-out period will be short, to allow a legitimate user a chance to correct the situation. If failures continue, the duration of each subsequent time-out period may increase rapidly.
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
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
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Creates a recognizer context that contains the same settings as the original. The new recognizer context does not include the ink or recognition results of the original.
     * @remarks
     * The settings  for this context include the recognition guide, character Autocomplete mode, and any factoids that improve the recognition results. An example of a factoid may include whether the ink is a phone number, a name, or a URL. The TextContext and Wordlists are preserved in the new context.
     * @returns {ICorProfilerThreadEnum} 
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-clonecontext
     */
    Clone() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return ICorProfilerThreadEnum(ppEnum)
    }

    /**
     * Retrieves the number of tagged elements in a given color profile.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getcountcolorprofileelements
     */
    GetCount() {
        result := ComCall(6, this, "uint*", &pcelt := 0, "HRESULT")
        return pcelt
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Pointer>} ids 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, ids, pceltFetched) {
        idsMarshal := ids is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", celt, idsMarshal, ids, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }
}
