#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by GINA to assign protection to the shell program of a newly logged-on user.
 * @remarks
 * The Windows API 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessasusera">CreateProcessAsUser</a> function supersedes <b>WlxAssignShellProtection</b>. Call <b>CreateProcessAsUser</b> in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxactivateusershell">WlxActivateUserShell</a> to create the shell process and set its protections in a single call.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_assign_shell_protection
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_ASSIGN_SHELL_PROTECTION extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} hWlx 
     * @param {HANDLE} hToken 
     * @param {HANDLE} hProcess 
     * @param {HANDLE} hThread 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx, hToken, hProcess, hThread) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        result := ComCall(3, this, "ptr", hWlx, "ptr", hToken, "ptr", hProcess, "ptr", hThread, "int")
        return result
    }
}
