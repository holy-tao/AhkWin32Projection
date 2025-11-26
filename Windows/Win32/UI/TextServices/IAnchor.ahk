#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAnchor.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAnchor interface is implemented by the TSF manager. Clients of Microsoft Active Accessibility use IAnchor anchor objects to delimit a range of text within a text stream.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/nn-textstor-ianchor
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IAnchor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnchor
     * @type {Guid}
     */
    static IID => Guid("{0feb7e34-5a60-4356-8ef7-abdec2ff7cf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGravity", "GetGravity", "IsEqual", "Compare", "Shift", "ShiftTo", "ShiftRegion", "SetChangeHistoryMask", "GetChangeHistory", "ClearChangeHistory", "Clone"]

    /**
     * IAnchor::SetGravity method
     * @param {Integer} gravity Contains a value from the <a href="https://docs.microsoft.com/windows/win32/api/textstor/ne-textstor-tsgravity">TsGravity</a> enumeration that specifies a new forward or backward gravity for the anchor.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-ianchor-setgravity
     */
    SetGravity(gravity) {
        result := ComCall(3, this, "int", gravity, "HRESULT")
        return result
    }

    /**
     * The IAnchor::GetGravity method retrieves the gravity of the anchor in an IAnchor object.
     * @returns {Integer} Pointer that receives a <a href="https://docs.microsoft.com/windows/win32/api/textstor/ne-textstor-tsgravity">TsGravity</a> value that specifies the anchor gravity.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-ianchor-getgravity
     */
    GetGravity() {
        result := ComCall(4, this, "int*", &pgravity := 0, "HRESULT")
        return pgravity
    }

    /**
     * The IAnchor::IsEqual method evaluates two anchors within a text stream and returns a Boolean value that specifies the equality or inequality of the anchor positions.
     * @param {IAnchor} paWith Specifies an anchor to compare to the primary anchor. Used to determine the equality of the two anchor positions.
     * @returns {BOOL} A Boolean value that specifies whether the two anchors are positioned at the same location. If set to <b>TRUE</b>, the two anchors occupy the same location. If set to <b>FALSE</b>, the two anchors do not occupy the same location.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-ianchor-isequal
     */
    IsEqual(paWith) {
        result := ComCall(5, this, "ptr", paWith, "int*", &pfEqual := 0, "HRESULT")
        return pfEqual
    }

    /**
     * The IAnchor::Compare method compares the relative position of two anchors within a text stream.
     * @param {IAnchor} paWith An anchor object to compare to the primary anchor. Used to determine the relative position of the two anchors.
     * @returns {Integer} Result of the comparison of the positions of the two anchors.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="-1"></a><dl>
     * <dt><b>-1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The primary anchor is positioned earlier in the text stream than <i>paWith.</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The primary anchor is positioned at the same location as <i>paWith.</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_1"></a><dl>
     * <dt><b>+1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The primary anchor is positioned later in the text stream than <i>paWith.</i>
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-ianchor-compare
     */
    Compare(paWith) {
        result := ComCall(6, this, "ptr", paWith, "int*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * The IAnchor::Shift method shifts the anchor forward or backward within a text stream.
     * @param {Integer} dwFlags Bit fields that are used to avoid anchor positioning.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_SHIFT_COUNT_ONLY"></a><a id="ts_shift_count_only"></a><dl>
     * <dt><b>TS_SHIFT_COUNT_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The anchor is not shifted. If the flag is not set (<i>dwFlags</i> = 0), the anchor will be shifted as specified by the other parameter settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} cchReq The number of characters to move the anchor within the text stream.
     * @param {IAnchor} paHaltAnchor Reference to an anchor that blocks the shift. Set to <b>NULL</b> to avoid blocking the shift.
     * @returns {Integer} The actual number of characters moved within the text stream. The method will set <i>pcch</i> to zero if it fails.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-ianchor-shift
     */
    Shift(dwFlags, cchReq, paHaltAnchor) {
        result := ComCall(7, this, "uint", dwFlags, "int", cchReq, "int*", &pcch := 0, "ptr", paHaltAnchor, "HRESULT")
        return pcch
    }

    /**
     * The IAnchor::ShiftTo method shifts the current anchor to the same position as another anchor.
     * @param {IAnchor} paSite Anchor occupying a position that the current anchor will be moved to.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An <a href="/windows/desktop/api/textstor/nn-textstor-ianchor">IAnchor</a> interface pointer to the <i>paSite</i> anchor could not be obtained, or memory is too low to safely complete the operation.
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
     * <i>paSite</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-ianchor-shiftto
     */
    ShiftTo(paSite) {
        result := ComCall(8, this, "ptr", paSite, "HRESULT")
        return result
    }

    /**
     * IAnchor::ShiftRegion method
     * @param {Integer} dwFlags Bitfields that are used to control anchor repositioning around hidden text, or to avoid actual repositioning of the anchor.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_SHIFT_COUNT_HIDDEN"></a><a id="ts_shift_count_hidden"></a><dl>
     * <dt><b>TS_SHIFT_COUNT_HIDDEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the anchor will be shifted to the next region boundary, including the boundary of a hidden text region. If not set, the anchor will be shifted past any adjacent hidden text until a region of visible text is found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_SHIFT_COUNT_ONLY"></a><a id="ts_shift_count_only"></a><dl>
     * <dt><b>TS_SHIFT_COUNT_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The anchor is not shifted.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dir Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/textstor/ne-textstor-tsshiftdir">TsShiftDir</a> values that specifies which adjacent region the anchor is moved to.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_SD_BACKWARD"></a><a id="ts_sd_backward"></a><dl>
     * <dt><b>TS_SD_BACKWARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the anchor will be moved to the region immediately preceding a range of text.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_SD_FORWARD"></a><a id="ts_sd_forward"></a><dl>
     * <dt><b>TS_SD_FORWARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the anchor will be moved to the region immediately following a range of text.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} Boolean value that specifies whether a shift of the anchor occurred.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shift failed, and the anchor was not repositioned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shift succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-ianchor-shiftregion
     */
    ShiftRegion(dwFlags, dir) {
        result := ComCall(9, this, "uint", dwFlags, "int", dir, "int*", &pfNoRegion := 0, "HRESULT")
        return pfNoRegion
    }

    /**
     * This method has not been implemented.
     * @param {Integer} dwMask Not used.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-ianchor-setchangehistorymask
     */
    SetChangeHistoryMask(dwMask) {
        result := ComCall(10, this, "uint", dwMask, "HRESULT")
        return result
    }

    /**
     * The IAnchor::GetChangeHistory method gets the history of deletions that have occurred immediately preceding or following the anchor.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-ianchor-getchangehistory
     */
    GetChangeHistory() {
        result := ComCall(11, this, "uint*", &pdwHistory := 0, "HRESULT")
        return pdwHistory
    }

    /**
     * The IAnchor::ClearChangeHistory method clears the anchor change history flags.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-ianchor-clearchangehistory
     */
    ClearChangeHistory() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The IAnchor::Clone method produces a new anchor object positioned at the same location, and with the same gravity, as the current anchor.
     * @returns {IAnchor} A new anchor object, identical to the current anchor.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-ianchor-clone
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &ppaClone := 0, "HRESULT")
        return IAnchor(ppaClone)
    }
}
