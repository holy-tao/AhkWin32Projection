#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdVideoPortWaitForSync callback function waits until the next vertical synch occurs.
 * @remarks
 * If the condition on which the driver is waiting does not occur before the number of milliseconds specified in the  <b>dwTimeOut</b> member of the DD_WAITFORVPORTSYNCDATA structure at <i>lpWaitForSync</i> has elapsed, the driver should set the <b>ddRVal</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_waitforvportsyncdata">DD_WAITFORVPORTSYNCDATA</a> to DDERR_VIDEONOTACTIVE and return DDHAL_DRIVER_HANDLED.
 * 
 * The driver must specify its own time-out criteria when <b>dwTimeOut</b> is zero.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_vportcb_waitforsync
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_VPORTCB_WAITFORSYNC extends IUnknown {

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
     * @param {Pointer<DD_WAITFORVPORTSYNCDATA>} param0 
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
