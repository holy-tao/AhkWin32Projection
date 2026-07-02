#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * An application-defined function used with the SymEnumProcesses function.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-psym_enumprocesses_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PSYM_ENUMPROCESSES_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PSYM_ENUMPROCESSES_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hProcess A handle to the process.
     * @param {Pointer<Void>} UserContext The user-defined value passed from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumprocesses">SymEnumProcesses</a> function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context information for the callback function.
     * @returns {BOOL} If the function returns <b>TRUE</b>, the enumeration will continue.
     * 						
     * 
     * If the function returns <b>FALSE</b>, the enumeration will stop.
     */
    Call(hProcess, UserContext) {
        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HANDLE, hProcess, UserContextMarshal, UserContext, BOOL)
        return result
    }

    /**
     * A PSYM_ENUMPROCESSES_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYM_ENUMPROCESSES_CALLBACK {
        /**
         * Creates a PSYM_ENUMPROCESSES_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
