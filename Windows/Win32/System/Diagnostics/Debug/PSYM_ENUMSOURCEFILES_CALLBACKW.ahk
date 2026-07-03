#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SOURCEFILEW.ahk" { SOURCEFILEW }

/**
 * PSYM_ENUMSOURCEFILES_CALLBACKW (Unicode) is an application-defined callback function used with the SymEnumSourceFiles function.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-psym_enumsourcefiles_callbackw
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct PSYM_ENUMSOURCEFILES_CALLBACKW {
    value : IntPtr

    __value {
        set {
            if (value is PSYM_ENUMSOURCEFILES_CALLBACKW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SOURCEFILEW>} pSourceFile A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-sourcefile">SOURCEFILE</a> structure that provides information about the source file.
     * @param {Pointer<Void>} UserContext The user-defined value passed from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsourcefiles">SymEnumSourceFiles</a> function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context information for the callback function.
     * @returns {BOOL} If the function returns <b>TRUE</b>, the enumeration will continue.
     * 						
     * 
     * If the function returns <b>FALSE</b>, the enumeration will stop.
     */
    Call(pSourceFile, UserContext) {
        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SOURCEFILEW.Ptr, pSourceFile, UserContextMarshal, UserContext, BOOL)
        return result
    }

    /**
     * A PSYM_ENUMSOURCEFILES_CALLBACKW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYM_ENUMSOURCEFILES_CALLBACKW {
        /**
         * Creates a PSYM_ENUMSOURCEFILES_CALLBACKW pointer that invokes the given AHK function when called.
         * @param {Func(SOURCEFILEW, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOURCEFILEW.Ptr, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
