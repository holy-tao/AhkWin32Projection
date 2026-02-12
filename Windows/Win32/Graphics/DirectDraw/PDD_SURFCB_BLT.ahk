#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdBlt callback function performs a bit-block transfer.
 * @remarks
 * <i>DdBlt</i> can be optionally implemented in DirectDraw drivers.
 * 
 * Before performing the bit block transfer, the driver should ensure that a flip involving the destination surface is not in progress. If the destination surface is involved in a flip, the driver should set the <b>ddRVal</b> member of the DD_BLTDATA structure at <i>lpBlt</i> to DDERR_WASSTILLDRAWING and return DDHAL_DRIVER_HANDLED.
 * 
 * The driver should check <b>dwFlags</b> to determine the type of blit operation to perform. The driver should not check for flags that are undocumented.
 * 
 * When performing transparent (color keyed) blts, drivers should ignore any unused pixel bits in their comparisons. (For instance in 32bpp modes, the high byte is typically unused. This byte should not be used in the color key comparison.)
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_surfcb_blt
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_SURFCB_BLT extends IUnknown {

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
     * @param {Pointer<DD_BLTDATA>} param0 
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
