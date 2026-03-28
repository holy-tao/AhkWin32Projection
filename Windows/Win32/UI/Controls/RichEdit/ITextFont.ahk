#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITextFont.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Text Object Model (TOM) rich text-range attributes are accessed through a pair of dual interfaces, ITextFont and ITextPara. (ITextFont)
 * @remarks
 * The <b>ITextFont</b> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a> interfaces encapsulate the functionality of the Microsoft Word Format <b>Font</b> and <b>Paragraph</b> dialog boxes, respectively. Both interfaces include a duplicate (<b>Value</b>) property that can return a duplicate of the attributes in a range object or transfer a set of attributes to a range. As such, they act like programmable format painters. For example, you could transfer all attributes from range r1 to range r2 except for making r2 bold and the font size 12 points by using the following subroutine.
 * 
 * 
 * ```
 * Sub AttributeCopy(r1 As ITextRange, r2 As ITextRange)
 *     Dim tf As ITextFont
 *     tf = r1.Font                ' Value is the default property    
 *     tf.Bold = tomTrue           ' You can make some modifications
 *     tf.Size = 12
 *     tf.Animation = tomSparkleText
 *     r2.Font = tf                ' Apply font attributes all at once
 * End Sub
 * ```
 * 
 * 
 * See <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-setfont">SetFont</a> for a similar example written in C++.
 * 
 * The <b>ITextFont</b> attribute interface represents the traditional Microsoft Visual Basic for Applications (VBA) way of setting properties and it gives the desired VBA notation.
 * 
 * <b>ITextFont</b> uses the "tomBool" type for rich-text attributes that have binary states. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">The tomBool Type</a>.
 * 
 * The rich edit control is able to accept and return all <b>ITextFont</b> properties intact, that is, without modification, both through TOM and through its Rich Text Format (RTF) converters. However, it cannot display the All Caps, Animation, Embossed, Imprint, Shadow, Small Caps, Hidden, Kerning, Outline, and Style font properties.
 * @see https://learn.microsoft.com/windows/win32/api/tom/nn-tom-itextfont
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextFont extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextFont
     * @type {Guid}
     */
    static IID => Guid("{8cc497c3-a1df-11ce-8098-00aa0047be5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDuplicate", "SetDuplicate", "CanChange", "IsEqual", "Reset", "GetStyle", "SetStyle", "GetAllCaps", "SetAllCaps", "GetAnimation", "SetAnimation", "GetBackColor", "SetBackColor", "GetBold", "SetBold", "GetEmboss", "SetEmboss", "GetForeColor", "SetForeColor", "GetHidden", "SetHidden", "GetEngrave", "SetEngrave", "GetItalic", "SetItalic", "GetKerning", "SetKerning", "GetLanguageID", "SetLanguageID", "GetName", "SetName", "GetOutline", "SetOutline", "GetPosition", "SetPosition", "GetProtected", "SetProtected", "GetShadow", "SetShadow", "GetSize", "SetSize", "GetSmallCaps", "SetSmallCaps", "GetSpacing", "SetSpacing", "GetStrikeThrough", "SetStrikeThrough", "GetSubscript", "SetSubscript", "GetSuperscript", "SetSuperscript", "GetUnderline", "SetUnderline", "GetWeight", "SetWeight"]

    /**
     * Gets a duplicate of this text font object.
     * @remarks
     * The duplicate property is the default property of an <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a> object.
     * 
     * For an example of how to use font duplicates, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-setfont">SetFont</a>.
     * @returns {ITextFont} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a>**</b>
     * 
     * The duplicate text font object.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getduplicate
     */
    GetDuplicate() {
        result := ComCall(7, this, "ptr*", &ppFont := 0, "HRESULT")
        return ITextFont(ppFont)
    }

    /**
     * Sets the character formatting by copying another text font object.
     * @remarks
     * Values with the <b>tomUndefined</b> attribute have no effect.
     * 
     * For an example of how to use font duplicates, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-setfont">SetFont</a>.
     * @param {ITextFont} pFont Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a>*</b>
     * 
     * The text font object to apply to this font object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * Invalid argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setduplicate
     */
    SetDuplicate(pFont) {
        result := ComCall(8, this, "ptr", pFont, "HRESULT")
        return result
    }

    /**
     * Determines whether the font can be changed.
     * @remarks
     * The *<i>pbCanChange</i> returns <b>tomTrue</b> only if the font can be changed. That is, no part of an associated range is protected and an associated document is not read-only. If this <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a> object is a duplicate, no protection rules apply.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A variable that is <b>tomTrue</b> if the font can be changed or <b>tomFalse</b> if it cannot be changed. This parameter can be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-canchange
     */
    CanChange() {
        result := ComCall(9, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Determines whether this text font object has the same properties as the specified text font object. (ITextFont.IsEqual)
     * @remarks
     * The text font objects are equal only if <i>pFont</i> belongs to the same Text Object Model (TOM) object as the current font object. The <b>ITextFont::IsEqual</b> method ignores entries for which either font object has an <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomUndefined</a>.
     * @param {ITextFont} pFont Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a>*</b>
     * 
     * The text font object to compare against.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A variable that is <b>tomTrue</b> if the font objects have the same properties or <b>tomFalse</b> if they do not. This parameter can be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-isequal
     */
    IsEqual(pFont) {
        result := ComCall(10, this, "ptr", pFont, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Resets the character formatting to the specified values.
     * @remarks
     * Calling 
     * 				<b>ITextFont::Reset</b> with <b>tomUndefined</b> sets all properties to undefined values. Thus, applying the font object to a range changes nothing. This applies to a font object that is obtained by the 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextfont-getduplicate">ITextFont::GetDuplicate</a> method.
     * @param {Integer} Value Type: <b>long</b>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protected from change.
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
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-reset
     */
    Reset(Value) {
        result := ComCall(11, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the character style handle of the characters in a range.
     * @remarks
     * The Text Object Model (TOM) version 1.0 does not specify the meanings of the style handles. The meanings depend on other facilities of the text system that implements TOM.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The character style handle.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getstyle
     */
    GetStyle() {
        result := ComCall(12, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the character style handle of the characters in a range.
     * @remarks
     * The Text Object Model (TOM) version 1.0 does not specify the meanings of the style handles. The meanings depend on other facilities of the text system that implements TOM.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new character style handle.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setstyle
     */
    SetStyle(Value) {
        result := ComCall(13, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether the characters are all uppercase.
     * @remarks
     * This property corresponds to the <b>CFE_ALLCAPS</b> effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charformat2a">CHARFORMAT2</a> structure.
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
     * <td>Characters are all uppercase.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not all uppercase.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The AllCaps property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getallcaps
     */
    GetAllCaps() {
        result := ComCall(14, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether the characters are all uppercase.
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
     * <td>Characters are all uppercase.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not all uppercase.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the AllCaps property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The AllCaps property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setallcaps
     */
    SetAllCaps(Value) {
        result := ComCall(15, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the animation type.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * One of the following animation types. 
     * 					
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomNoAnimation</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomLasVegasLights</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomBlinkingBackground</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSparkleText</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMarchingBlackAnts</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMarchingRedAnts</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomShimmer</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomWipeDown</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomWipeRight</a>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getanimation
     */
    GetAnimation() {
        result := ComCall(16, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the animation type.
     * @param {Integer} Value Type: <b>long</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns the following COM error code. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setanimation
     */
    SetAnimation(Value) {
        result := ComCall(17, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the text background (highlight) color.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getbackcolor
     */
    GetBackColor() {
        result := ComCall(18, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the background color.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new background color. It can be one of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>A <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value.</td>
     * <td>An RGB color.</td>
     * </tr>
     * <tr>
     * <td>A value returned by <a href="https://docs.microsoft.com/previous-versions/dd162770(v=vs.85)">PALETTEINDEX</a>
     * </td>
     * <td>A palette index.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>No change.</td>
     * </tr>
     * <tr>
     * <td><b>tomAutoColor</b></td>
     * <td>Use the default background color.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>Value</i> contains an RGB color, generate the <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setbackcolor
     */
    SetBackColor(Value) {
        result := ComCall(19, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether the characters are bold.
     * @remarks
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextfont-setweight">ITextFont::SetWeight</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextfont-getweight">ITextFont::GetWeight</a> methods to set or retrieve the font weight more precisely than the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextfont-setbold">ITextFont::SetBold</a> and <b>ITextFont::GetBold</b> methods.
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
     * <td>Characters are bold.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not bold.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Bold property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getbold
     */
    GetBold() {
        result := ComCall(20, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are bold.
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
     * <td>Characters are bold.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not bold.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the Bold property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Bold property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * Invalid argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setbold
     */
    SetBold(Value) {
        result := ComCall(21, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether characters are embossed.
     * @remarks
     * This property corresponds to the <b>CFE_EMBOSS</b> effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charformat2a">CHARFORMAT2</a> structure.
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
     * <td>Characters are embossed.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not embossed.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Emboss property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getemboss
     */
    GetEmboss() {
        result := ComCall(22, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are embossed.
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
     * <td>Characters are embossed.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not embossed.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the Emboss property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Emboss property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setemboss
     */
    SetEmboss(Value) {
        result := ComCall(23, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the foreground, or text, color.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getforecolor
     */
    GetForeColor() {
        result := ComCall(24, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the foreground (text) color.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new foreground color. It can be one of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>A <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value.</td>
     * <td>An RGB color.</td>
     * </tr>
     * <tr>
     * <td>A value returned by  <a href="https://docs.microsoft.com/previous-versions/dd162770(v=vs.85)">PALETTEINDEX</a>
     * </td>
     * <td>A palette index.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>No change.</td>
     * </tr>
     * <tr>
     * <td><b>tomAutoColor</b></td>
     * <td>Use the default foreground color.</td>
     * </tr>
     * </table>
     *  
     * 
     * If 
     * 					<i>Value</i> contains an RGB color, generate the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setforecolor
     */
    SetForeColor(Value) {
        result := ComCall(25, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether characters are hidden.
     * @remarks
     * This property corresponds to the <b>CFE_HIDDEN</b> effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charformat2a">CHARFORMAT2</a> structure.
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
     * <td>Characters are hidden.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not hidden.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Hidden property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-gethidden
     */
    GetHidden() {
        result := ComCall(26, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are hidden.
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
     * <td>Characters are hidden.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not hidden.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the Hidden property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Hidden property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-sethidden
     */
    SetHidden(Value) {
        result := ComCall(27, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether characters are displayed as imprinted characters.
     * @remarks
     * This property corresponds to the <b>CFE_IMPRINT</b> effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charformat2a">CHARFORMAT2</a> structure.
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
     * <td>Characters are displayed as imprinted characters.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not displayed as imprinted characters.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Engrave property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getengrave
     */
    GetEngrave() {
        result := ComCall(28, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are displayed as imprinted characters.
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
     * <td>Characters are imprinted.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not imprinted.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the Engrave property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Engrave property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setengrave
     */
    SetEngrave(Value) {
        result := ComCall(29, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether characters are in italics.
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
     * <td>Characters are in italics.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not in italics.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Italic property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getitalic
     */
    GetItalic() {
        result := ComCall(30, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are in italics.
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
     * <td>Characters are in italics.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not in italics.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the Italic property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Italic property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setitalic
     */
    SetItalic(Value) {
        result := ComCall(31, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the minimum font size at which kerning occurs.
     * @remarks
     * If the value pointed to by 
     * 				<i>pValue</i> is zero, kerning is off. Positive values turn on pair kerning for font point sizes greater than or equal to the kerning value. For example, the value 1 turns on kerning for all legible sizes, whereas 16 turns on kerning only for font sizes of 16 points and larger.
     * @returns {Float} Type: <b>float*</b>
     * 
     * The minimum font size at which kerning occurs, in floating-point points.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getkerning
     */
    GetKerning() {
        result := ComCall(32, this, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the minimum font size at which kerning occurs.
     * @remarks
     * If this value is zero, kerning is turned off. Positive values turn on pair kerning for font sizes greater than this kerning value. For example, the value 1 turns on kerning for all legible sizes, whereas 16 turns on kerning only for font sizes of 16 points and larger.
     * @param {Float} Value Type: <b>float</b>
     * 
     * The new value of the minimum kerning size, in floating-point points.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setkerning
     */
    SetKerning(Value) {
        result := ComCall(33, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Gets the language ID or language code identifier (LCID).
     * @remarks
     * To get the BCP-47 language tag, such as "en-US", call <c>ITextRange2::GetText2(pBstr, tomLanguageTag)</c>, where <i>pBstr</i> specifies the desired language tag.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The language ID or LCID. The low word contains the language identifier. The high word is either zero or it contains the high word of the LCID. To retrieve the language identifier, mask out the high word. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-identifiers">Locale Identifiers</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getlanguageid
     */
    GetLanguageID() {
        result := ComCall(34, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the language ID or language code identifier (LCID).
     * @remarks
     * If the high nibble of  <i>Value</i> is <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomCharset</a>, set the <i>charrep</i> from the <i>charset</i> in the low byte and the pitch and family from the next byte. See also <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextfont2-setcharrep">ITextFont2::SetCharRep</a>. 
     * 
     * If the high nibble of <i>Value</i> is <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomCharRepFromLcid</a>, set the <i>charrep</i> from the LCID and set the LCID as well. See <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextfont-getlanguageid">ITextFont::GetLanguageID</a> for more information. 
     * 
     * 
     * To set the BCP-47 language tag, such as "en-US", call <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange2-settext2">ITextRange2::SetText2</a> and set the <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomLanguageTag</a> and <i>bstr</i> with the language tag.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new language identifier. The low word contains the language identifier. The high word is either zero or it contains the high word of the locale identifier LCID. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-identifiers">Locale Identifiers</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setlanguageid
     */
    SetLanguageID(Value) {
        result := ComCall(35, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the font name.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * The font name.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getname
     */
    GetName() {
        pbstr := BSTR()
        result := ComCall(36, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * Sets the font name.
     * @param {BSTR} _bstr 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * Name too long.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setname
     */
    SetName(_bstr) {
        _bstr := _bstr is String ? BSTR.Alloc(_bstr).Value : _bstr

        result := ComCall(37, this, "ptr", _bstr, "HRESULT")
        return result
    }

    /**
     * Gets whether characters are displayed as outlined characters.
     * @remarks
     * This property corresponds to the <b>CFE_OUTLINE</b> effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charformat2a">CHARFORMAT2</a> structure.
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
     * <td>Characters are displayed as outlined characters.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not displayed as outlined characters.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Outline property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getoutline
     */
    GetOutline() {
        result := ComCall(38, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are displayed as outlined characters.
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
     * <td>Characters are outlined.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not outlined.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the Outline property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Outline property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setoutline
     */
    SetOutline(Value) {
        result := ComCall(39, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the amount that characters are offset vertically relative to the baseline.
     * @remarks
     * Displayed text typically has a zero value for this property. Positive values raise the text, and negative values lower it.
     * @returns {Float} Type: <b>float*</b>
     * 
     * The amount of vertical offset, in floating-point points.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getposition
     */
    GetPosition() {
        result := ComCall(40, this, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the amount that characters are offset vertically relative to the baseline.
     * @remarks
     * Displayed text typically has a zero value for this property. Positive values raise the text, and negative values lower it.
     * @param {Float} Value Type: <b>float</b>
     * 
     *  The new amount of vertical offset, in floating-point points.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setposition
     */
    SetPosition(Value) {
        result := ComCall(41, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether characters are protected against attempts to modify them.
     * @remarks
     * In general, Text Object Model (TOM) methods that attempt to change the formatting or content of a range fail with <b>E_ACCESSDENIED</b> if any part of that range is protected, or if the document is read only. To make a change in protected text, the TOM client should attempt to turn off the protection of the text to be modified. The owner of the document may permit this to happen. For example in rich edit controls, attempts to change protected text result in an <a href="https://docs.microsoft.com/windows/desktop/Controls/en-protected">EN_PROTECTED</a> notification code to the creator of the document, who then can refuse or grant permission for the change. The creator is the client that created a windowed rich edit control through the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nl-textserv-itexthost">ITextHost</a> object that called the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-createtextservices">CreateTextServices</a> function to create a windowless rich edit control.
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
     * <td>Characters are protected.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not protected.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Protected property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getprotected
     */
    GetProtected() {
        result := ComCall(42, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are protected against attempts to modify them.
     * @remarks
     * In general, Text Object Model (TOM) methods that attempt to change the formatting or content of a range will fail with <b>E_ACCESSDENIED</b> if any part of that range is protected or if the document is read-only. To make a change in protected text, the TOM client should attempt to turn off the protection of the text to be modified. The owner of the document may permit this to happen. For example in rich edit controls, attempts to change protected text result in an <a href="https://docs.microsoft.com/windows/desktop/Controls/en-protected">EN_PROTECTED</a> notification code to the creator of the document, who then can refuse or grant permission for the change. The creator is the client that created a windowed rich-edit control through the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nl-textserv-itexthost">ITextHost</a> object that called the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-createtextservices">CreateTextServices</a> function to create a windowless rich edit control.
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
     * <td>Characters are protected.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not protected.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the Protected property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Protected property is undefined.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setprotected
     */
    SetProtected(Value) {
        result := ComCall(43, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether characters are displayed as shadowed characters.
     * @remarks
     * This property corresponds to the <b>CFE_SHADOW</b> effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charformat2a">CHARFORMAT2</a> structure.
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
     * <td>Characters are displayed as shadowed characters.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not displayed as shadowed characters.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Shadow property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getshadow
     */
    GetShadow() {
        result := ComCall(44, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are displayed as shadowed characters.
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
     * <td>Characters are shadowed.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not shadowed.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the Shadow property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Shadow property is undefined.</td>
     * </tr>
     * </table>
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setshadow
     */
    SetShadow(Value) {
        result := ComCall(45, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the font size. (ITextFont.GetSize)
     * @returns {Float} Type: <b>float*</b>
     * 
     * The font size, in floating-point points.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getsize
     */
    GetSize() {
        result := ComCall(46, this, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the font size.
     * @param {Float} Value Type: <b>float</b>
     * 
     * The new font size, in floating-point points.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setsize
     */
    SetSize(Value) {
        result := ComCall(47, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether characters are in small capital letters.
     * @remarks
     * This property corresponds to the <b>CFE_SMALLCAPS</b> effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charformat2a">CHARFORMAT2</a> structure.
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
     * <td>Characters are in small capital letters.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not in small capital letters.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The SmallCaps property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getsmallcaps
     */
    GetSmallCaps() {
        result := ComCall(48, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are in small capital letters.
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
     * <td>Characters are in small capital letters.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not in small capital letters.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the SmallCaps property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The SmallCaps property is undefined.</td>
     * </tr>
     * </table>
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setsmallcaps
     */
    SetSmallCaps(Value) {
        result := ComCall(49, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the amount of horizontal spacing between characters.
     * @remarks
     * Displayed text typically has an intercharacter spacing value of zero. Positive values expand the spacing, and negative values compress it.
     * @returns {Float} Type: <b>float*</b>
     * 
     * The amount of horizontal spacing between characters, in floating-point points.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getspacing
     */
    GetSpacing() {
        result := ComCall(50, this, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the amount of horizontal spacing between characters.
     * @remarks
     * Displayed text typically has an intercharacter spacing value of zero. Positive values expand the spacing, and negative values compress it.
     * @param {Float} Value Type: <b>float</b>
     * 
     * The new amount of horizontal spacing between characters, in floating-point points.
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setspacing
     */
    SetSpacing(Value) {
        result := ComCall(51, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether characters are displayed with a horizontal line through the center.
     * @remarks
     * This property corresponds to the <b>CFE_STRIKEOUT</b> effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charformat2a">CHARFORMAT2</a> structure.
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
     * <td>Characters are displayed with a horizontal line through the center.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not displayed with a horizontal line through the center.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The StrikeThrough property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getstrikethrough
     */
    GetStrikeThrough() {
        result := ComCall(52, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are displayed with a horizontal line through the center.
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
     * <td>Characters have a horizontal line through the center.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters do not have a horizontal line through the center.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the StrikeThrough property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The StrikeThrough property is undefined.</td>
     * </tr>
     * </table>
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setstrikethrough
     */
    SetStrikeThrough(Value) {
        result := ComCall(53, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether characters are displayed as subscript.
     * @remarks
     * This property corresponds to the <b>CFE_SUBSCRIPT</b> effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charformat2a">CHARFORMAT2</a> structure.
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
     * <td>Characters are displayed as subscript.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not displayed as subscript.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Subscript property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getsubscript
     */
    GetSubscript() {
        result := ComCall(54, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are displayed as subscript.
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
     * <td>Characters are displayed as subscript.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not displayed as subscript.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the Subscript property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Subscript property is undefined.</td>
     * </tr>
     * </table>
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setsubscript
     */
    SetSubscript(Value) {
        result := ComCall(55, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether characters are displayed as superscript.
     * @remarks
     * This property corresponds to the <b>CFE_SUPERSCRIPT</b> effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charformat2a">CHARFORMAT2</a> structure.
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
     * <td>Characters are displayed as superscript.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not displayed as superscript.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Superscript property is undefined.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getsuperscript
     */
    GetSuperscript() {
        result := ComCall(56, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether characters are displayed as superscript.
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
     * <td>Characters are displayed as superscript.</td>
     * </tr>
     * <tr>
     * <td><b>tomFalse</b></td>
     * <td>Characters are not displayed as superscript.</td>
     * </tr>
     * <tr>
     * <td><b>tomToggle</b></td>
     * <td>Toggle the state of the Superscript property.</td>
     * </tr>
     * <tr>
     * <td><b>tomUndefined</b></td>
     * <td>The Superscript property is undefined.</td>
     * </tr>
     * </table>
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setsuperscript
     */
    SetSuperscript(Value) {
        result := ComCall(57, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the type of underlining for the characters in a range.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getunderline
     */
    GetUnderline() {
        result := ComCall(58, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the type of underlining for the characters in a range.
     * @param {Integer} Value Type: <b>long</b>
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setunderline
     */
    SetUnderline(Value) {
        result := ComCall(59, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the font weight for the characters in a range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The font weight. The
     * 				Bold property is a binary version of the 
     * 				Weight property that sets the weight to <b>FW_BOLD</b>. The font weight exists in the 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure and the 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ifont">IFont</a> interface. Windows defines the following degrees of font weight. 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Font weight</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td><b>FW_DONTCARE</b></td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td><b>FW_THIN</b></td>
     * <td>100</td>
     * </tr>
     * <tr>
     * <td><b>FW_EXTRALIGHT</b></td>
     * <td>200</td>
     * </tr>
     * <tr>
     * <td><b>FW_LIGHT</b></td>
     * <td>300</td>
     * </tr>
     * <tr>
     * <td><b>FW_NORMAL</b></td>
     * <td>400</td>
     * </tr>
     * <tr>
     * <td><b>FW_MEDIUM</b></td>
     * <td>500</td>
     * </tr>
     * <tr>
     * <td><b>FW_SEMIBOLD</b></td>
     * <td>600</td>
     * </tr>
     * <tr>
     * <td><b>FW_BOLD</b></td>
     * <td>700</td>
     * </tr>
     * <tr>
     * <td><b>FW_EXTRABOLD</b></td>
     * <td>800</td>
     * </tr>
     * <tr>
     * <td><b>FW_HEAVY</b></td>
     * <td>900</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getweight
     */
    GetWeight() {
        result := ComCall(60, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the font weight for the characters in a range.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new font weight. The
     * 				Bold property is a binary version of the 
     * 				Weight property that sets the weight to <b>FW_BOLD</b>. The font weight exists in the 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure and the 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ifont">IFont</a> interface. Windows defines the following degrees of font weight. 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Font weight</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td><b>FW_DONTCARE</b></td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td><b>FW_THIN</b></td>
     * <td>100</td>
     * </tr>
     * <tr>
     * <td><b>FW_EXTRALIGHT</b></td>
     * <td>200</td>
     * </tr>
     * <tr>
     * <td><b>FW_LIGHT</b></td>
     * <td>300</td>
     * </tr>
     * <tr>
     * <td><b>FW_NORMAL</b></td>
     * <td>400</td>
     * </tr>
     * <tr>
     * <td><b>FW_MEDIUM</b></td>
     * <td>500</td>
     * </tr>
     * <tr>
     * <td><b>FW_SEMIBOLD</b></td>
     * <td>600</td>
     * </tr>
     * <tr>
     * <td><b>FW_BOLD</b></td>
     * <td>700</td>
     * </tr>
     * <tr>
     * <td><b>FW_EXTRABOLD</b></td>
     * <td>800</td>
     * </tr>
     * <tr>
     * <td><b>FW_HEAVY</b></td>
     * <td>900</td>
     * </tr>
     * </table>
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
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font object is attached to a range that has been deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setweight
     */
    SetWeight(Value) {
        result := ComCall(61, this, "int", Value, "HRESULT")
        return result
    }
}
