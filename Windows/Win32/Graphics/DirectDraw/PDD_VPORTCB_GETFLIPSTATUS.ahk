#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdVideoPortGetFlipStatus callback function determines whether the most recently requested flip on a surface has occurred.
 * @remarks
 * DirectDraw drivers that support VPE must implement <i>DdVideoPortGetFlipStatus</i>.
 * 
 * The driver should set the <b>ddRVal</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportflipstatusdata">DD_GETVPORTFLIPSTATUSDATA</a> structure at <i>lpGetFlipStatus</i> to DDERR_WASSTILLDRAWING and return DDHAL_DRIVER_HANDLED if a flip is currently in progress; otherwise the driver should set <b>ddRVal</b> to DD_OK and return DDHAL_DRIVER_HANDLED.
 * 
 * If the driver sets <b>ddRVal</b> to DDERR_WASSTILLDRAWING, DirectDraw will fail locks and blits on that surface.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_vportcb_getflipstatus
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_VPORTCB_GETFLIPSTATUS extends IUnknown {

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
     * @param {Pointer<DD_GETVPORTFLIPSTATUSDATA>} param0 
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
