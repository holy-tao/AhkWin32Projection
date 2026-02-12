#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset Unicode
 */
class INITIALIZE_SECURITY_CONTEXT_FN_W extends IUnknown {

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
     * @param {Pointer<SecHandle>} param0 
     * @param {Pointer<SecHandle>} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @param {Integer} param5 
     * @param {Pointer<SecBufferDesc>} param6 
     * @param {Integer} param7 
     * @param {Pointer<SecHandle>} param8 
     * @param {Pointer<SecBufferDesc>} param9 
     * @param {Pointer<Integer>} param10 
     * @param {Pointer<Integer>} param11 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11) {
        param2Marshal := param2 is VarRef ? "ushort*" : "ptr"
        param10Marshal := param10 is VarRef ? "uint*" : "ptr"
        param11Marshal := param11 is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, "ptr", param0, "ptr", param1, param2Marshal, param2, "uint", param3, "uint", param4, "uint", param5, "ptr", param6, "uint", param7, "ptr", param8, "ptr", param9, param10Marshal, param10, param11Marshal, param11, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
