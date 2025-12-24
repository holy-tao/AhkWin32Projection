#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextServices.ahk

/**
 * The ITextServices2 interface extends the ITextServices interface.
 * @see https://docs.microsoft.com/windows/win32/api//textserv/nl-textserv-itextservices2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextServices2 extends ITextServices{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TxGetNaturalSize2", "TxDrawD2D"]

    /**
     * Resizes a control so it fits its content appropriately. This method is similar to TxGetNaturalSize, but also retrieves the ascent of the top line of text.
     * @param {Integer} dwAspect Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The aspect for the drawing. It can be any of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> enumeration.
     * @param {HDC} hdcDraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * The device context into which drawing occurs.
     * @param {HDC} hicTargetDev Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * The device context for which text should be formatted (that is, for WYSIWYG).
     * @param {Pointer<DVTARGETDEVICE>} ptd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a>*</b>
     * 
     * More information on the target device.
     * @param {Integer} dwMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The type of fitting requested. It can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_EMU"></a><a id="txtns_emu"></a><dl>
     * <dt><b>TXTNS_EMU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Use English Metric Units (EMUs) instead of pixels as  										the measuring units (both ways) for this method's parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_FITTOCONTENT"></a><a id="txtns_fittocontent"></a><dl>
     * <dt><b>TXTNS_FITTOCONTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Resize the control to fit the entire text by formatting the text to the width that is passed in. The text services object returns the height of the entire text and the width of the widest line.
     * 
     * For example, this should be done when the user double-clicks one of the control's handles.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_FITTOCONTENT2"></a><a id="txtns_fittocontent2"></a><dl>
     * <dt><b>TXTNS_FITTOCONTENT2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Resize the control so that it fits indented content.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_FITTOCONTENT3"></a><a id="txtns_fittocontent3"></a><dl>
     * <dt><b>TXTNS_FITTOCONTENT3</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Resize the control so that it fits indented  										content and trailing white space.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_FITTOCONTENTWSP"></a><a id="txtns_fittocontentwsp"></a><dl>
     * <dt><b>TXTNS_FITTOCONTENTWSP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Resize the control so that it fits unindented  										content and trailing white space.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_INCLUDELASTLINE"></a><a id="txtns_includelastline"></a><dl>
     * <dt><b>TXTNS_INCLUDELASTLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  For a plain-text control, include the height of the final carriage return when calculating the size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_ROUNDTOLINE"></a><a id="txtns_roundtoline"></a><dl>
     * <dt><b>TXTNS_ROUNDTOLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Resize the control to show an integral number of lines (no line is clipped). Format enough text to fill the width and height that is passed in, and then return a height that is rounded to the nearest line boundary.
     * 
     * 
     * <div class="alert"><b>Note</b>  The passed and returned width and height correspond to the view rectangle. The host should adjust back to the client rectangle as needed. Because these values represent the extent of the text object, they are input and output in HIMETRIC coordinates (each HIMETRIC unit is 0.01 millimeter), and measuring does not include any zoom factor. For a discussion of the zoom factor, see <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txgetextent">TxGetExtent</a>.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<SIZE>} psizelExtent Type: <b>const SIZEL*</b>
     * 
     * Sizes of extents (in HIMETRIC units) to use for zooming.
     * @param {Pointer<Integer>} pwidth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The width for the fitting defined by <i>dwMode</i>.
     * @param {Pointer<Integer>} pheight Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The height for the fitting defined by <i>dwMode</i>.
     * @param {Pointer<Integer>} pascent Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * For single-line controls, receives the ascent (units above the baseline) of characters in the top line of text.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>.
     * 
     * If text services could not activate the object, the return value is one of the following <b>HRESULT</b> codes. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to determine correct size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices2-txgetnaturalsize2
     */
    TxGetNaturalSize2(dwAspect, hdcDraw, hicTargetDev, ptd, dwMode, psizelExtent, pwidth, pheight, pascent) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pwidthMarshal := pwidth is VarRef ? "int*" : "ptr"
        pheightMarshal := pheight is VarRef ? "int*" : "ptr"
        pascentMarshal := pascent is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, "uint", dwAspect, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", ptd, "uint", dwMode, "ptr", psizelExtent, pwidthMarshal, pwidth, pheightMarshal, pheight, pascentMarshal, pascent, "HRESULT")
        return result
    }

    /**
     * Draws the text services object by using Direct2D rendering.
     * @param {ID2D1RenderTarget} pRenderTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a>*</b>
     * 
     * The Direct2D rendering object that draws the text services object.
     * @param {Pointer<RECTL>} lprcBounds Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162907(v=vs.85)">LPCRECTL</a></b>
     * 
     * The bounding (client) rectangle.
     * @param {Pointer<RECT>} lprcUpdate Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">LPRECT</a></b>
     * 
     * The rectangle to update inside <i>lprcBounds</i> rectangle, in the logical coordinate system of drawing device context. If this parameter is NULL, the entire client rectangle should be drawn.
     * @param {Integer} lViewId Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The view to draw.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTVIEW_ACTIVE"></a><a id="txtview_active"></a><dl>
     * <dt><b>TXTVIEW_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draw the in-place   active view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTVIEW_INACTIVE"></a><a id="txtview_inactive"></a><dl>
     * <dt><b>TXTVIEW_INACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draw a view other than the in-place active view, for example, a print    preview. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices2-txdrawd2d
     */
    TxDrawD2D(pRenderTarget, lprcBounds, lprcUpdate, lViewId) {
        result := ComCall(22, this, "ptr", pRenderTarget, "ptr", lprcBounds, "ptr", lprcUpdate, "int", lViewId, "HRESULT")
        return result
    }
}
