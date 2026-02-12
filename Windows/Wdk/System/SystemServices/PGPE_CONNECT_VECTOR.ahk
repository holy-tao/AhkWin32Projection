#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PGPE_CONNECT_VECTOR extends IUnknown {

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
     * @param {Pointer<DEVICE_OBJECT>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {BOOLEAN} param3 
     * @param {Pointer<PGPE_SERVICE_ROUTINE>} param4 
     * @param {Pointer<Void>} param5 
     * @param {Pointer<Void>} param6 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3, param4, param5, param6) {
        param5Marshal := param5 is VarRef ? "ptr" : "ptr"
        param6Marshal := param6 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", param0, "uint", param1, "int", param2, "char", param3, "ptr", param4, param5Marshal, param5, param6Marshal, param6, "int")
        return result
    }
}
