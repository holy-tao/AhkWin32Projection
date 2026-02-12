#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-psymbol_funcentry_callback64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PSYMBOL_FUNCENTRY_CALLBACK64 extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} hProcess 
     * @param {Integer} AddrBase 
     * @param {Integer} UserContext 
     * @returns {Pointer<Void>} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hProcess, AddrBase, UserContext) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        result := ComCall(3, this, "ptr", hProcess, "uint", AddrBase, "uint", UserContext, "ptr")
        return result
    }
}
