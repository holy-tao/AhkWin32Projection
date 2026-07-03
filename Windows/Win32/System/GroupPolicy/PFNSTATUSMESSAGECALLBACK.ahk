#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The StatusMessageCallback function is an application-defined callback function used to display status messages when applying policy.
 * @remarks
 * Pass a pointer to the 
 * <b>StatusMessageCallback</b> function when the system calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nc-userenv-pfnprocessgrouppolicy">ProcessGroupPolicy</a> or the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nc-userenv-pfnprocessgrouppolicyex">ProcessGroupPolicyEx</a> callback function.
 * 
 * The status user interface has two modes: standard and verbose. Verbose messages are displayed only when the computer is in verbose mode. To enable verbose mode, set the following registry value to 1, log out, and log on. There is no need to restart the computer.
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>Winlogon</b>&#92;<b>VerboseStatus</b>
 * 
 * 
 * 
 * <div class="alert"><b>Warning</b>  Do not call the 
 * <b>StatusMessageCallback</b> function from a background thread because you may overwrite another thread's status message.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/userenv/nc-userenv-pfnstatusmessagecallback
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct PFNSTATUSMESSAGECALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFNSTATUSMESSAGECALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BOOL} bVerbose Specifies whether the message is verbose. If this parameter is <b>TRUE</b>, the message is verbose. If this parameter is <b>FALSE</b>, the message is not verbose.
     * @param {PWSTR} lpMessage Pointer to a buffer that contains the message string.
     * @returns {Integer} If the message was displayed successfully, return <b>ERROR_SUCCESS</b>. Otherwise, return a 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     */
    Call(bVerbose, lpMessage) {
        lpMessage := lpMessage is String ? StrPtr(lpMessage) : lpMessage

        result := DllCall(this.value, BOOL, bVerbose, "ptr", lpMessage, UInt32)
        return result
    }

    /**
     * A PFNSTATUSMESSAGECALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNSTATUSMESSAGECALLBACK {
        /**
         * Creates a PFNSTATUSMESSAGECALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(BOOL, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOOL, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
