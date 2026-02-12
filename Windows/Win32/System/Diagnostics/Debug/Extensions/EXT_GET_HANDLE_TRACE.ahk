#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class EXT_GET_HANDLE_TRACE extends IUnknown {

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
     * @param {IDebugClient} Client 
     * @param {Integer} TraceType 
     * @param {Integer} StartIndex 
     * @param {Pointer<Integer>} HandleValue 
     * @param {Pointer<Integer>} StackFunctions 
     * @param {Integer} StackTraceSize 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Client, TraceType, StartIndex, HandleValue, StackFunctions, StackTraceSize) {
        HandleValueMarshal := HandleValue is VarRef ? "uint*" : "ptr"
        StackFunctionsMarshal := StackFunctions is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", Client, "uint", TraceType, "uint", StartIndex, HandleValueMarshal, HandleValue, StackFunctionsMarshal, StackFunctions, "uint", StackTraceSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
