#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\TS_STATUS.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextOwner interface is implemented by an application or a text service to receive text input without having a text store. An instance of this interface is obtained when the application calls the ITfSource::AdviseSink method.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcontextowner
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextOwner extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfContextOwner
     * @type {Guid}
     */
    static IID => Guid("{aa80e80c-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetACPFromPoint", "GetTextExt", "GetScreenExt", "GetStatus", "GetWnd", "GetAttribute"]

    /**
     * The ITfContextOwner::GetACPFromPoint method converts a point in screen coordinates to an application character position.
     * @remarks
     * <img alt="Point 1 is in character bounding box and point 2 is outside the character bounding box." border="border" src="./images/ACPFig01.gif"/>
     * Use the illustration to determine the character position returned based on the flags used in the <i>dwFlags</i> parameter.
     * 
     * <b>Point 1
     *       </b>
     * 
     * <ul>
     * <li>Default-- <i>pacp = 0</i> --The screen coordinates of the point is inside the character bounding box of Character Position 0.</li>
     * <li>GXFPF_ROUND_NEAREST-- <i>pacp = 1</i> --The screen coordinates of the point is closest to Range Position 1 which is the starting range position of Character Position 1.</li>
     * <li>GXFPF_NEAREST-- <i>pacp = 0</i> --The default behavior occurs because the point lies within the character bounding box of Character Position 0.</li>
     * </ul>
     * <b>Point 2</b>
     * 
     * <ul>
     * <li>Default-- <i>hr = TF_E_INVALIDPOINT</i> --The screen coordinates of the point is outside a character bounding box.</li>
     * <li>GXFPF_ROUND_NEAREST-- <i>hr = TF_E_INVALIDPOINT</i> --The default behavior occurs because the screen coordinates of the point is outside a character bounding box.</li>
     * <li>GXFPF_NEAREST-- <i>pacp = 1</i> --The closest character position to the screen coordinates of the point is Character Position 1.</li>
     * </ul>
     * @param {Pointer<POINT>} ptScreen Pointer to the <b>POINT</b> structure with the screen coordinates of the point.
     * @param {Integer} dwFlags Specifies the character position to return based upon the screen coordinates of the point relative to a character bounding box. By default, the character position returned is the character bounding box containing the screen coordinates of the point. If the point is outside a character's bounding box, the method returns <b>NULL</b> or TF_E_INVALIDPOINT.
     * 
     * If the GXFPF_ROUND_NEAREST flag is specified for this parameter and the screen coordinates of the point are contained in a character bounding box, the character position returned is the bounding edge closest to the screen coordinates of the point.
     * 
     * If the GXFPF_NEAREST flag is specified for this parameter and the screen coordinates of the point are not contained in a character bounding box, the closest character position is returned.
     * 
     * The bit flags can be combined.
     * @returns {Integer} Receives the character position that corresponds to the screen coordinates of the point
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getacpfrompoint
     */
    GetACPFromPoint(ptScreen, dwFlags) {
        result := ComCall(3, this, "ptr", ptScreen, "uint", dwFlags, "int*", &pacp := 0, "HRESULT")
        return pacp
    }

    /**
     * The ITfContextOwner::GetTextExt method returns the bounding box, in screen coordinates, of the text at a specified character position. The caller must have a read-only lock on the document before calling this method.
     * @remarks
     * If the document window is minimized, or if the specified text is not currently visible, the method returns S_OK with the <i>prc</i> parameter set to {0,0,0,0}.
     * @param {Integer} acpStart Specifies the starting character position of the text to get in the document.
     * @param {Integer} acpEnd Specifies the ending character position of the text to get in the document.
     * @param {Pointer<RECT>} prc Receives the bounding box, in screen coordinates, of the text at the specified character positions.
     * @param {Pointer<BOOL>} pfClipped Receives the Boolean value that specifies if the text in the bounding box has been clipped. If this parameter is <b>TRUE</b>, the bounding box contains clipped text and does not include the entire requested range of text. The bounding box is clipped because of the requested range is not visible.
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
     * <dt><b>TS_E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified start and end character positions are equal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_INVALIDPOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The range specified by the <i>acpStart</i> and <i>acpEnd</i> parameters extends past the end of the document or the top of the document.
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
     * The application has not calculated a text layout.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have a read-only lock on the document.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-gettextext
     */
    GetTextExt(acpStart, acpEnd, prc, pfClipped) {
        pfClippedMarshal := pfClipped is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", acpStart, "int", acpEnd, "ptr", prc, pfClippedMarshal, pfClipped, "HRESULT")
        return result
    }

    /**
     * The ITfContextOwner::GetScreenExt method returns the bounding box, in screen coordinates, of the display surface where the text stream is rendered.
     * @remarks
     * If the text is not currently displayed, for example if the document window is minimized, <i>prc</i> is set to { 0, 0, 0, 0 }.
     * @returns {RECT} Receives the bounding box screen coordinates of the display surface of the document.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getscreenext
     */
    GetScreenExt() {
        prc := RECT()
        result := ComCall(5, this, "ptr", prc, "HRESULT")
        return prc
    }

    /**
     * The ITfContextOwner::GetStatus method obtains the status of a document. The document status is returned through the TS_STATUS structure.
     * @returns {TS_STATUS} Receives the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_status">TS_STATUS</a> structure that contains the document status. Cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getstatus
     */
    GetStatus() {
        pdcs := TS_STATUS()
        result := ComCall(6, this, "ptr", pdcs, "HRESULT")
        return pdcs
    }

    /**
     * The ITfContextOwner::GetWnd method returns the handle to a window that corresponds to the current document.
     * @remarks
     * A document might not have a corresponding window handle if the document is in memory but not displayed on the screen or if the document is a windowless control and the control does not know the window handle of the owner of the windowless controls. Callers cannot assume that the <i>phwnd</i> parameter will receive a non-<b>NULL</b> value even if the method is successful. Callers can also receive a <b>NULL</b> value for the <i>phwnd</i> parameter.
     * @returns {HWND} Receives a pointer to the handle of the window that corresponds to the current document. This parameter can be <b>NULL</b> if the document does not have the corresponding handle to the window.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getwnd
     */
    GetWnd() {
        phwnd := HWND()
        result := ComCall(7, this, "ptr", phwnd, "HRESULT")
        return phwnd
    }

    /**
     * The ITfContextOwner::GetAttribute method returns the value of a supported attribute. If the attribute is unsupported, the pvarValue parameter is set to VT_EMPTY.
     * @remarks
     * Context owners using the default text store of the TSF manager can implement a simplified version of attributes with this method. The supported attributes are application or text service dependent. For more information about predefined attributes recognized in TSF, see the following topics.
     * @param {Pointer<Guid>} rguidAttribute Specifies the attribute GUID.
     * @returns {VARIANT} Receives the attribute value. If the attribute is unsupported, this parameter is set to VT_EMPTY.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getattribute
     */
    GetAttribute(rguidAttribute) {
        pvarValue := VARIANT()
        result := ComCall(8, this, "ptr", rguidAttribute, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }
}
