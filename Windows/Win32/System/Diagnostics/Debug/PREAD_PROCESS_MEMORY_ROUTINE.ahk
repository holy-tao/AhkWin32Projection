#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * PREAD_PROCESS_MEMORY_ROUTINE (dbghelp.h) is an application-defined callback function used with the StackWalk64 function.
 * @remarks
 * In many cases, this function can best service the callback with a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-readprocessmemory">ReadProcessMemory</a>.
 * 
 * This function should read as much of the requested memory as possible. The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-stackwalk">StackWalk64</a> function handles the case where only part of the requested memory is read.
 * 
 * This callback function supersedes the <i>PREAD_PROCESS_MEMORY_ROUTINE</i> callback function.  <i>PREAD_PROCESS_MEMORY_ROUTINE</i> is defined as follows in Dbghelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-pread_process_memory_routine
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PREAD_PROCESS_MEMORY_ROUTINE extends IUnknown {

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
     * @param {Integer} lpBaseAddress 
     * @param {Pointer} lpBuffer 
     * @param {Integer} nSize 
     * @param {Pointer<Integer>} lpNumberOfBytesRead 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hProcess, lpBaseAddress, lpBuffer, nSize, lpNumberOfBytesRead) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpNumberOfBytesReadMarshal := lpNumberOfBytesRead is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hProcess, "uint", lpBaseAddress, "ptr", lpBuffer, "uint", nSize, lpNumberOfBytesReadMarshal, lpNumberOfBytesRead, "int")
        return result
    }
}
