#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * PGET_MODULE_BASE_ROUTINE64 (dbghelp.h) is an application-defined callback function used with the StackWalk64 function.
 * @remarks
 * This callback function supersedes the <i>PGET_MODULE_BASE_ROUTINE</i> callback function.  <i>PGET_MODULE_BASE_ROUTINE</i> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-pget_module_base_routine64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PGET_MODULE_BASE_ROUTINE64 {
    value : IntPtr

    __value {
        set {
            if (value is PGET_MODULE_BASE_ROUTINE64) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hProcess A handle to the process for which the stack trace is generated.
     * @param {Integer} _Address An address within the module image to be located.
     * @returns {Integer} The function returns the base address of the module.
     */
    Call(hProcess, _Address) {
        result := DllCall(this.value, HANDLE, hProcess, Int64, _Address, Int64)
        return result
    }

    /**
     * A PGET_MODULE_BASE_ROUTINE64 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_MODULE_BASE_ROUTINE64 {
        /**
         * Creates a PGET_MODULE_BASE_ROUTINE64 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, Int64) => Int64} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Int64, Int64])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
