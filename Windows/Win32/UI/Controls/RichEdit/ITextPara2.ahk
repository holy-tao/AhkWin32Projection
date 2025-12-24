#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\ITextPara2.ahk
#Include .\ITextPara.ahk

/**
 * Text Object Model (TOM) rich text-range attributes are accessed through a pair of dual interfaces, ITextFont and ITextPara.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextpara2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextPara2 extends ITextPara{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextPara2
     * @type {Guid}
     */
    static IID => Guid("{c241f5e4-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 55

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBorders", "GetDuplicate2", "SetDuplicate2", "GetFontAlignment", "SetFontAlignment", "GetHangingPunctuation", "SetHangingPunctuation", "GetSnapToGrid", "SetSnapToGrid", "GetTrimPunctuationAtStart", "SetTrimPunctuationAtStart", "GetEffects", "GetProperty", "IsEqual2", "SetEffects", "SetProperty"]

    /**
     * Gets the borders collection.
     * @returns {IUnknown} Type: <b>IUnknown**</b>
     * 
     * The borders collection.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-getborders
     */
    GetBorders() {
        result := ComCall(55, this, "ptr*", &ppBorders := 0, "HRESULT")
        return IUnknown(ppBorders)
    }

    /**
     * Gets a duplicate of this text paragraph format object.
     * @returns {ITextPara2} Type: <b>ITextPara2**</b>
     * 
     * The duplicate text paragraph format object
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-getduplicate2
     */
    GetDuplicate2() {
        result := ComCall(56, this, "ptr*", &ppPara := 0, "HRESULT")
        return ITextPara2(ppPara)
    }

    /**
     * Sets the properties of this object by copying the properties of another text paragraph object.
     * @param {ITextPara2} pPara Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara2">ITextPara2</a>*</b>
     * 
     * The text paragraph object to copy from.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara2::SetDuplicate2</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write access is denied.
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-setduplicate2
     */
    SetDuplicate2(pPara) {
        result := ComCall(57, this, "ptr", pPara, "HRESULT")
        return result
    }

    /**
     * Gets the paragraph font alignment state.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-getfontalignment
     */
    GetFontAlignment() {
        result := ComCall(58, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the paragraph font alignment for Chinese, Japanese, Korean text.
     * @param {Integer} Value Type: <b>long</b>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-setfontalignment
     */
    SetFontAlignment(Value) {
        result := ComCall(59, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether to hang punctuation symbols on the right margin when the paragraph is justified.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that can be one of the following.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>tomTrue</b></td>
     * <td>Hang
     *  punctuation symbols on the right margin.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Do not hang
     *  punctuation symbols on the right margin.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The HangingPunctuation property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-gethangingpunctuation
     */
    GetHangingPunctuation() {
        result := ComCall(60, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether to hang punctuation symbols on the right margin when the paragraph is justified.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that can be one of the following.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>tomTrue</b></td>
     * <td>Hang
     *  punctuation symbols on the right margin.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Do not hang
     *  punctuation symbols on the right margin.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the HangingPunctuation property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The HangingPunctuation property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-sethangingpunctuation
     */
    SetHangingPunctuation(Value) {
        result := ComCall(61, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether paragraph lines snap to a vertical grid that could be defined for the whole document.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that can be one of the following.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>tomTrue</b></td>
     * <td>Paragraph lines snap to a vertical grid.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Paragraph lines do not snap to a grid.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The SnapToGrid property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-getsnaptogrid
     */
    GetSnapToGrid() {
        result := ComCall(62, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether paragraph lines snap to a vertical grid that could be defined for the whole document.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that can be one of the following.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>tomTrue</b></td>
     * <td>Paragraph lines snap to a vertical grid.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Paragraph lines do not snap to a grid.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the SnapToGrid property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The SnapToGrid property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-setsnaptogrid
     */
    SetSnapToGrid(Value) {
        result := ComCall(63, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether to trim the leading space of a punctuation symbol at the start of a line.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that can be one of the following.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>tomTrue</b></td>
     * <td>Trim the leading space of a punctuation symbol at the start of a line.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Do not trim the leading space of a punctuation symbol at the start of a line.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The TrimPunctuationAtStart property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-gettrimpunctuationatstart
     */
    GetTrimPunctuationAtStart() {
        result := ComCall(64, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether to trim the leading space of a punctuation symbol at the start of a line.
     * @param {Integer} Value Type: <b>long</b>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-settrimpunctuationatstart
     */
    SetTrimPunctuationAtStart(Value) {
        result := ComCall(65, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the paragraph format effects.
     * @param {Pointer<Integer>} pValue Type: <b>long*</b>
     * 
     * The paragraph effects. This value can be a combination of the following flags. 
     * 
     * 
     * <a id="tomParaEffectRTL"></a>
     * <a id="tomparaeffectrtl"></a>
     * <a id="TOMPARAEFFECTRTL"></a>
     * @param {Pointer<Integer>} pMask Type: <b>long*</b>
     * 
     * The differences in the flags over the range. A value of 1 indicates that the corresponding effect is the same over the range. For an insertion point, the values equal 1 for all defined effects.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-geteffects
     */
    GetEffects(pValue, pMask) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pMaskMarshal := pMask is VarRef ? "int*" : "ptr"

        result := ComCall(66, this, pValueMarshal, pValue, pMaskMarshal, pMask, "HRESULT")
        return result
    }

    /**
     * Gets the value of the specified property.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The ID of the property value to retrieve.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The property value.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-getproperty
     */
    GetProperty(Type) {
        result := ComCall(67, this, "int", Type, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Determines whether this text paragraph object has the same properties as the specified text paragraph object.
     * @param {ITextPara2} pPara Type: <b>ITextPara2*</b>
     * 
     * The text paragraph object to compare against.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that is <b>tomTrue</b> if the text paragraph objects have the same properties, or <b>tomFalse</b> if they don't. This parameter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-isequal2
     */
    IsEqual2(pPara) {
        result := ComCall(68, this, "ptr", pPara, "int*", &pB := 0, "HRESULT")
        return pB
    }

    /**
     * Sets the paragraph format effects.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The paragraph effects value.
     * 
     * This value can be a combination of the flags defined in the table for <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara2-geteffects">ITextPara2::GetEffects</a>.
     * @param {Integer} Mask Type: <b>long</b>
     * 
     * The desired mask.
     * 
     * This value can be a combination of the flags defined in the table for <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara2-geteffects">ITextPara2::GetEffects</a>. 
     * 
     * Only effects with the corresponding mask flag set are modified.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-seteffects
     */
    SetEffects(Value, Mask) {
        result := ComCall(69, this, "int", Value, "int", Mask, "HRESULT")
        return result
    }

    /**
     * Sets the property value.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The property ID of the property value to set. See <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara2-getproperty">ITextPara2::GetProperty</a> for a list of defined properties.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The property value to set.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextpara2-setproperty
     */
    SetProperty(Type, Value) {
        result := ComCall(70, this, "int", Type, "int", Value, "HRESULT")
        return result
    }
}
