#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * An application-defined callback function. Specify a pointer to this function when calling the InitOnceExecuteOnce function.
 * @remarks
 * This function can create a synchronization object and return it in the <i>lpContext</i> parameter.
 * 
 * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/synchapi/nc-synchapi-pinit_once_fn
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PINIT_ONCE_FN extends IUnknown {

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
     * @param {Pointer<INIT_ONCE>} InitOnce 
     * @param {Pointer<Void>} Parameter 
     * @param {Pointer<Pointer<Void>>} Context_ 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(InitOnce, Parameter, Context_) {
        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"
        Context_Marshal := Context_ is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", InitOnce, ParameterMarshal, Parameter, Context_Marshal, Context_, "int")
        return result
    }
}
