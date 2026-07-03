#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An application-defined timer completion routine. Specify this address when calling the SetWaitableTimer function.
 * @remarks
 * The completion routine is executed by the thread that activates the timer using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-setwaitabletimer">SetWaitableTimer</a>. However, the thread must be in an alertable state. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Sync/asynchronous-procedure-calls">Asynchronous Procedure Calls</a>.
 * @see https://learn.microsoft.com/windows/win32/api/synchapi/nc-synchapi-ptimerapcroutine
 * @namespace Windows.Win32.System.Threading
 */
export default struct PTIMERAPCROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PTIMERAPCROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} lpArgToCompletionRoutine The value passed to the function using the <i>lpArgToCompletionRoutine</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-setwaitabletimer">SetWaitableTimer</a> function.
     * @param {Integer} dwTimerLowValue The low-order portion of the UTC-based time at which the timer was signaled. This value corresponds to the <b>dwLowDateTime</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure. For more information about UTC-based time, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/system-time">System Time</a>.
     * @param {Integer} dwTimerHighValue The high-order portion of the UTC-based time at which the timer was signaled. This value corresponds to the <b>dwHighDateTime</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(lpArgToCompletionRoutine, dwTimerLowValue, dwTimerHighValue) {
        lpArgToCompletionRoutineMarshal := lpArgToCompletionRoutine is VarRef ? "ptr" : "ptr"

        DllCall(this.value, lpArgToCompletionRoutineMarshal, lpArgToCompletionRoutine, UInt32, dwTimerLowValue, UInt32, dwTimerHighValue)
    }

    /**
     * A PTIMERAPCROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTIMERAPCROUTINE {
        /**
         * Creates a PTIMERAPCROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
