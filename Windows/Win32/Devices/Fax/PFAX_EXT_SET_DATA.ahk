#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAX_EXT_SET_DATA extends IUnknown {

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
     * @param {HINSTANCE} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {PWSTR} param3 
     * @param {Pointer<Integer>} param4 
     * @param {Integer} param5 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3, param4, param5) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param3 := param3 is String ? StrPtr(param3) : param3

        param4Marshal := param4 is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", param0, "uint", param1, "int", param2, "ptr", param3, param4Marshal, param4, "uint", param5, "uint")
        return result
    }
}
