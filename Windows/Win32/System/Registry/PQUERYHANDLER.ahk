#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Registry
 * @version v4.0.30319
 */
class PQUERYHANDLER extends IUnknown {

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
     * @param {Pointer<Void>} keycontext 
     * @param {Pointer<val_context>} val_list 
     * @param {Integer} num_vals 
     * @param {Pointer<Void>} outputbuffer 
     * @param {Pointer<Integer>} total_outlen 
     * @param {Integer} input_blen 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(keycontext, val_list, num_vals, outputbuffer, total_outlen, input_blen) {
        keycontextMarshal := keycontext is VarRef ? "ptr" : "ptr"
        outputbufferMarshal := outputbuffer is VarRef ? "ptr" : "ptr"
        total_outlenMarshal := total_outlen is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, keycontextMarshal, keycontext, "ptr", val_list, "uint", num_vals, outputbufferMarshal, outputbuffer, total_outlenMarshal, total_outlen, "uint", input_blen, "uint")
        return result
    }
}
