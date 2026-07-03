#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * PENUMLOADED_MODULES_CALLBACK64 (dbghelp.h) is an application-defined callback function used with the EnumerateLoadedModules64 function.
 * @remarks
 * This callback function supersedes the <i>PENUMLOADED_MODULES_CALLBACK</i> callback function. <i>PENUMLOADED_MODULES_CALLBACK</i> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-penumloaded_modules_callback64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PENUMLOADED_MODULES_CALLBACK64 {
    value : IntPtr

    __value {
        set {
            if (value is PENUMLOADED_MODULES_CALLBACK64) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} ModuleName The name of the enumerated module.
     * @param {Integer} ModuleBase The base address of the module. Note that it is possible for this address to become invalid (for example, the module may be unloaded). Use exception handling when accessing the address or passing the address to another function to prevent an access violation from occurring.
     * @param {Integer} ModuleSize The size of the module, in bytes.
     * @param {Pointer<Void>} UserContext Optional user-defined data. This value is passed from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-enumerateloadedmodules">EnumerateLoadedModules64</a>.
     * @returns {BOOL} To continue enumeration, the callback function must return <b>TRUE</b>.
     * 
     * To stop enumeration, the callback function must return <b>FALSE</b>.
     */
    Call(ModuleName, ModuleBase, ModuleSize, UserContext) {
        ModuleName := ModuleName is String ? StrPtr(ModuleName) : ModuleName

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", ModuleName, Int64, ModuleBase, UInt32, ModuleSize, UserContextMarshal, UserContext, BOOL)
        return result
    }

    /**
     * A PENUMLOADED_MODULES_CALLBACK64 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PENUMLOADED_MODULES_CALLBACK64 {
        /**
         * Creates a PENUMLOADED_MODULES_CALLBACK64 pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, Int64, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, Int64, UInt32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
