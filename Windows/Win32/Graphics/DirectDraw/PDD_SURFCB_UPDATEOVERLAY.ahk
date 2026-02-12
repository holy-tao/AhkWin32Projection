#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdUpdateOverlay callback function repositions or modifies the visual attributes of an overlay surface.
 * @remarks
 * <b>DdUpdateOverlay</b> shows, hides, or repositions an overlay surface on the screen. It also sets attributes of the overlay surface, such as the stretch factor or type of color key to be used.
 * 
 * The driver should determine whether it has the bandwidth to support the overlay update request. The driver should use the <b>dwFlags</b> member of the DD_UPDATEOVERLAYDATA structure at <b>lpUpdateOverlay</b> to determine the type of request and how to process it.
 * 
 * The driver/hardware must stretch or shrink the overlay accordingly when the rectangles specified by the <b>rDest</b> and <b>rSrc</b> members of DD_UPDATEOVERLAYDATA are different sizes.
 * 
 * Note that <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_flip">DdFlip</a> is used for flipping between overlay surfaces, so performance for <b>DdUpdateOverlay</b> is not critical.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_surfcb_updateoverlay
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_SURFCB_UPDATEOVERLAY extends IUnknown {

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
     * @param {Pointer<DD_UPDATEOVERLAYDATA>} param0 
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
