#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfRange.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextView interface is implemented by the TSF manager and used by a client (application or text service) to obtain information about a context view.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontextview
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextView extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfContextView
     * @type {Guid}
     */
    static IID => Guid("{2433bf8e-0f9b-435c-ba2c-180611978c30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRangeFromPoint", "GetTextExt", "GetScreenExt", "GetWnd"]

    /**
     * The ITfContextView::GetRangeFromPoint method converts a point, in screen coordinates, to an empty range of text positioned at a corresponding location.
     * @param {Integer} ec Specifies the edit cookie with read-only access.
     * @param {Pointer<POINT>} ppt Specifies the point in screen coordinates.
     * @param {Integer} dwFlags Specifies the range position to return based upon the screen coordinates of the point to a character bounding box. By default, the range position returned is the character bounding box containing the screen coordinates of the point. If the point is outside a character bounding box, the method returns <b>NULL</b> or <a href="https://docs.microsoft.com/windows/desktop/TSF/manager-return-values">TF_E_INVALIDPOINT</a>. Other bit flags for this parameter are as follows.
     * 
     * The bit flags can be combined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GXFPF_ROUND_NEAREST"></a><a id="gxfpf_round_nearest"></a><dl>
     * <dt><b>GXFPF_ROUND_NEAREST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the screen coordinates of the point are contained in a character bounding box, the range position returned is the bounding edge closest to the screen coordinates of the point.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GXFPF_NEAREST"></a><a id="gxfpf_nearest"></a><dl>
     * <dt><b>GXFPF_NEAREST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the screen coordinates of the point are not contained in a character bounding box, the closest range position is returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {ITfRange} Receives a pointer to the ITfRange interface.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextview-getrangefrompoint
     */
    GetRangeFromPoint(ec, ppt, dwFlags) {
        result := ComCall(3, this, "uint", ec, "ptr", ppt, "uint", dwFlags, "ptr*", &ppRange := 0, "HRESULT")
        return ITfRange(ppRange)
    }

    /**
     * The ITfContextView::GetTextExt method returns the bounding box, in screen coordinates, of a range of text.
     * @param {Integer} ec Specifies an edit cookie with read-only access.
     * @param {ITfRange} pRange Specifies the range to query
     * @param {Pointer<RECT>} prc Receives the bounding box, in screen coordinates, of the range.
     * @param {Pointer<BOOL>} pfClipped Receives the Boolean value that specifies if the text in the bounding box has been clipped. If this parameter is <b>TRUE</b>, the bounding box contains clipped text and does not include the entire requested range. The bounding box is clipped because of the requested range is not visible.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_NOLAYOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The text is not rendered or the context has not calculated the text layout.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit cookie parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextview-gettextext
     */
    GetTextExt(ec, pRange, prc, pfClipped) {
        pfClippedMarshal := pfClipped is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", ec, "ptr", pRange, "ptr", prc, pfClippedMarshal, pfClipped, "HRESULT")
        return result
    }

    /**
     * The ITfContextView::GetScreenExt method returns the bounding box, in screen coordinates, of the document display.
     * @returns {RECT} Receives the bounding box, in screen coordinates, of the display surface.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextview-getscreenext
     */
    GetScreenExt() {
        prc := RECT()
        result := ComCall(5, this, "ptr", prc, "HRESULT")
        return prc
    }

    /**
     * The ITfContextView::GetWnd method returns the handle to a window that corresponds to the current document.
     * @returns {HWND} Receives a pointer to the handle of the window that corresponds to the current document.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextview-getwnd
     */
    GetWnd() {
        phwnd := HWND()
        result := ComCall(6, this, "ptr", phwnd, "HRESULT")
        return phwnd
    }
}
