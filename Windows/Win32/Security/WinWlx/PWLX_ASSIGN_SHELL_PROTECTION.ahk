#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Called by GINA to assign protection to the shell program of a newly logged-on user.
 * @remarks
 * The Windows API 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessasusera">CreateProcessAsUser</a> function supersedes <b>WlxAssignShellProtection</b>. Call <b>CreateProcessAsUser</b> in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxactivateusershell">WlxActivateUserShell</a> to create the shell process and set its protections in a single call.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_assign_shell_protection
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_ASSIGN_SHELL_PROTECTION {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_ASSIGN_SHELL_PROTECTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hWlx Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/w-gly">Winlogon</a> handle passed to GINA in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a> call.
     * @param {HANDLE} hToken Specifies the handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary token</a>.
     * @param {HANDLE} hProcess Specifies the handle to the process to modify. The process must be created in the suspended state, and this should be the handle returned in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> structure.
     * @param {HANDLE} hThread Specifies the handle to the initial thread of the process.
     * @returns {Integer} The <b>WlxAssignShellProtection</b> function returns any errors encountered while trying to assign protection.
     */
    Call(hWlx, hToken, hProcess, hThread) {
        result := DllCall(this.value, HANDLE, hWlx, HANDLE, hToken, HANDLE, hProcess, HANDLE, hThread, Int32)
        return result
    }

    /**
     * A PWLX_ASSIGN_SHELL_PROTECTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_ASSIGN_SHELL_PROTECTION {
        /**
         * Creates a PWLX_ASSIGN_SHELL_PROTECTION pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, HANDLE, HANDLE) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, HANDLE, HANDLE, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
