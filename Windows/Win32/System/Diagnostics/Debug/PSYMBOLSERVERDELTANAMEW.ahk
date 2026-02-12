#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset Unicode
 */
class PSYMBOLSERVERDELTANAMEW extends IUnknown {

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
     * @param {PWSTR} param0 
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @param {Integer} param5 
     * @param {Integer} param6 
     * @param {PWSTR} param7 
     * @param {Pointer} param8 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3, param4, param5, param6, param7, param8) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param7 := param7 is String ? StrPtr(param7) : param7

        param1Marshal := param1 is VarRef ? "ptr" : "ptr"
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", param0, param1Marshal, param1, "uint", param2, "uint", param3, param4Marshal, param4, "uint", param5, "uint", param6, "ptr", param7, "ptr", param8, "int")
        return result
    }
}
