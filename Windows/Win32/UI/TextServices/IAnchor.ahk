#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TsGravity.ahk" { TsGravity }
#Import ".\ANCHOR_CHANGE_HISTORY_FLAGS.ahk" { ANCHOR_CHANGE_HISTORY_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\TsShiftDir.ahk" { TsShiftDir }

/**
 * The IAnchor interface is implemented by the TSF manager. Clients of Microsoft Active Accessibility use IAnchor anchor objects to delimit a range of text within a text stream.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/nn-textstor-ianchor
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct IAnchor extends IUnknown {
    /**
     * The interface identifier for IAnchor
     * @type {Guid}
     */
    static IID := Guid("{0feb7e34-5a60-4356-8ef7-abdec2ff7cf8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAnchor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetGravity           : IntPtr
        GetGravity           : IntPtr
        IsEqual              : IntPtr
        Compare              : IntPtr
        Shift                : IntPtr
        ShiftTo              : IntPtr
        ShiftRegion          : IntPtr
        SetChangeHistoryMask : IntPtr
        GetChangeHistory     : IntPtr
        ClearChangeHistory   : IntPtr
        Clone                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAnchor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IAnchor::SetGravity method
     * @param {TsGravity} gravity Contains a value from the <a href="https://docs.microsoft.com/windows/win32/api/textstor/ne-textstor-tsgravity">TsGravity</a> enumeration that specifies a new forward or backward gravity for the anchor.
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
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-setgravity
     */
    SetGravity(gravity) {
        result := ComCall(3, this, TsGravity, gravity, "HRESULT")
        return result
    }

    /**
     * The IAnchor::GetGravity method retrieves the gravity of the anchor in an IAnchor object.
     * @returns {TsGravity} Pointer that receives a <a href="https://docs.microsoft.com/windows/win32/api/textstor/ne-textstor-tsgravity">TsGravity</a> value that specifies the anchor gravity.
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-getgravity
     */
    GetGravity() {
        result := ComCall(4, this, "int*", &pgravity := 0, "HRESULT")
        return pgravity
    }

    /**
     * The IAnchor::IsEqual method evaluates two anchors within a text stream and returns a Boolean value that specifies the equality or inequality of the anchor positions.
     * @remarks
     * Anchors are always positioned between characters or regions. When two anchors are between the same characters, being at the same offset within the text stream, and within the same region, <b>IAnchor::IsEqual</b> returns <b>TRUE</b>. Otherwise it returns <b>FALSE</b>.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-ianchor-compare">IAnchor::Compare
     *         </a> incorporates the same functionality as <b>IAnchor::IsEqual</b>. However, because <b>IAnchor::IsEqual</b> is more specific, it can have a more efficient implementation on the server.
     * @param {IAnchor} paWith Specifies an anchor to compare to the primary anchor. Used to determine the equality of the two anchor positions.
     * @returns {BOOL} A Boolean value that specifies whether the two anchors are positioned at the same location. If set to <b>TRUE</b>, the two anchors occupy the same location. If set to <b>FALSE</b>, the two anchors do not occupy the same location.
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-isequal
     */
    IsEqual(paWith) {
        result := ComCall(5, this, "ptr", paWith, BOOL.Ptr, &pfEqual := 0, "HRESULT")
        return pfEqual
    }

    /**
     * The IAnchor::Compare method compares the relative position of two anchors within a text stream.
     * @remarks
     * The value 0 is returned for <i>*plResult</i> only when the two anchors are in a single region. Anchor positions include the spaces between regions. If you only need to determine if the two anchors are positioned at the same location, <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-ianchor-isequal">IAnchor::IsEqual</a> is more efficient.
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
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-compare
     */
    Compare(paWith) {
        result := ComCall(6, this, "ptr", paWith, "int*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * The IAnchor::Shift method shifts the anchor forward or backward within a text stream.
     * @remarks
     * <i>cchReq</i> and <i>pcch</i> parameters can be negative, meaning a shift backward in the text stream, or positive, meaning a shift forward. The actual number of characters shifted can be less than <i>cchReq</i> if the beginning or end of the document is encountered, a region boundary is encountered, or if <i>paHaltAnchor</i> receives an anchor that blocks the shift.
     * 
     * If <i>paHaltAnchor</i> receives an anchor that blocks the shift, the application will truncate the shift at the position occupied by <i>paHaltAnchor.</i> If <i>paHaltAnchor</i> is not within the span of text covered by the shift, it has no relevance to the shift and is ignored.
     * 
     * For example, if the anchor referenced by <i>paHaltAnchor</i> lies 8 characters ahead of the anchor in the stream, and a client calls <b>Shift</b> (0, 10, pcch, paHaltAnchor), then on exit the anchor will have moved only 8 characters. If the anchor referenced by <i>paHaltAnchor</i> is equal to the current anchor to be moved, then <b>Shift</b> will return successfully without moving the anchor at all. In this case <i>pcch</i> will be 0.
     * 
     * The anchor shift is always blocked by region boundaries, as if the beginning or end of the document were encountered. This will be indicated on exit by the actual shift <i>pcch</i> being smaller in absolute value than the requested shift <i>cchReq</i>. In this case, clients can use <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-ianchor-shiftregion">IAnchor::ShiftRegion</a> to shift the anchor into an adjacent region.
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
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-shift
     */
    Shift(dwFlags, cchReq, paHaltAnchor) {
        result := ComCall(7, this, "uint", dwFlags, "int", cchReq, "int*", &pcch := 0, "ptr", paHaltAnchor, "HRESULT")
        return pcch
    }

    /**
     * The IAnchor::ShiftTo method shifts the current anchor to the same position as another anchor.
     * @remarks
     * Implementing this method is usually more efficient than an equivalent <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-ianchor-shift">IAnchor::Shift</a> operation.
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
     * An <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nn-textstor-ianchor">IAnchor</a> interface pointer to the <i>paSite</i> anchor could not be obtained, or memory is too low to safely complete the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-shiftto
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
     * @param {TsShiftDir} dir Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/textstor/ne-textstor-tsshiftdir">TsShiftDir</a> values that specifies which adjacent region the anchor is moved to.
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
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-shiftregion
     */
    ShiftRegion(dwFlags, dir) {
        result := ComCall(9, this, "uint", dwFlags, TsShiftDir, dir, BOOL.Ptr, &pfNoRegion := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-setchangehistorymask
     */
    SetChangeHistoryMask(dwMask) {
        result := ComCall(10, this, "uint", dwMask, "HRESULT")
        return result
    }

    /**
     * The IAnchor::GetChangeHistory method gets the history of deletions that have occurred immediately preceding or following the anchor.
     * @remarks
     * The <i>pdwHistory</i> change flags must be set when deletions adjacent to the anchor have occurred.
     * 
     * The change flags remain set until they are cleared with a call to <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-ianchor-clearchangehistory">IAnchor::ClearChangeHistory</a>.
     * @returns {ANCHOR_CHANGE_HISTORY_FLAGS} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-getchangehistory
     */
    GetChangeHistory() {
        result := ComCall(11, this, "uint*", &pdwHistory := 0, "HRESULT")
        return pdwHistory
    }

    /**
     * The IAnchor::ClearChangeHistory method clears the anchor change history flags.
     * @remarks
     * Applications should clear the anchor change history flags after receiving this call. The change history flags were set by <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-ianchor-getchangehistory">IAnchor::GetChangeHistory</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-clearchangehistory
     */
    ClearChangeHistory() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The IAnchor::Clone method produces a new anchor object positioned at the same location, and with the same gravity, as the current anchor.
     * @remarks
     * The change history and change history masks are both cleared in the cloned anchor.
     * @returns {IAnchor} A new anchor object, identical to the current anchor.
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-clone
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &ppaClone := 0, "HRESULT")
        return IAnchor(ppaClone)
    }

    Query(iid) {
        if (IAnchor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetGravity := CallbackCreate(GetMethod(implObj, "SetGravity"), flags, 2)
        this.vtbl.GetGravity := CallbackCreate(GetMethod(implObj, "GetGravity"), flags, 2)
        this.vtbl.IsEqual := CallbackCreate(GetMethod(implObj, "IsEqual"), flags, 3)
        this.vtbl.Compare := CallbackCreate(GetMethod(implObj, "Compare"), flags, 3)
        this.vtbl.Shift := CallbackCreate(GetMethod(implObj, "Shift"), flags, 5)
        this.vtbl.ShiftTo := CallbackCreate(GetMethod(implObj, "ShiftTo"), flags, 2)
        this.vtbl.ShiftRegion := CallbackCreate(GetMethod(implObj, "ShiftRegion"), flags, 4)
        this.vtbl.SetChangeHistoryMask := CallbackCreate(GetMethod(implObj, "SetChangeHistoryMask"), flags, 2)
        this.vtbl.GetChangeHistory := CallbackCreate(GetMethod(implObj, "GetChangeHistory"), flags, 2)
        this.vtbl.ClearChangeHistory := CallbackCreate(GetMethod(implObj, "ClearChangeHistory"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetGravity)
        CallbackFree(this.vtbl.GetGravity)
        CallbackFree(this.vtbl.IsEqual)
        CallbackFree(this.vtbl.Compare)
        CallbackFree(this.vtbl.Shift)
        CallbackFree(this.vtbl.ShiftTo)
        CallbackFree(this.vtbl.ShiftRegion)
        CallbackFree(this.vtbl.SetChangeHistoryMask)
        CallbackFree(this.vtbl.GetChangeHistory)
        CallbackFree(this.vtbl.ClearChangeHistory)
        CallbackFree(this.vtbl.Clone)
    }
}
