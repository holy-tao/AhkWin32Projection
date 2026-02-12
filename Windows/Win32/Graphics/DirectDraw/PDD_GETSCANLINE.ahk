#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdGetScanLine callback function returns the number of the current physical scan line.
 * @remarks
 * If the monitor is not in vertical blank, the driver should write the scan line value in the <b>dwScanLine</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getscanlinedata">DD_GETSCANLINEDATA</a> structure at <i>pGetScanLine</i>. The number must be in the range [0, <i>n</i>], where scan line 0 is the first visible scan line and scan line <i>n</i> is the last visible scan line on the screen. The driver should then set DD_OK in the <b>ddRVal</b> member of <b>DD_GETSCANLINEDATA</b> and return DDHAL_DRIVER_HANDLED.
 * 
 * The scan line is indeterminate if a vertical blank is in progress. In this situation, the driver should set <b>ddRVal</b> to DDERR_VERTICALBLANKINPROGRESS and return DDHAL_DRIVER_HANDLED.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_getscanline
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_GETSCANLINE extends IUnknown {

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
     * @param {Pointer<DD_GETSCANLINEDATA>} param0 
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
