#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * PFUNCTION_TABLE_ACCESS_ROUTINE64 (dbghelp.h) is an application-defined callback function used with the StackWalk64 function.
 * @remarks
 * This callback function supersedes the <i>PFUNCTION_TABLE_ACCESS_ROUTINE</i> callback function.  <i>PFUNCTION_TABLE_ACCESS_ROUTINE</i> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-pfunction_table_access_routine64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PFUNCTION_TABLE_ACCESS_ROUTINE64 {
    value : IntPtr

    __value {
        set {
            if (value is PFUNCTION_TABLE_ACCESS_ROUTINE64) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} ahProcess A handle to the process for which the stack trace is generated.
     * @param {Integer} AddrBase The address of the instruction to be located.
     * @returns {Pointer<Void>} The function returns a pointer to the run-time function table. On an x86 computer, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-fpo_data">FPO_DATA</a> structure. On an Alpha computer, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_function_entry">IMAGE_FUNCTION_ENTRY</a> structure.
     */
    Call(ahProcess, AddrBase) {
        result := DllCall(this.value, HANDLE, ahProcess, Int64, AddrBase, IntPtr)
        return result
    }

    /**
     * A PFUNCTION_TABLE_ACCESS_ROUTINE64 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFUNCTION_TABLE_ACCESS_ROUTINE64 {
        /**
         * Creates a PFUNCTION_TABLE_ACCESS_ROUTINE64 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, Int64) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Int64, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
