#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INKMETRIC.ahk" { INKMETRIC }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IInkLineInfo interface provides access to the display properties and recognition result list of a text ink object (tInk).
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinklineinfo
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkLineInfo extends IUnknown {
    /**
     * The interface identifier for IInkLineInfo
     * @type {Guid}
     */
    static IID := Guid("{9c1c5ad6-f22f-4de4-b453-a2cc482e7c33}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkLineInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetFormat    : IntPtr
        GetFormat    : IntPtr
        GetInkExtent : IntPtr
        GetCandidate : IntPtr
        SetCandidate : IntPtr
        Recognize    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkLineInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies the display properties to set on the text ink object (tInk).
     * @remarks
     * If the IMF_FONT_SELECTED_IN_HDC flag is set in the <i>pim</i> parameter, then the properties of the device context are applied to the ink; otherwise, the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ns-msinkaut-inkmetric">INKMETRIC</a> settings of the text ink object are applied.
     * @param {Pointer<INKMETRIC>} pim A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ns-msinkaut-inkmetric">INKMETRIC</a> structure which contains the display properties to set on the text ink object.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pim</i> parameter is <b>NULL</b>.
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
     * Could not complete the operation. The display properties are not changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinklineinfo-setformat
     */
    SetFormat(pim) {
        result := ComCall(3, this, INKMETRIC.Ptr, pim, "HRESULT")
        return result
    }

    /**
     * Returns the display properties currently set on the text ink object (tInk).
     * @param {Pointer<INKMETRIC>} pim A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ns-msinkaut-inkmetric">INKMETRIC</a> structure that stores the display properties of the text ink object.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pim</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinklineinfo-getformat
     */
    GetFormat(pim) {
        result := ComCall(4, this, INKMETRIC.Ptr, pim, "HRESULT")
        return result
    }

    /**
     * Specifies the display properties to set on the text ink object (tInk), and retrieves the width of the text ink object in HIMETRIC units.
     * @remarks
     * If the <i>pim</i> parameter is <b>NULL</b>, then the display properties are not changed and the existing properties are used to calculate the extent of the text ink object; otherwise, the display properties are updated, and the extent is calculated from the new properties.
     * 
     * If the IMF_FONT_SELECTED_IN_HDC flag is set in the <i>pim</i> parameter, then the properties of the device context are applied to the ink; otherwise, the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ns-msinkaut-inkmetric">INKMETRIC</a> settings of the text ink object are applied.
     * @param {Pointer<INKMETRIC>} pim A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ns-msinkaut-inkmetric">INKMETRIC</a> structure, which contains the display properties to set on the text ink object, or <b>NULL</b>.
     * @param {Pointer<Integer>} pnWidth The width of the text ink object in HIMETRIC units.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pnWidth</i> parameter is <b>NULL</b>.
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
     * Could not complete the operation. The display properties are not changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinklineinfo-getinkextent
     */
    GetInkExtent(pim, pnWidth) {
        pnWidthMarshal := pnWidth is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, INKMETRIC.Ptr, pim, pnWidthMarshal, pnWidth, "HRESULT")
        return result
    }

    /**
     * Returns one recognition alternate from the recognition result list.
     * @remarks
     * If the <i>pwcRecogWord</i> parameter is null, the method does not attempt to retrieve the recognition alternate word, but only sets <i>pwcRecogWord</i> to the number of characters in the recognition alternate.
     * 
     * If the <i>pwcRecogWord</i> buffer is not large enough to contain the recognition alternate, then the <i>pwcRecogWord</i> buffer is filled with the first <i>pwcRecogWord</i> number of characters from the recognition alternate.
     * @param {Integer} nCandidateNum Zero-based index of the alternate list entry to retrieve.
     * @param {PWSTR} pwcRecogWord Buffer in which to store the selected recognition alternate. If <i>pwcRecogWord</i> is <b>NULL</b>, the method does not attempt to retrieve the recognition alternate word.
     * @param {Pointer<Integer>} pcwcRecogWord Passes the length of the <i>pwcRecogWord</i> buffer in Unicode characters, and returns the number of Unicode characters that were copied into the buffer.
     * @param {Integer} dwFlags Not used.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * The <i>nCandidateNum</i> index is greater that the number of recognition alternates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pwcRecogWord</i> buffer is not large enough to accept the recognition alternate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinklineinfo-getcandidate
     */
    GetCandidate(nCandidateNum, pwcRecogWord, pcwcRecogWord, dwFlags) {
        pwcRecogWord := pwcRecogWord is String ? StrPtr(pwcRecogWord) : pwcRecogWord

        pcwcRecogWordMarshal := pcwcRecogWord is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", nCandidateNum, "ptr", pwcRecogWord, pcwcRecogWordMarshal, pcwcRecogWord, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Updates one recognition alternate in the recognition result list, either by replacing an existing alternate, or by adding an alternate to the list.
     * @remarks
     * The <i>candidate</i> list can only be extended by one new entry at a time, at the end of the current list. For example, if the <i>text ink object (tInk)</i> currently has ten recognition results, then setting the <i>nCandidateNum</i> parameter to 10 adds a new result to the text ink object's recognition result list.
     * @param {Integer} nCandidateNum Zero based index of the alternate list entry to set.
     * @param {PWSTR} strRecogWord Pointer to the new alternate text.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * The <i>nCandidateNum</i> index is out of range.
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
     * Could not complete the operation. The recognition result list is not changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinklineinfo-setcandidate
     */
    SetCandidate(nCandidateNum, strRecogWord) {
        strRecogWord := strRecogWord is String ? StrPtr(strRecogWord) : strRecogWord

        result := ComCall(7, this, "uint", nCandidateNum, "ptr", strRecogWord, "HRESULT")
        return result
    }

    /**
     * Reserved. (IInkLineInfo.Recognize)
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinklineinfo-recognize
     */
    Recognize() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInkLineInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFormat := CallbackCreate(GetMethod(implObj, "SetFormat"), flags, 2)
        this.vtbl.GetFormat := CallbackCreate(GetMethod(implObj, "GetFormat"), flags, 2)
        this.vtbl.GetInkExtent := CallbackCreate(GetMethod(implObj, "GetInkExtent"), flags, 3)
        this.vtbl.GetCandidate := CallbackCreate(GetMethod(implObj, "GetCandidate"), flags, 5)
        this.vtbl.SetCandidate := CallbackCreate(GetMethod(implObj, "SetCandidate"), flags, 3)
        this.vtbl.Recognize := CallbackCreate(GetMethod(implObj, "Recognize"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFormat)
        CallbackFree(this.vtbl.GetFormat)
        CallbackFree(this.vtbl.GetInkExtent)
        CallbackFree(this.vtbl.GetCandidate)
        CallbackFree(this.vtbl.SetCandidate)
        CallbackFree(this.vtbl.Recognize)
    }
}
