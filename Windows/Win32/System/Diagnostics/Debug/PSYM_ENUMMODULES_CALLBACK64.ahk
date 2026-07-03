#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * PSYM_ENUMMODULES_CALLBACK64 (dbghelp.h) is an application-defined callback function used with the SymEnumerateModules64 function.
 * @remarks
 * The calling application is called once per module until all modules are enumerated, or until the enumeration callback function returns <b>FALSE</b>.
 * 
 * This callback function supersedes the <i>PSYM_ENUMMODULES_CALLBACK</i> callback function.  <i>PSYM_ENUMMODULES_CALLBACK</i> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-psym_enummodules_callback64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PSYM_ENUMMODULES_CALLBACK64 {
    value : IntPtr

    __value {
        set {
            if (value is PSYM_ENUMMODULES_CALLBACK64) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} ModuleName The name of the module.
     * @param {Integer} BaseOfDll The base address where the module is loaded into memory.
     * @param {Pointer<Void>} UserContext The user-defined value specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumeratemodules">SymEnumerateModules64</a>, or <b>NULL</b>. Typically, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some type of context.
     * @returns {BOOL} If the return value is <b>TRUE</b>, the enumeration will continue.
     * 
     * If the return value is <b>FALSE</b>, the enumeration will stop.
     */
    Call(ModuleName, BaseOfDll, UserContext) {
        ModuleName := ModuleName is String ? StrPtr(ModuleName) : ModuleName

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", ModuleName, Int64, BaseOfDll, UserContextMarshal, UserContext, BOOL)
        return result
    }

    /**
     * A PSYM_ENUMMODULES_CALLBACK64 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYM_ENUMMODULES_CALLBACK64 {
        /**
         * Creates a PSYM_ENUMMODULES_CALLBACK64 pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, Int64, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, Int64, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
