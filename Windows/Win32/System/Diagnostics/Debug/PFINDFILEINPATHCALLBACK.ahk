#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * PFINDFILEINPATHCALLBACK (dbghelp.h) is an application-defined callback function used with the SymFindFileInPath function.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-pfindfileinpathcallback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset ANSI
 */
export default struct PFINDFILEINPATHCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFINDFILEINPATHCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} filename The name of the file located by <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symfindfileinpath">SymFindFileInPath</a>.
     * @param {Pointer<Void>} _context The user-defined value specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symfindfileinpath">SymFindFileInPath</a>, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides some context for the callback function.
     * @returns {BOOL} Return <b>TRUE</b> to continue searching.
     * 
     * Return <b>FALSE</b> to end the search.
     */
    Call(filename, _context) {
        filename := filename is String ? StrPtr(filename) : filename

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", filename, _contextMarshal, _context, BOOL)
        return result
    }

    /**
     * A PFINDFILEINPATHCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFINDFILEINPATHCALLBACK {
        /**
         * Creates a PFINDFILEINPATHCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
