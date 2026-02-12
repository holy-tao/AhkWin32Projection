#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class POUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK extends IUnknown {

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
     * @param {HANDLE} Process 
     * @param {Pointer<Void>} TableAddress 
     * @param {Pointer<Integer>} Entries 
     * @param {Pointer<Pointer<IMAGE_RUNTIME_FUNCTION_ENTRY>>} Functions 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Process, TableAddress, Entries, Functions) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        TableAddressMarshal := TableAddress is VarRef ? "ptr" : "ptr"
        EntriesMarshal := Entries is VarRef ? "uint*" : "ptr"
        FunctionsMarshal := Functions is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", Process, TableAddressMarshal, TableAddress, EntriesMarshal, Entries, FunctionsMarshal, Functions, "uint")
        return result
    }
}
