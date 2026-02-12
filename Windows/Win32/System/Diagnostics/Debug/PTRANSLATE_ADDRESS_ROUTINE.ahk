#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * PTRANSLATE_ADDRESS_ROUTINE (dbghelp.h) is an application-defined callback function used with the StackWalk64 function.
 * @remarks
 * This callback function supersedes the <i>PTRANSLATE_ADDRESS_ROUTINE</i> callback function.  <i>PTRANSLATE_ADDRESS_ROUTINE</i> is defined as follows in Dbghelp.h.
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-ptranslate_address_routine
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PTRANSLATE_ADDRESS_ROUTINE extends IUnknown {

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
     * @param {HANDLE} hThread 
     * @param {Pointer<ADDRESS>} lpaddr 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hProcess, hThread, lpaddr) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        result := ComCall(3, this, "ptr", hProcess, "ptr", hThread, "ptr", lpaddr, "uint")
        return result
    }
}
