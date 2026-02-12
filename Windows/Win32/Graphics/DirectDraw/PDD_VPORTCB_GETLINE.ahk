#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdVideoPortGetLine callback function returns the current line number of the hardware video port.
 * @remarks
 * Drivers that set the DDVPCAPS_READBACKLINE flag in the <b>dwCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportcaps">DDVIDEOPORTCAPS</a> structure must implement <b>DdVideoPortGetLine</b>.
 * 
 * The driver should write the number of the current video line in the <b>dwLine</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportlinedata">DD_GETVPORTLINEDATA</a> structure at <i>lpGetLine</i>. The returned line number must be zero-based; that is, the first line of video is line 0, the second line of video is line 1, etc.
 * 
 * If the device is in a vertical blank, the driver should set DDERR_VERTICALBLANKINPROGRESS in the <b>ddRVal</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportlinedata">DD_GETVPORTLINEDATA</a>. If the query cannot be performed because the hardware video port is disabled, the driver should set DDERR_VIDEONOTACTIVE in <b>ddRVal</b>. In both of these failed cases, the driver should return DDHAL_DRIVER_HANDLED.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_vportcb_getline
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_VPORTCB_GETLINE extends IUnknown {

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
     * @param {Pointer<DD_GETVPORTLINEDATA>} param0 
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
