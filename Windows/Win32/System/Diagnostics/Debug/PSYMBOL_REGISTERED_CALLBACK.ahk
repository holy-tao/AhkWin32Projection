#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * PSYMBOL_REGISTERED_CALLBACK (dbghelp.h) is an application-defined callback function used with the SymRegisterCallback64 function.
 * @remarks
 * The calling application gets called through the registered callback function as a result of another call to one of the symbol handler functions. The calling application must be prepared for the possible side effects that this can cause. If the application has only one callback function that is being used by multiple threads, then care may be necessary to synchronize some types of data access while in the context of the callback function.
 * 
 * This callback function supersedes the <i>PSYMBOL_REGISTERED_CALLBACK</i> callback function.  <i>PSYMBOL_REGISTERED_CALLBACK</i> is defined as follows in Dbghelp.h.
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-psymbol_registered_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PSYMBOL_REGISTERED_CALLBACK extends IUnknown {

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
     * @param {Integer} ActionCode 
     * @param {Pointer<Void>} CallbackData 
     * @param {Pointer<Void>} UserContext 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hProcess, ActionCode, CallbackData, UserContext) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        CallbackDataMarshal := CallbackData is VarRef ? "ptr" : "ptr"
        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", hProcess, "uint", ActionCode, CallbackDataMarshal, CallbackData, UserContextMarshal, UserContext, "int")
        return result
    }
}
