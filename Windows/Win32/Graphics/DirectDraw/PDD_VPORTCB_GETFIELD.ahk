#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdVideoPortGetField callback function determines whether the current field of an interlaced signal is even or odd.
 * @remarks
 * DirectDraw drivers that set the DDVPCAPS_READBACKFIELD flag in the <b>dwCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportcaps">DDVIDEOPORTCAPS</a> structure must implement <b>DdVideoPortGetField</b>.
 * 
 * The driver should determine whether the current field is even or odd and write <b>TRUE</b> or <b>FALSE</b> in the <b>bField</b> member of the DD_GETVPORTFIELDDATA structure at <b>lpGetField</b>, accordingly. If the query cannot be performed because the hardware video port is disabled, the driver should return DDHAL_DRIVER_HANDLED and set DDERR_VIDEONOTACTIVE in the <b>ddRVal</b> member of DD_GETVPORTFIELDDATA.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_vportcb_getfield
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_VPORTCB_GETFIELD extends IUnknown {

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
     * @param {Pointer<DD_GETVPORTFIELDDATA>} param0 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0) {
        result := ComCall(3, this, "ptr", param0, "uint")
        return result
    }
}
