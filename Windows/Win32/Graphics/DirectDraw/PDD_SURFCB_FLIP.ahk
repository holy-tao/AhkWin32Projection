#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdFlip callback function causes the surface memory associated with the target surface to become the primary surface, and the current surface to become the nonprimary surface.
 * @remarks
 * <b>DdFlip</b> allows a display driver to perform multibuffering. DirectDraw drivers must implement this function.
 * 
 * The driver should update its surface pointers so that the next frame will be written to the surface to which the <b>lpSurfTarg</b> member of the DD_FLIPDATA structure at <b>lpFlip</b> points. If a previous flip request is still pending, the driver should fail the call by setting the <b>ddRVal</b> member of DD_FLIPDATA to DDERR_WASSTILLDRAWING and returning DDHAL_DRIVER_HANDLED. The driver should ensure that the scan line is not in the vertical blank before performing the flip. <b>DdFlip</b> does not affect the actual display of the video data.
 * 
 * If the driver's hardware supports overlays or textures, <b>DdFlip</b> should make any necessary checks based on the surface type before performing the flip.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_surfcb_flip
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_SURFCB_FLIP extends IUnknown {

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
     * @param {Pointer<DD_FLIPDATA>} param0 
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
