#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextFont2.ahk
#Include .\ITextFont.ahk

/**
 * In the Text Object Model (TOM), applications access text-range attributes by using a pair of dual interfaces, ITextFont and ITextPara.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextfont2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextFont2 extends ITextFont{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextFont2
     * @type {Guid}
     */
    static IID => Guid("{c241f5e3-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 62

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAutoLigatures", "SetAutoLigatures", "GetAutospaceAlpha", "SetAutospaceAlpha", "GetAutospaceNumeric", "SetAutospaceNumeric", "GetAutospaceParens", "SetAutospaceParens", "GetCharRep", "SetCharRep", "GetCompressionMode", "SetCompressionMode", "GetCookie", "SetCookie", "GetDoubleStrike", "SetDoubleStrike", "GetDuplicate2", "SetDuplicate2", "GetLinkType", "GetMathZone", "SetMathZone", "GetModWidthPairs", "SetModWidthPairs", "GetModWidthSpace", "SetModWidthSpace", "GetOldNumbers", "SetOldNumbers", "GetOverlapping", "SetOverlapping", "GetPositionSubSuper", "SetPositionSubSuper", "GetScaling", "SetScaling", "GetSpaceExtension", "SetSpaceExtension", "GetUnderlinePositionMode", "SetUnderlinePositionMode", "GetEffects", "GetEffects2", "GetProperty", "GetPropertyInfo", "IsEqual2", "SetEffects", "SetEffects2", "SetProperty"]

    /**
     * Gets the count of extra properties in this character formatting collection.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The count of extra properties in this collection.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getcount
     */
    GetCount() {
        result := ComCall(62, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets whether support for automatic ligatures is active.
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
     * <td>Automatic ligature support is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Automatic ligature support is not active.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The AutoLigatures property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getautoligatures
     */
    GetAutoLigatures() {
        result := ComCall(63, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether support for automatic ligatures is active.
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
     * <td>Automatic ligature support is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Automatic ligature support is not active.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the AutoLigatures property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The AutoLigatures property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setautoligatures
     */
    SetAutoLigatures(Value) {
        result := ComCall(64, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the East Asian &quot;autospace alphabetics&quot; state.
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
     * <td>Use East Asian autospace alphabetics.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Do not use East Asian autospace alphabetics.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The AutospaceAlpha property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getautospacealpha
     */
    GetAutospaceAlpha() {
        result := ComCall(65, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the East Asian &quot;autospace alpha&quot; state.
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
     * <td>Use East Asian autospace alphabetics.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Do not use East Asian autospace alphabetics.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the AutospaceAlpha property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The AutospaceAlpha property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setautospacealpha
     */
    SetAutospaceAlpha(Value) {
        result := ComCall(66, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the East Asian &quot;autospace numeric&quot; state.
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
     * <td>Use East Asian autospace numerics.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Do not use East Asian autospace numerics.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The AutospaceNumeric property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getautospacenumeric
     */
    GetAutospaceNumeric() {
        result := ComCall(67, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the East Asian &quot;autospace numeric&quot; state.
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
     * <td>Use East Asian autospace numerics.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Do not use East Asian autospace numerics.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the AutospaceNumeric property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The AutospaceNumeric property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setautospacenumeric
     */
    SetAutospaceNumeric(Value) {
        result := ComCall(68, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the East Asian &quot;autospace parentheses&quot; state.
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
     * <td>Use East Asian autospace parentheses.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Do not use East Asian autospace parentheses.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The AutospaceParens property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getautospaceparens
     */
    GetAutospaceParens() {
        result := ComCall(69, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the East Asian &quot;autospace parentheses&quot; state.
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
     * <td>Use East Asian autospace parentheses.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Do not use East Asian autospace parentheses.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the AutospaceParens property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The AutospaceParens property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setautospaceparens
     */
    SetAutospaceParens(Value) {
        result := ComCall(70, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the character repertoire (writing system).
     * @returns {Integer} Type: <b>long*</b>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getcharrep
     */
    GetCharRep() {
        result := ComCall(71, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the character repertoire (writing system).
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new character repertoire. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextfont2-getcharrep">ITextFont2::GetCharRep</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setcharrep
     */
    SetCharRep(Value) {
        result := ComCall(72, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the East Asian compression mode.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * 
     * The compression mode, which can be one of these values:
     * 
     * 
     * 
     * <a id="tomCompressNone__default_"></a>
     * <a id="tomcompressnone__default_"></a>
     * <a id="TOMCOMPRESSNONE__DEFAULT_"></a>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getcompressionmode
     */
    GetCompressionMode() {
        result := ComCall(73, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the East Asian compression mode.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * 
     * The compression mode, which can be one of these values:
     * 
     * 
     * 
     * <a id="tomCompressNone__default_"></a>
     * <a id="tomcompressnone__default_"></a>
     * <a id="TOMCOMPRESSNONE__DEFAULT_"></a>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setcompressionmode
     */
    SetCompressionMode(Value) {
        result := ComCall(74, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the client cookie.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The client cookie.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getcookie
     */
    GetCookie() {
        result := ComCall(75, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the client cookie.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The client cookie.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setcookie
     */
    SetCookie(Value) {
        result := ComCall(76, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether characters are displayed with double horizontal lines through the center.
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
     * <td>Characters are displayed with double horizontal lines.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not displayed with double horizontal lines.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The DoubleStrike property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getdoublestrike
     */
    GetDoubleStrike() {
        result := ComCall(77, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are displayed with double horizontal lines through the center.
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
     * <td>Characters are displayed with double horizontal lines.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not displayed with double horizontal lines.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the DoubleStrike property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The DoubleStrike property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setdoublestrike
     */
    SetDoubleStrike(Value) {
        result := ComCall(78, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets a duplicate of this character format object.
     * @returns {ITextFont2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont2">ITextFont2</a>**</b>
     * 
     * The duplicate character format object.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getduplicate2
     */
    GetDuplicate2() {
        result := ComCall(79, this, "ptr*", &ppFont := 0, "HRESULT")
        return ITextFont2(ppFont)
    }

    /**
     * Sets the properties of this object by copying the properties of another text font object.
     * @param {ITextFont2} pFont Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont2">ITextFont2</a>*</b>
     * 
     * The text font object to copy from.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes.  For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setduplicate2
     */
    SetDuplicate2(pFont) {
        result := ComCall(80, this, "ptr", pFont, "HRESULT")
        return result
    }

    /**
     * Gets the link type.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getlinktype
     */
    GetLinkType() {
        result := ComCall(81, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets whether a math zone is active.
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
     * <td>A math zone is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>A math zone is not active.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The MathZone property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getmathzone
     */
    GetMathZone() {
        result := ComCall(82, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether a math zone is active.
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
     * <td>A math zone is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>A math zone is not active.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the MathZone property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The MathZone property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setmathzone
     */
    SetMathZone(Value) {
        result := ComCall(83, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether &quot;decrease widths on pairs&quot; is active.
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
     * <td>Decrease widths on pairs is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Decrease widths on pairs is not active.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The ModWidthPairs property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getmodwidthpairs
     */
    GetModWidthPairs() {
        result := ComCall(84, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether &quot;decrease widths on pairs&quot; is active.
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
     * <td>Decrease widths on pairs is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Decrease widths on pairs is not active.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the ModWidthPairs property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The ModWidthPairs property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setmodwidthpairs
     */
    SetModWidthPairs(Value) {
        result := ComCall(85, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether &quot;increase width of whitespace&quot; is active.
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
     * <td>Increase width of whitespace is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Increase width of whitespace is not active.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The ModWidthSpace property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getmodwidthspace
     */
    GetModWidthSpace() {
        result := ComCall(86, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether &quot;increase width of whitespace&quot; is active.
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
     * <td>Increase width of whitespace is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Increase width of whitespace is not active.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the ModWidthSpace property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The ModWidthSpace property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setmodwidthspace
     */
    SetModWidthSpace(Value) {
        result := ComCall(87, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether old-style numbers are active.
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
     * <td>Old-style numbers are active.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Old-style numbers are not active.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The OldNumbers property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getoldnumbers
     */
    GetOldNumbers() {
        result := ComCall(88, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether old-style numbers are active.
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
     * <td>Old-style numbers are active.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Old-style numbers are not active.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the OldNumbers property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The OldNumbers property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setoldnumbers
     */
    SetOldNumbers(Value) {
        result := ComCall(89, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether overlapping text is active.
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
     * <td>Overlapping text is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Overlapping text is not active.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Overlapping property is undefined.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getoverlapping
     */
    GetOverlapping() {
        result := ComCall(90, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether overlapping text is active.
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
     * <td>Overlapping text is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Overlapping text is not active.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the Overlapping property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Overlapping property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setoverlapping
     */
    SetOverlapping(Value) {
        result := ComCall(91, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the subscript or superscript position relative to the baseline.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The subscript or superscript position relative to the baseline.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getpositionsubsuper
     */
    GetPositionSubSuper() {
        result := ComCall(92, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the position of a subscript or superscript relative to the baseline, as a percentage of the font height.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new subscript or superscript position.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setpositionsubsuper
     */
    SetPositionSubSuper(Value) {
        result := ComCall(93, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the font horizontal scaling percentage.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The scaling percentage.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getscaling
     */
    GetScaling() {
        result := ComCall(94, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the font horizontal scaling percentage.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The scaling percentage. Values from 0 through 255 are valid. For example, a value of 200 doubles the widths of characters while retaining the same height. A value of 0 has the same effect as a value of 100; that is, it turns scaling off.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setscaling
     */
    SetScaling(Value) {
        result := ComCall(95, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the East Asian space extension value.
     * @returns {Float} Type: <b>float*</b>
     * 
     * The space extension, in floating-point points.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getspaceextension
     */
    GetSpaceExtension() {
        result := ComCall(96, this, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the East Asian space extension value.
     * @param {Float} Value Type: <b>float</b>
     * 
     * The new space extension, in floating-points.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setspaceextension
     */
    SetSpaceExtension(Value) {
        result := ComCall(97, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Gets the underline position mode.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getunderlinepositionmode
     */
    GetUnderlinePositionMode() {
        result := ComCall(98, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the underline position mode.
     * @param {Integer} Value Type: <b>long</b>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setunderlinepositionmode
     */
    SetUnderlinePositionMode(Value) {
        result := ComCall(99, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the character format effects.
     * @param {Pointer<Integer>} pValue Type: <b>long*</b>
     * 
     * A combination of the following character format values.
     * 
     * <a id="tomAllCaps"></a>
     * <a id="tomallcaps"></a>
     * <a id="TOMALLCAPS"></a>
     * @param {Pointer<Integer>} pMask Type: <b>long*</b>
     * 
     * The differences in these flags over the range. A value of zero indicates that the properties are the same over the range. For an insertion point, this value is always zero.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-geteffects
     */
    GetEffects(pValue, pMask) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pMaskMarshal := pMask is VarRef ? "int*" : "ptr"

        result := ComCall(100, this, pValueMarshal, pValue, pMaskMarshal, pMask, "HRESULT")
        return result
    }

    /**
     * Gets the additional character format effects.
     * @param {Pointer<Integer>} pValue Type: <b>long*</b>
     * 
     * A combination of the following character format flags.
     * 
     * <a id="tomAutoSpaceAlpha"></a>
     * <a id="tomautospacealpha"></a>
     * <a id="TOMAUTOSPACEALPHA"></a>
     * @param {Pointer<Integer>} pMask Type: <b>long*</b>
     * 
     * The differences in these flags over the range. Zero values indicate that the properties are the same over the range. For an insertion point, this value is always zero.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-geteffects2
     */
    GetEffects2(pValue, pMask) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pMaskMarshal := pMask is VarRef ? "int*" : "ptr"

        result := ComCall(101, this, pValueMarshal, pValue, pMaskMarshal, pMask, "HRESULT")
        return result
    }

    /**
     * Gets the value of the specified property.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The property ID of the value to return.
     * See Remarks.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The property value.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getproperty
     */
    GetProperty(Type) {
        result := ComCall(102, this, "int", Type, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets the property type and value of the specified extra propety.
     * @param {Integer} Index Type: <b>long</b>
     * 
     * The collection index of the extra property.
     * @param {Pointer<Integer>} pType Type: <b>long*</b>
     * 
     * The property ID.
     * @param {Pointer<Integer>} pValue Type: <b>long*</b>
     * 
     * The property value.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-getpropertyinfo
     */
    GetPropertyInfo(Index, pType, pValue) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(103, this, "int", Index, pTypeMarshal, pType, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * Determines whether this text font object has the same properties as the specified text font object.
     * @param {ITextFont2} pFont Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont2">ITextFont2</a>*</b>
     * 
     * The text font object to compare against.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-rich-edit-controls">tomBool</a> value that is <b>tomTrue</b> if the font objects have the same properties, or <b>tomFalse</b> if they don't. This parameter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-isequal2
     */
    IsEqual2(pFont) {
        result := ComCall(104, this, "ptr", pFont, "int*", &pB := 0, "HRESULT")
        return pB
    }

    /**
     * Sets the character format effects.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * A combination of the following character format values.
     * 
     * <a id="tomAllCaps"></a>
     * <a id="tomallcaps"></a>
     * <a id="TOMALLCAPS"></a>
     * @param {Integer} Mask Type: <b>long</b>
     * 
     * The desired mask, which can be a combination of the <i>Value</i> flags. Only effects with the corresponding mask flag set are modified.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-seteffects
     */
    SetEffects(Value, Mask) {
        result := ComCall(105, this, "int", Value, "int", Mask, "HRESULT")
        return result
    }

    /**
     * Sets the additional character format effects.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * A combination of the following character format flags.
     * 
     * <a id="tomAutoSpaceAlpha"></a>
     * <a id="tomautospacealpha"></a>
     * <a id="TOMAUTOSPACEALPHA"></a>
     * @param {Integer} Mask Type: <b>long</b>
     * 
     * The desired mask, which can be a combination of the <i>Value</i> flags. Only effects with the corresponding mask flag set are modified.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-seteffects2
     */
    SetEffects2(Value, Mask) {
        result := ComCall(106, this, "int", Value, "int", Mask, "HRESULT")
        return result
    }

    /**
     * Sets the value of the specified property.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The ID of the property value to set. Types are defined by TOM. For a list of types, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextfont2-getproperty">ITextFont2::GetProperty</a>.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new property value.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextfont2-setproperty
     */
    SetProperty(Type, Value) {
        result := ComCall(107, this, "int", Type, "int", Value, "HRESULT")
        return result
    }
}
