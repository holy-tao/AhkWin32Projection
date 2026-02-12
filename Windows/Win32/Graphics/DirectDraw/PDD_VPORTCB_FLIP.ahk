#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdVideoPortFlip callback function performs a physical flip, causing the VPE object to start writing data to the new surface.
 * @remarks
 * <i>DdVideoPortFlip</i> must be implemented in DirectDraw drivers that support VPE.
 * 
 * The driver should update its surface pointers so that the next frame of video will be written to the surface to which the <b>lpSurfTarg</b> member of the DD_FLIPVPORTDATA structure at <i>lpFlipVideoPort</i> points. If a previous flip request is still pending, the driver should fail the call by setting the <b>ddRVal</b> member of DD_FLIPVPORTDATA to DDERR_WASSTILLDRAWING and returning DDHAL_DRIVER_HANDLED. <i>DdVideoPortFlip</i> does not affect the actual display of the video data.
 * 
 * A call to <i>DdVideoPortFlip</i> typically accompanies a call to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_flip">DdFlip</a> when an application is performing video streaming.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_vportcb_flip
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_VPORTCB_FLIP extends IUnknown {

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
     * @param {Pointer<DD_FLIPVPORTDATA>} param0 
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
