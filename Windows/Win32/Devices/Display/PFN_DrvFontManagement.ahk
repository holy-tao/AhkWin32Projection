#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class PFN_DrvFontManagement extends IUnknown {

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
     * @param {Pointer<SURFOBJ>} param0 
     * @param {Pointer<FONTOBJ>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @param {Integer} param5 
     * @param {Pointer<Void>} param6 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3, param4, param5, param6) {
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"
        param6Marshal := param6 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "uint", param2, "uint", param3, param4Marshal, param4, "uint", param5, param6Marshal, param6, "uint")
        return result
    }
}
