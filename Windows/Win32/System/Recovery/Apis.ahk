#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Recovery
 * @version v4.0.30319
 */
class Recovery {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Registers the active instance of an application for recovery.
     * @param {Pointer<APPLICATION_RECOVERY_CALLBACK>} pRecoveyCallback A pointer to the recovery callback function. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa373202(v=vs.85)">ApplicationRecoveryCallback</a>.
     * @param {Pointer<Void>} pvParameter A pointer to a variable to be passed to the callback function. Can be <b>NULL</b>.
     * @param {Integer} dwPingInterval The recovery ping interval, in milliseconds. By default, the interval is 5 seconds (RECOVERY_DEFAULT_PING_INTERVAL). The maximum interval is 5 minutes. If you specify zero, the default interval is used. 
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-applicationrecoveryinprogress">ApplicationRecoveryInProgress</a> function within the specified interval to indicate to ARR that you are still actively recovering; otherwise, WER terminates recovery. Typically, you perform recovery in a loop with each iteration lasting no longer than the ping interval. Each iteration performs a block of recovery work followed by a call to <b>ApplicationRecoveryInProgress</b>. Since you also use <b>ApplicationRecoveryInProgress</b> to determine if the user wants to cancel recovery, you should consider a smaller interval, so you do not perform a lot of work unnecessarily.
     * @param {Integer} dwFlags Reserved for future use. Set to zero.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error; the registration failed.
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
     * The ping interval cannot be more than five minutes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-registerapplicationrecoverycallback
     * @since windows6.0.6000
     */
    static RegisterApplicationRecoveryCallback(pRecoveyCallback, pvParameter, dwPingInterval, dwFlags) {
        pvParameterMarshal := pvParameter is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\RegisterApplicationRecoveryCallback", "ptr", pRecoveyCallback, pvParameterMarshal, pvParameter, "uint", dwPingInterval, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes the active instance of an application from the recovery list.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-unregisterapplicationrecoverycallback
     * @since windows6.0.6000
     */
    static UnregisterApplicationRecoveryCallback() {
        result := DllCall("KERNEL32.dll\UnregisterApplicationRecoveryCallback", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers the active instance of an application for restart.
     * @param {PWSTR} pwzCommandline A pointer to a Unicode string that specifies the command-line arguments for the application when it is restarted. The maximum size of the command line that you can specify is RESTART_MAX_CMD_LINE characters. Do not include the name of the executable in the command line; this function adds it for you.  
     * 
     * If this parameter is <b>NULL</b> or an empty string, the previously registered command line is removed. If the argument contains spaces, use quotes around the argument.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error.
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
     * The specified command line is too long.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-registerapplicationrestart
     * @since windows6.0.6000
     */
    static RegisterApplicationRestart(pwzCommandline, dwFlags) {
        pwzCommandline := pwzCommandline is String ? StrPtr(pwzCommandline) : pwzCommandline

        result := DllCall("KERNEL32.dll\RegisterApplicationRestart", "ptr", pwzCommandline, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes the active instance of an application from the restart list.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-unregisterapplicationrestart
     * @since windows6.0.6000
     */
    static UnregisterApplicationRestart() {
        result := DllCall("KERNEL32.dll\UnregisterApplicationRestart", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a pointer to the callback routine registered for the specified process. The address returned is in the virtual address space of the process.
     * @param {HANDLE} hProcess A handle to the process. This handle must have the PROCESS_VM_READ access right.
     * @param {Pointer<Pointer<APPLICATION_RECOVERY_CALLBACK>>} pRecoveryCallback A pointer to the recovery callback function. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa373202(v=vs.85)">ApplicationRecoveryCallback</a>.
     * @param {Pointer<Pointer<Void>>} ppvParameter A pointer to the callback parameter.
     * @param {Pointer<Integer>} pdwPingInterval The recovery ping interval, in 100-nanosecond intervals.
     * @param {Pointer<Integer>} pdwFlags Reserved for future use.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application did not register for recovery.
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
     * One or more parameters are not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getapplicationrecoverycallback
     * @since windows6.0.6000
     */
    static GetApplicationRecoveryCallback(hProcess, pRecoveryCallback, ppvParameter, pdwPingInterval, pdwFlags) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        pRecoveryCallbackMarshal := pRecoveryCallback is VarRef ? "ptr*" : "ptr"
        ppvParameterMarshal := ppvParameter is VarRef ? "ptr*" : "ptr"
        pdwPingIntervalMarshal := pdwPingInterval is VarRef ? "uint*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetApplicationRecoveryCallback", "ptr", hProcess, pRecoveryCallbackMarshal, pRecoveryCallback, ppvParameterMarshal, ppvParameter, pdwPingIntervalMarshal, pdwPingInterval, pdwFlagsMarshal, pdwFlags, "int")
        return result
    }

    /**
     * Retrieves the restart information registered for the specified process.
     * @param {HANDLE} hProcess A handle to the process. This handle must have the PROCESS_VM_READ access right.
     * @param {PWSTR} pwzCommandline A pointer to a buffer that receives the restart command line specified by the application when it called the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registerapplicationrestart">RegisterApplicationRestart</a> function. The maximum size of the command line, in characters, is RESTART_MAX_CMD_LINE. Can be <b>NULL</b> if <i>pcchSize</i> is zero.
     * @param {Pointer<Integer>} pcchSize On input, specifies the size of the <i>pwzCommandLine</i> buffer, in characters. 
     * 
     * If the buffer is not large enough to receive the command line, the function fails with HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) and sets this parameter to the required buffer size, in characters.
     * 
     * On output, specifies the size of the buffer that was used.
     * 
     * To determine the required buffer size, set <i>pwzCommandLine</i> to <b>NULL</b> and this parameter to zero. The size includes one for the <b>null</b>-terminator character. Note that the function returns S_OK, not HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) in this case.
     * @param {Pointer<Integer>} pdwFlags A pointer to a variable that receives the flags specified by the application when it called the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registerapplicationrestart">RegisterApplicationRestart</a> function.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application did not register for restart.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pwzCommandLine</i> buffer is too small. The function returns the required buffer size in <i>pcchSize</i>. Use the required size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getapplicationrestartsettings
     * @since windows6.0.6000
     */
    static GetApplicationRestartSettings(hProcess, pwzCommandline, pcchSize, pdwFlags) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        pwzCommandline := pwzCommandline is String ? StrPtr(pwzCommandline) : pwzCommandline

        pcchSizeMarshal := pcchSize is VarRef ? "uint*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetApplicationRestartSettings", "ptr", hProcess, "ptr", pwzCommandline, pcchSizeMarshal, pcchSize, pdwFlagsMarshal, pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Indicates that the calling application is continuing to recover data.
     * @param {Pointer<BOOL>} pbCancelled Indicates whether the user has canceled the recovery process. Set by WER if the user clicks the Cancel button.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You can call this function only after Windows Error Reporting has called your recovery callback function.
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
     * The <i>pbCancelled</i> cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-applicationrecoveryinprogress
     * @since windows6.0.6000
     */
    static ApplicationRecoveryInProgress(pbCancelled) {
        result := DllCall("KERNEL32.dll\ApplicationRecoveryInProgress", "ptr", pbCancelled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Indicates that the calling application has completed its data recovery.
     * @remarks
     * 
     * This should be the last call that you make in your callback because your application terminates as soon as this function is called.
     * 
     * 
     * @param {BOOL} bSuccess Specify <b>TRUE</b> to indicate that the data was successfully recovered; otherwise, <b>FALSE</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-applicationrecoveryfinished
     * @since windows6.0.6000
     */
    static ApplicationRecoveryFinished(bSuccess) {
        DllCall("KERNEL32.dll\ApplicationRecoveryFinished", "int", bSuccess)
    }

;@endregion Methods
}
