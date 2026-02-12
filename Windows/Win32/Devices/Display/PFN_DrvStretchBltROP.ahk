#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class PFN_DrvStretchBltROP extends IUnknown {

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
     * @param {Pointer<CLIPOBJ>} param3 
     * @param {Pointer<XLATEOBJ>} param4 
     * @param {Pointer<COLORADJUSTMENT>} param5 
     * @param {Pointer<POINTL>} param6 
     * @param {Pointer<RECTL>} param7 
     * @param {Pointer<RECTL>} param8 
     * @param {Pointer<POINTL>} param9 
     * @param {Integer} param10 
     * @param {Pointer<BRUSHOBJ>} param11 
     * @param {Integer} param12 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12) {
        result := ComCall(3, this, "ptr", param0, "ptr", param1, "ptr", param2, "ptr", param3, "ptr", param4, "ptr", param5, "ptr", param6, "ptr", param7, "ptr", param8, "ptr", param9, "uint", param10, "ptr", param11, "uint", param12, "int")
        return result
    }
}
