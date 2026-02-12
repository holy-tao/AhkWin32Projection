#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class PFN_DrvSetPointerShape extends IUnknown {

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
     * @param {Pointer<SURFOBJ>} param1 
     * @param {Pointer<SURFOBJ>} param2 
     * @param {Pointer<XLATEOBJ>} param3 
     * @param {Integer} param4 
     * @param {Integer} param5 
     * @param {Integer} param6 
     * @param {Integer} param7 
     * @param {Pointer<RECTL>} param8 
     * @param {Integer} param9 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9) {
        result := ComCall(3, this, "ptr", param0, "ptr", param1, "ptr", param2, "ptr", param3, "int", param4, "int", param5, "int", param6, "int", param7, "ptr", param8, "uint", param9, "uint")
        return result
    }
}
