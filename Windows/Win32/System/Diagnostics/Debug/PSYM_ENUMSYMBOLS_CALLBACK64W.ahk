#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * PSYM_ENUMSYMBOLS_CALLBACK64W (Unicode) is an application-defined callback function used with the SymEnumerateSymbols64 function.
 * @remarks
 * The calling application is called once per symbol until all the symbols are enumerated or until the enumeration callback function returns <b>FALSE</b>.
 * 
 * This callback function supersedes the <i>PSYM_ENUMSYMBOLS_CALLBACK</i> callback function.  <i>PSYM_ENUMSYMBOLS_CALLBACK</i> is defined as follows in Dbghelp.h.
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-psym_enumsymbols_callback64w
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct PSYM_ENUMSYMBOLS_CALLBACK64W {
    value : IntPtr

    __value {
        set {
            if (value is PSYM_ENUMSYMBOLS_CALLBACK64W) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} SymbolName The name of the symbol. The name can be undecorated if the SYMOPT_UNDNAME option is used with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetoptions">SymSetOptions</a> function.
     * @param {Integer} SymbolAddress The virtual address for the beginning of the symbol.
     * @param {Integer} SymbolSize The size of the symbol, in bytes. The size is calculated and is actually a best-guess value. In some cases, the value can be zero.
     * @param {Pointer<Void>} UserContext The user-defined value specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumeratesymbols">SymEnumerateSymbols64</a>, or <b>NULL</b>. Typically, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some type of context.
     * @returns {BOOL} If the function returns <b>TRUE</b>, the enumeration will continue.
     * 
     * If the function returns <b>FALSE</b>, the enumeration will stop.
     */
    Call(SymbolName, SymbolAddress, SymbolSize, UserContext) {
        SymbolName := SymbolName is String ? StrPtr(SymbolName) : SymbolName

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", SymbolName, Int64, SymbolAddress, UInt32, SymbolSize, UserContextMarshal, UserContext, BOOL)
        return result
    }

    /**
     * A PSYM_ENUMSYMBOLS_CALLBACK64W that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYM_ENUMSYMBOLS_CALLBACK64W {
        /**
         * Creates a PSYM_ENUMSYMBOLS_CALLBACK64W pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, Int64, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, Int64, UInt32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
