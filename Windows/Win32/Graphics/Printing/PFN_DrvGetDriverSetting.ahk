#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PFN_DrvGetDriverSetting extends IUnknown {

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
     * @param {Pointer<Void>} pdriverobj 
     * @param {PSTR} Feature 
     * @param {Pointer} pOutput 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pdwOptionsReturned 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pdriverobj, Feature, pOutput, cbSize, pcbNeeded, pdwOptionsReturned) {
        Feature := Feature is String ? StrPtr(Feature) : Feature

        pdriverobjMarshal := pdriverobj is VarRef ? "ptr" : "ptr"
        pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
        pdwOptionsReturnedMarshal := pdwOptionsReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdriverobjMarshal, pdriverobj, "ptr", Feature, "ptr", pOutput, "uint", cbSize, pcbNeededMarshal, pcbNeeded, pdwOptionsReturnedMarshal, pdwOptionsReturned, "int")
        return result
    }
}
