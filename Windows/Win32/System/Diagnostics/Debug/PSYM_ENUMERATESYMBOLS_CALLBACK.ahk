#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SYMBOL_INFO.ahk" { SYMBOL_INFO }

/**
 * PSYM_ENUMERATESYMBOLS_CALLBACK is an application-defined callback function used with the SymEnumSymbols, SymEnumTypes, and SymEnumTypesByName functions.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset ANSI
 */
export default struct PSYM_ENUMERATESYMBOLS_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PSYM_ENUMERATESYMBOLS_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SYMBOL_INFO>} pSymInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that 
     *       provides information about the symbol.
     * @param {Integer} SymbolSize The size of the symbol, in bytes. The size is calculated and is actually a guess. In some cases, this value 
     *       can be zero.
     * @param {Pointer<Void>} UserContext The user-defined value passed from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumtypes">SymEnumTypes</a> function, or 
     *       <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data 
     *       structure that provides context information for the callback function.
     * @returns {BOOL} If the function returns <b>TRUE</b>, the enumeration will continue.
     * 
     * If the function returns <b>FALSE</b>, the enumeration will stop.
     */
    Call(pSymInfo, SymbolSize, UserContext) {
        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SYMBOL_INFO.Ptr, pSymInfo, UInt32, SymbolSize, UserContextMarshal, UserContext, BOOL)
        return result
    }

    /**
     * A PSYM_ENUMERATESYMBOLS_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYM_ENUMERATESYMBOLS_CALLBACK {
        /**
         * Creates a PSYM_ENUMERATESYMBOLS_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(SYMBOL_INFO, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SYMBOL_INFO.Ptr, UInt32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
