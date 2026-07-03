#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * PSYMBOL_REGISTERED_CALLBACK64 (dbghelp.h) is an application-defined callback function used with the SymRegisterCallback64 function.
 * @remarks
 * The calling application gets called through the registered callback function as a result of another call to one of the symbol handler functions. The calling application must be prepared for the possible side effects that this can cause. If the application has only one callback function that is being used by multiple threads, then care may be necessary to synchronize some types of data access while in the context of the callback function.
 * 
 * This callback function supersedes the <i>PSYMBOL_REGISTERED_CALLBACK</i> callback function.  <i>PSYMBOL_REGISTERED_CALLBACK</i> is defined as follows in Dbghelp.h.
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-psymbol_registered_callback64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PSYMBOL_REGISTERED_CALLBACK64 {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOL_REGISTERED_CALLBACK64) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} ActionCode 
     * @param {Integer} CallbackData Data for the operation. The format of this data depends on the value of the <i>ActionCode</i> parameter.
     * 
     * If the callback function was registered with <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symregistercallback">SymRegisterCallbackW64</a>, the data is a Unicode string or data structure. Otherwise, the data uses ANSI format.
     * @param {Integer} UserContext User-defined value specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symregistercallback">SymRegisterCallback64</a>, or <b>NULL</b>. Typically, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some context.
     * @returns {BOOL} To indicate success handling the code, return <b>TRUE</b>.
     * 
     * To indicate failure handling the code, return <b>FALSE</b>. If your code does not handle a particular code, you should also return <b>FALSE</b>. (Returning <b>TRUE</b> in this case may have unintended consequences.)
     */
    Call(hProcess, ActionCode, CallbackData, UserContext) {
        result := DllCall(this.value, HANDLE, hProcess, UInt32, ActionCode, Int64, CallbackData, Int64, UserContext, BOOL)
        return result
    }

    /**
     * A PSYMBOL_REGISTERED_CALLBACK64 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOL_REGISTERED_CALLBACK64 {
        /**
         * Creates a PSYMBOL_REGISTERED_CALLBACK64 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, Int64, Int64) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, Int64, Int64, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
