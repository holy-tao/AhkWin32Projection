#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITextFont.ahk" { ITextFont }

/**
 * In the Text Object Model (TOM), applications access text-range attributes by using a pair of dual interfaces, ITextFont and ITextPara.
 * @see https://learn.microsoft.com/windows/win32/api/tom/nn-tom-itextfont2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct ITextFont2 extends ITextFont {
    /**
     * The interface identifier for ITextFont2
     * @type {Guid}
     */
    static IID := Guid("{c241f5e3-7206-11d8-a2c7-00a0d1d6c6b3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextFont2 interfaces
    */
    struct Vtbl extends ITextFont.Vtbl {
        GetCount                 : IntPtr
        GetAutoLigatures         : IntPtr
        SetAutoLigatures         : IntPtr
        GetAutospaceAlpha        : IntPtr
        SetAutospaceAlpha        : IntPtr
        GetAutospaceNumeric      : IntPtr
        SetAutospaceNumeric      : IntPtr
        GetAutospaceParens       : IntPtr
        SetAutospaceParens       : IntPtr
        GetCharRep               : IntPtr
        SetCharRep               : IntPtr
        GetCompressionMode       : IntPtr
        SetCompressionMode       : IntPtr
        GetCookie                : IntPtr
        SetCookie                : IntPtr
        GetDoubleStrike          : IntPtr
        SetDoubleStrike          : IntPtr
        GetDuplicate2            : IntPtr
        SetDuplicate2            : IntPtr
        GetLinkType              : IntPtr
        GetMathZone              : IntPtr
        SetMathZone              : IntPtr
        GetModWidthPairs         : IntPtr
        SetModWidthPairs         : IntPtr
        GetModWidthSpace         : IntPtr
        SetModWidthSpace         : IntPtr
        GetOldNumbers            : IntPtr
        SetOldNumbers            : IntPtr
        GetOverlapping           : IntPtr
        SetOverlapping           : IntPtr
        GetPositionSubSuper      : IntPtr
        SetPositionSubSuper      : IntPtr
        GetScaling               : IntPtr
        SetScaling               : IntPtr
        GetSpaceExtension        : IntPtr
        SetSpaceExtension        : IntPtr
        GetUnderlinePositionMode : IntPtr
        SetUnderlinePositionMode : IntPtr
        GetEffects               : IntPtr
        GetEffects2              : IntPtr
        GetProperty              : IntPtr
        GetPropertyInfo          : IntPtr
        IsEqual2                 : IntPtr
        SetEffects               : IntPtr
        SetEffects2              : IntPtr
        SetProperty              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextFont2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the count of extra properties in this character formatting collection.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The count of extra properties in this collection.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getcount
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getautoligatures
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setautoligatures
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getautospacealpha
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setautospacealpha
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getautospacenumeric
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setautospacenumeric
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getautospaceparens
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setautospaceparens
     */
    SetAutospaceParens(Value) {
        result := ComCall(70, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the character repertoire (writing system).
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getcharrep
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setcharrep
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getcompressionmode
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setcompressionmode
     */
    SetCompressionMode(Value) {
        result := ComCall(74, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the client cookie.
     * @remarks
     * This value is purely for the use of the client and has no meaning to the Text Object Model (TOM) engine. There are exceptions where different values correspond to different character format runs.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The client cookie.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getcookie
     */
    GetCookie() {
        result := ComCall(75, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the client cookie.
     * @remarks
     * This value is purely for the use of the client. It has no meaning to the Text Object Model (TOM) engine except that different values correspond to different character format runs.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The client cookie.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setcookie
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getdoublestrike
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setdoublestrike
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getduplicate2
     */
    GetDuplicate2() {
        result := ComCall(79, this, "ptr*", &ppFont := 0, "HRESULT")
        return ITextFont2(ppFont)
    }

    /**
     * Sets the properties of this object by copying the properties of another text font object.
     * @remarks
     * Values with the <b>tomUndefined</b> attribute have no effect.
     * 
     * For an example of how to use font duplicates, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-setfont">ITextRange::SetFont</a>.
     * @param {ITextFont2} pFont Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont2">ITextFont2</a>*</b>
     * 
     * The text font object to copy from.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes.  For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setduplicate2
     */
    SetDuplicate2(pFont) {
        result := ComCall(80, this, "ptr", pFont, "HRESULT")
        return result
    }

    /**
     * Gets the link type.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getlinktype
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getmathzone
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setmathzone
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getmodwidthpairs
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setmodwidthpairs
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getmodwidthspace
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setmodwidthspace
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getoldnumbers
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setoldnumbers
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getoverlapping
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setoverlapping
     */
    SetOverlapping(Value) {
        result := ComCall(91, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the subscript or superscript position relative to the baseline.
     * @remarks
     * The subscript or superscript position is relative to the baseline as a percent of the font height.
     * 
     * Subscripts and superscripts in math zones are handled using the <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomSubscript</a>, <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomSuperscript</a>, <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomSubSup</a>, and <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomLeftSubSup</a> mathematical objects. See <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange2-getinlineobject">ITextRange2::GetInlineObject</a>.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The subscript or superscript position relative to the baseline.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getpositionsubsuper
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setpositionsubsuper
     */
    SetPositionSubSuper(Value) {
        result := ComCall(93, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the font horizontal scaling percentage.
     * @remarks
     * The font horizontal scaling percentage can range from 200, which doubles the widths of characters, to 0, where no scaling is performed.  When the percentage is increased the height does not change.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The scaling percentage.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getscaling
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setscaling
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getspaceextension
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setspaceextension
     */
    SetSpaceExtension(Value) {
        result := ComCall(97, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Gets the underline position mode.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getunderlinepositionmode
     */
    GetUnderlinePositionMode() {
        result := ComCall(98, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the underline position mode.
     * @param {Integer} Value Type: <b>long</b>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setunderlinepositionmode
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-geteffects
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-geteffects2
     */
    GetEffects2(pValue, pMask) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pMaskMarshal := pMask is VarRef ? "int*" : "ptr"

        result := ComCall(101, this, pValueMarshal, pValue, pMaskMarshal, pMask, "HRESULT")
        return result
    }

    /**
     * Gets the value of the specified property. (ITextFont2.GetProperty)
     * @remarks
     * Property IDs are defined by the Text Object Model (TOM).  Here are how some of the TOM values are obtained:
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The property ID of the value to return.
     * See Remarks.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The property value.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getproperty
     */
    GetProperty(Type) {
        result := ComCall(102, this, "int", Type, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets the property type and value of the specified extra property.
     * @param {Integer} Index Type: <b>long</b>
     * 
     * The collection index of the extra property.
     * @param {Pointer<Integer>} pType Type: <b>long*</b>
     * 
     * The property ID.
     * @param {Pointer<Integer>} pValue Type: <b>long*</b>
     * 
     * The property value.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-getpropertyinfo
     */
    GetPropertyInfo(Index, pType, pValue) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(103, this, "int", Index, pTypeMarshal, pType, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * Determines whether this text font object has the same properties as the specified text font object. (ITextFont2.IsEqual2)
     * @remarks
     * For two text font objects to be equal, both must belong to the same Text Object Model (TOM) object. 
     * 
     * The <b>ITextFont::IsEqual2</b> method ignores entries for which either font object has a <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomUndefined</a> value.
     * @param {ITextFont2} pFont Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont2">ITextFont2</a>*</b>
     * 
     * The text font object to compare against.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-rich-edit-controls">tomBool</a> value that is <b>tomTrue</b> if the font objects have the same properties, or <b>tomFalse</b> if they don't. This parameter can be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-isequal2
     */
    IsEqual2(pFont) {
        result := ComCall(104, this, "ptr", pFont, "int*", &pB := 0, "HRESULT")
        return pB
    }

    /**
     * Sets the character format effects.
     * @remarks
     * Only effects with the corresponding mask flag set are modified.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-seteffects
     */
    SetEffects(Value, Mask) {
        result := ComCall(105, this, "int", Value, "int", Mask, "HRESULT")
        return result
    }

    /**
     * Sets the additional character format effects.
     * @remarks
     * Only effects with the corresponding mask flag set are modified.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-seteffects2
     */
    SetEffects2(Value, Mask) {
        result := ComCall(106, this, "int", Value, "int", Mask, "HRESULT")
        return result
    }

    /**
     * Sets the value of the specified property. (ITextFont2.SetProperty)
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The ID of the property value to set. Types are defined by TOM. For a list of types, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextfont2-getproperty">ITextFont2::GetProperty</a>.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new property value.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont2-setproperty
     */
    SetProperty(Type, Value) {
        result := ComCall(107, this, "int", Type, "int", Value, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITextFont2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAutoLigatures := CallbackCreate(GetMethod(implObj, "GetAutoLigatures"), flags, 2)
        this.vtbl.SetAutoLigatures := CallbackCreate(GetMethod(implObj, "SetAutoLigatures"), flags, 2)
        this.vtbl.GetAutospaceAlpha := CallbackCreate(GetMethod(implObj, "GetAutospaceAlpha"), flags, 2)
        this.vtbl.SetAutospaceAlpha := CallbackCreate(GetMethod(implObj, "SetAutospaceAlpha"), flags, 2)
        this.vtbl.GetAutospaceNumeric := CallbackCreate(GetMethod(implObj, "GetAutospaceNumeric"), flags, 2)
        this.vtbl.SetAutospaceNumeric := CallbackCreate(GetMethod(implObj, "SetAutospaceNumeric"), flags, 2)
        this.vtbl.GetAutospaceParens := CallbackCreate(GetMethod(implObj, "GetAutospaceParens"), flags, 2)
        this.vtbl.SetAutospaceParens := CallbackCreate(GetMethod(implObj, "SetAutospaceParens"), flags, 2)
        this.vtbl.GetCharRep := CallbackCreate(GetMethod(implObj, "GetCharRep"), flags, 2)
        this.vtbl.SetCharRep := CallbackCreate(GetMethod(implObj, "SetCharRep"), flags, 2)
        this.vtbl.GetCompressionMode := CallbackCreate(GetMethod(implObj, "GetCompressionMode"), flags, 2)
        this.vtbl.SetCompressionMode := CallbackCreate(GetMethod(implObj, "SetCompressionMode"), flags, 2)
        this.vtbl.GetCookie := CallbackCreate(GetMethod(implObj, "GetCookie"), flags, 2)
        this.vtbl.SetCookie := CallbackCreate(GetMethod(implObj, "SetCookie"), flags, 2)
        this.vtbl.GetDoubleStrike := CallbackCreate(GetMethod(implObj, "GetDoubleStrike"), flags, 2)
        this.vtbl.SetDoubleStrike := CallbackCreate(GetMethod(implObj, "SetDoubleStrike"), flags, 2)
        this.vtbl.GetDuplicate2 := CallbackCreate(GetMethod(implObj, "GetDuplicate2"), flags, 2)
        this.vtbl.SetDuplicate2 := CallbackCreate(GetMethod(implObj, "SetDuplicate2"), flags, 2)
        this.vtbl.GetLinkType := CallbackCreate(GetMethod(implObj, "GetLinkType"), flags, 2)
        this.vtbl.GetMathZone := CallbackCreate(GetMethod(implObj, "GetMathZone"), flags, 2)
        this.vtbl.SetMathZone := CallbackCreate(GetMethod(implObj, "SetMathZone"), flags, 2)
        this.vtbl.GetModWidthPairs := CallbackCreate(GetMethod(implObj, "GetModWidthPairs"), flags, 2)
        this.vtbl.SetModWidthPairs := CallbackCreate(GetMethod(implObj, "SetModWidthPairs"), flags, 2)
        this.vtbl.GetModWidthSpace := CallbackCreate(GetMethod(implObj, "GetModWidthSpace"), flags, 2)
        this.vtbl.SetModWidthSpace := CallbackCreate(GetMethod(implObj, "SetModWidthSpace"), flags, 2)
        this.vtbl.GetOldNumbers := CallbackCreate(GetMethod(implObj, "GetOldNumbers"), flags, 2)
        this.vtbl.SetOldNumbers := CallbackCreate(GetMethod(implObj, "SetOldNumbers"), flags, 2)
        this.vtbl.GetOverlapping := CallbackCreate(GetMethod(implObj, "GetOverlapping"), flags, 2)
        this.vtbl.SetOverlapping := CallbackCreate(GetMethod(implObj, "SetOverlapping"), flags, 2)
        this.vtbl.GetPositionSubSuper := CallbackCreate(GetMethod(implObj, "GetPositionSubSuper"), flags, 2)
        this.vtbl.SetPositionSubSuper := CallbackCreate(GetMethod(implObj, "SetPositionSubSuper"), flags, 2)
        this.vtbl.GetScaling := CallbackCreate(GetMethod(implObj, "GetScaling"), flags, 2)
        this.vtbl.SetScaling := CallbackCreate(GetMethod(implObj, "SetScaling"), flags, 2)
        this.vtbl.GetSpaceExtension := CallbackCreate(GetMethod(implObj, "GetSpaceExtension"), flags, 2)
        this.vtbl.SetSpaceExtension := CallbackCreate(GetMethod(implObj, "SetSpaceExtension"), flags, 2)
        this.vtbl.GetUnderlinePositionMode := CallbackCreate(GetMethod(implObj, "GetUnderlinePositionMode"), flags, 2)
        this.vtbl.SetUnderlinePositionMode := CallbackCreate(GetMethod(implObj, "SetUnderlinePositionMode"), flags, 2)
        this.vtbl.GetEffects := CallbackCreate(GetMethod(implObj, "GetEffects"), flags, 3)
        this.vtbl.GetEffects2 := CallbackCreate(GetMethod(implObj, "GetEffects2"), flags, 3)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.GetPropertyInfo := CallbackCreate(GetMethod(implObj, "GetPropertyInfo"), flags, 4)
        this.vtbl.IsEqual2 := CallbackCreate(GetMethod(implObj, "IsEqual2"), flags, 3)
        this.vtbl.SetEffects := CallbackCreate(GetMethod(implObj, "SetEffects"), flags, 3)
        this.vtbl.SetEffects2 := CallbackCreate(GetMethod(implObj, "SetEffects2"), flags, 3)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAutoLigatures)
        CallbackFree(this.vtbl.SetAutoLigatures)
        CallbackFree(this.vtbl.GetAutospaceAlpha)
        CallbackFree(this.vtbl.SetAutospaceAlpha)
        CallbackFree(this.vtbl.GetAutospaceNumeric)
        CallbackFree(this.vtbl.SetAutospaceNumeric)
        CallbackFree(this.vtbl.GetAutospaceParens)
        CallbackFree(this.vtbl.SetAutospaceParens)
        CallbackFree(this.vtbl.GetCharRep)
        CallbackFree(this.vtbl.SetCharRep)
        CallbackFree(this.vtbl.GetCompressionMode)
        CallbackFree(this.vtbl.SetCompressionMode)
        CallbackFree(this.vtbl.GetCookie)
        CallbackFree(this.vtbl.SetCookie)
        CallbackFree(this.vtbl.GetDoubleStrike)
        CallbackFree(this.vtbl.SetDoubleStrike)
        CallbackFree(this.vtbl.GetDuplicate2)
        CallbackFree(this.vtbl.SetDuplicate2)
        CallbackFree(this.vtbl.GetLinkType)
        CallbackFree(this.vtbl.GetMathZone)
        CallbackFree(this.vtbl.SetMathZone)
        CallbackFree(this.vtbl.GetModWidthPairs)
        CallbackFree(this.vtbl.SetModWidthPairs)
        CallbackFree(this.vtbl.GetModWidthSpace)
        CallbackFree(this.vtbl.SetModWidthSpace)
        CallbackFree(this.vtbl.GetOldNumbers)
        CallbackFree(this.vtbl.SetOldNumbers)
        CallbackFree(this.vtbl.GetOverlapping)
        CallbackFree(this.vtbl.SetOverlapping)
        CallbackFree(this.vtbl.GetPositionSubSuper)
        CallbackFree(this.vtbl.SetPositionSubSuper)
        CallbackFree(this.vtbl.GetScaling)
        CallbackFree(this.vtbl.SetScaling)
        CallbackFree(this.vtbl.GetSpaceExtension)
        CallbackFree(this.vtbl.SetSpaceExtension)
        CallbackFree(this.vtbl.GetUnderlinePositionMode)
        CallbackFree(this.vtbl.SetUnderlinePositionMode)
        CallbackFree(this.vtbl.GetEffects)
        CallbackFree(this.vtbl.GetEffects2)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.GetPropertyInfo)
        CallbackFree(this.vtbl.IsEqual2)
        CallbackFree(this.vtbl.SetEffects)
        CallbackFree(this.vtbl.SetEffects2)
        CallbackFree(this.vtbl.SetProperty)
    }
}
