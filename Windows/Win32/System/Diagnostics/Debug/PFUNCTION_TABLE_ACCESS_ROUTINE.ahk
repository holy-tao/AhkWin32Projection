#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * PFUNCTION_TABLE_ACCESS_ROUTINE (dbghelp.h) is an application-defined callback function used with the StackWalk64 function.
 * @remarks
 * This callback function supersedes the <i>PFUNCTION_TABLE_ACCESS_ROUTINE</i> callback function.  <i>PFUNCTION_TABLE_ACCESS_ROUTINE</i> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-pfunction_table_access_routine
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PFUNCTION_TABLE_ACCESS_ROUTINE extends IUnknown {

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
     * @returns {Pointer<Void>} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hProcess, AddrBase) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        result := ComCall(3, this, "ptr", hProcess, "uint", AddrBase, "ptr")
        return result
    }
}
