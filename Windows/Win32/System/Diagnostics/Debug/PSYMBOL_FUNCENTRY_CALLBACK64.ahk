#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * PSYMBOL_FUNCENTRY_CALLBACK64 (dbghelp.h) is an application-defined callback function used with the SymRegisterFunctionEntryCallback64 function.
 * @remarks
 * The structure must be returned in exactly the form it exists in the process being debugged. Some members may be pointers to other locations in the process address space. The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pread_process_memory_routine">ReadProcessMemoryProc64</a> callback function may be called to retrieve the information at these locations.
 * 
 * The calling application gets called through the registered callback function as a result of a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-stackwalk">StackWalk64</a> function. The calling application must be prepared for the possible side effects that this can cause. If the application has only one callback function that is being used by multiple threads, then it may be necessary to synchronize some types of data access while in the context of the callback function.
 * 
 * This function is similar to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfunction_table_access_routine">FunctionTableAccessProc64</a> callback function. The difference is that 
 * <b>FunctionTableAccessProc64</b> returns an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_function_entry">IMAGE_FUNCTION_ENTRY</a> structure, while this function returns an <b>IMAGE_RUNTIME_FUNCTION_ENTRY</b> structure.
 * 
 * This callback function supersedes the <i>PSYMBOL_FUNCENTRY_CALLBACK</i> callback function.  <i>PSYMBOL_FUNCENTRY_CALLBACK</i> is defined as follows in Dbghelp.h.
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-psymbol_funcentry_callback64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PSYMBOL_FUNCENTRY_CALLBACK64 {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOL_FUNCENTRY_CALLBACK64) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-stackwalk">StackWalk64</a> function.
     * @param {Integer} AddrBase The address of an instruction for which the callback function should return a function table entry.
     * @param {Integer} UserContext The user-defined value specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symregisterfunctionentrycallback">SymRegisterFunctionEntryCallback64</a>, or <b>NULL</b>. Typically, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some context.
     * @returns {Pointer<Void>} Return the value <b>NULL</b> if no function table entry is available.
     * 
     * On success, return a pointer to an <b>IMAGE_RUNTIME_FUNCTION_ENTRY</b> structure. Refer to the header file WinNT.h for the definition of this function.
     */
    Call(hProcess, AddrBase, UserContext) {
        result := DllCall(this.value, HANDLE, hProcess, Int64, AddrBase, Int64, UserContext, IntPtr)
        return result
    }

    /**
     * A PSYMBOL_FUNCENTRY_CALLBACK64 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOL_FUNCENTRY_CALLBACK64 {
        /**
         * Creates a PSYMBOL_FUNCENTRY_CALLBACK64 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, Int64, Int64) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Int64, Int64, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
