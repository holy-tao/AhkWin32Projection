#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * An entry point to the symbol server DLL.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-psymbolservercallbackproc
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PSYMBOLSERVERCALLBACKPROC {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOLSERVERCALLBACKPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} action 
     * @param {Integer} data The format of this parameter depends on the value of the <i>action</i> parameter.
     * @param {Integer} _context The context information provided by calling <a href="https://docs.microsoft.com/previous-versions/ff797954(v=vs.85)">SymbolServerSetOptions</a> with SSRVOPT_SETCONTEXT.
     * @returns {BOOL} To indicate success, return <b>TRUE</b>.
     * 
     * To indicate failure, return <b>FALSE</b> and call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> function to indicate an error condition. If you do not handle a particular action code, you should also return <b>FALSE</b>. (Returning <b>TRUE</b> in this case may have unintended consequences.)
     */
    Call(action, data, _context) {
        result := DllCall(this.value, IntPtr, action, Int64, data, Int64, _context, BOOL)
        return result
    }

    /**
     * A PSYMBOLSERVERCALLBACKPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOLSERVERCALLBACKPROC {
        /**
         * Creates a PSYMBOLSERVERCALLBACKPROC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, Int64, Int64) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, Int64, Int64, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
