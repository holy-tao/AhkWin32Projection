#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * PFINDFILEINPATHCALLBACKW (Unicode) is an application-defined callback function used with the SymFindFileInPath function.
 * @remarks
 * > [!NOTE]
 * > The dbghelp.h header defines PFINDFILEINPATHCALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-pfindfileinpathcallbackw
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct PFINDFILEINPATHCALLBACKW {
    value : IntPtr

    __value {
        set {
            if (value is PFINDFILEINPATHCALLBACKW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} filename 
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
     * A PFINDFILEINPATHCALLBACKW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFINDFILEINPATHCALLBACKW {
        /**
         * Creates a PFINDFILEINPATHCALLBACKW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
