#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DxBobNextField callback function bobs the next field of interleaved data.
 * @remarks
 * When data is interleaved, the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_flip">DdFlip</a> function is called every other frame. This is insufficient for bob because it must be notified after every V-sync. The driver's <i>DxBobNextField</i> function is called when a V-sync does not cause a flip.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxmini/nc-dxmini-pdx_bobnextfield
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDX_BOBNEXTFIELD extends IUnknown {

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
     * @param {Pointer<Void>} param0 
     * @param {Pointer<DDBOBNEXTFIELDINFO>} param1 
     * @param {Pointer<Void>} param2 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, param0Marshal, param0, "ptr", param1, param2Marshal, param2, "uint")
        return result
    }
}
