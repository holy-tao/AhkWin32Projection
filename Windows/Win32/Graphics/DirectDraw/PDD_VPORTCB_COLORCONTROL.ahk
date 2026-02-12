#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdVideoPortColorControl callback function gets or sets the VPE object color controls.
 * @remarks
 * DirectDraw drivers that set the DDVPCAPS_COLORCONTROL flag in the <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportcaps">DDVIDEOPORTCAPS</a> structure must implement <b>DdVideoPortColorControl</b>.
 * 
 * Depending on the value of the <b>dwFlags</b> member of the DD_VPORTCOLORDATA structure at <i>lpColorControl</i>, the driver should do the following:
 * 
 * <ul>
 * <li>
 * When <b>dwFlags</b> is DDRAWI_VPORTGETCOLOR, the driver should fill in each member of the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549237(v=vs.85)">DDCOLORCONTROL</a> structure that it supports with the VPE object's current color control setting. The driver must set the corresponding bit in the <b>dwFlags</b> member of DDCOLORCONTROL for every color control member in which it writes data.
 * 
 * <b>DdVideoPortColorControl</b> can be called to determine the color control capabilities of the VPE object. The driver should therefore fail the call if it does not support a requested color control capability.
 * 
 * </li>
 * <li>
 * When <b>dwFlags</b> is DDRAWI_VPORTSETCOLOR, the driver should set the VPE object's color control settings to the values specified in the DDCOLORCONTROL structure. The driver should check the <b>dwFlags</b> member of DDCOLORCONTROL to determine which structure members contain valid data.
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_vportcb_colorcontrol
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_VPORTCB_COLORCONTROL extends IUnknown {

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
     * @param {Pointer<DD_VPORTCOLORDATA>} param0 
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
