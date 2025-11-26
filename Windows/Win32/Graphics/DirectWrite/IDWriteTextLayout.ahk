#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_TEXT_RANGE.ahk
#Include .\DWRITE_TEXT_METRICS.ahk
#Include .\DWRITE_OVERHANG_METRICS.ahk
#Include .\IDWriteTextFormat.ahk

/**
 * The IDWriteTextLayout interface represents a block of text after it has been fully analyzed and formatted.
 * @remarks
 * 
 * To get a reference to the <b>IDWriteTextLayout</b> interface, the application must call the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtextlayout">IDWriteFactory::CreateTextLayout</a> method, as shown in the following code.  
 * 
 * 
 * ```cpp
 * 
 * // Create a text layout using the text format.
 * if (SUCCEEDED(hr))
 * {
 *     RECT rect;
 *     GetClientRect(hwnd_, &rect); 
 *     float width  = rect.right  / dpiScaleX_;
 *     float height = rect.bottom / dpiScaleY_;
 * 
 *     hr = pDWriteFactory_->CreateTextLayout(
 *         wszText_,      // The string to be laid out and formatted.
 *         cTextLength_,  // The length of the string.
 *         pTextFormat_,  // The text format to apply to the string (contains font information, etc).
 *         width,         // The width of the layout box.
 *         height,        // The height of the layout box.
 *         &pTextLayout_  // The IDWriteTextLayout interface pointer.
 *         );
 * }
 * 
 * 
 * ```
 * 
 * 
 * The <b>IDWriteTextLayout</b> interface allows the application to change the format for ranges of the text it represents, specified by a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a> structure.   The following example shows how to set the font weight for a text range.
 * 
 * 
 * ```cpp
 * 
 * // Set the font weight to bold for the first 5 letters.
 * DWRITE_TEXT_RANGE textRange = {0, 4};
 * 
 * if (SUCCEEDED(hr))
 * {
 *     hr = pTextLayout_->SetFontWeight(DWRITE_FONT_WEIGHT_BOLD, textRange);
 * }
 * 
 * 
 * ```
 * 
 * 
 * <b>IDWriteTextLayout</b> also provides methods for adding strikethrough,  underline, and inline objects to the text.
 * 
 * To draw the block of text represented by an <b>IDWriteTextLayout</b> object, <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-portal">Direct2D</a> provides the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtextlayout">ID2D1RenderTarget::DrawTextLayout</a> method. To draw using a custom renderer implement an <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextrenderer">IDWriteTextRenderer</a> interface and  call the  <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-draw">IDWriteTextLayout::Draw</a> method
 * 
 * <h3><a id="DirectWrite_and_Direct2D"></a><a id="directwrite_and_direct2d"></a><a id="DIRECTWRITE_AND_DIRECT2D"></a>DirectWrite and Direct2D</h3>
 * To draw a formatted string represented by an <b>IDWriteTextLayout</b> object, <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-portal">Direct2D</a> provides the  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtextlayout">ID2D1RenderTarget::DrawTextLayout</a> method.
 * 
 * <h3><a id="Other_Rendering_Options"></a><a id="other_rendering_options"></a><a id="OTHER_RENDERING_OPTIONS"></a>Other Rendering Options</h3>
 * To render using a custom renderer, use the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-draw">IDWriteTextLayout::Draw</a> method, which takes a callback interface derived from <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextrenderer">IDWriteTextRenderer</a> as an argument, as shown in the following code.
 * 
 * 
 * ```cpp
 * 
 * // Draw the text layout using DirectWrite and the CustomTextRenderer class.
 * hr = pTextLayout_->Draw(
 *         NULL,
 *         pTextRenderer_,  // Custom text renderer.
 *         origin.x,
 *         origin.y
 *         );
 * 
 * 
 * ```
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextrenderer">IDWriteTextRenderer</a> declares methods for drawing a glyph run, underline, strikethrough and inline objects.  It is up to the application to implement these methods.  Creating a custom text renderer allows the application to apply additional effects when rendering text, such as a custom fill or outline.
 * 
 * Using a custom text renderer also enables you to render using another technology, such as GDI.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritetextlayout
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextLayout extends IDWriteTextFormat{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextLayout
     * @type {Guid}
     */
    static IID => Guid("{53737037-6d14-410b-9bfe-0b182bb70961}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMaxWidth", "SetMaxHeight", "SetFontCollection", "SetFontFamilyName", "SetFontWeight", "SetFontStyle", "SetFontStretch", "SetFontSize", "SetUnderline", "SetStrikethrough", "SetDrawingEffect", "SetInlineObject", "SetTypography", "SetLocaleName", "GetMaxWidth", "GetMaxHeight", "GetFontCollection", "GetFontFamilyNameLength", "GetFontFamilyName", "GetFontWeight", "GetFontStyle", "GetFontStretch", "GetFontSize", "GetUnderline", "GetStrikethrough", "GetDrawingEffect", "GetInlineObject", "GetTypography", "GetLocaleNameLength", "GetLocaleName", "Draw", "GetLineMetrics", "GetMetrics", "GetOverhangMetrics", "GetClusterMetrics", "DetermineMinWidth", "HitTestPoint", "HitTestTextPosition", "HitTestTextRange"]

    /**
     * Sets the layout maximum width.
     * @param {Float} maxWidth Type: <b>FLOAT</b>
     * 
     * A value that indicates the maximum width of the layout box.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setmaxwidth
     */
    SetMaxWidth(maxWidth) {
        result := ComCall(28, this, "float", maxWidth, "HRESULT")
        return result
    }

    /**
     * Sets the layout maximum height.
     * @param {Float} maxHeight Type: <b>FLOAT</b>
     * 
     * A value that indicates the maximum height of the layout box.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setmaxheight
     */
    SetMaxHeight(maxHeight) {
        result := ComCall(29, this, "float", maxHeight, "HRESULT")
        return result
    }

    /**
     * Sets the font collection.
     * @param {IDWriteFontCollection} fontCollection Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a>*</b>
     * 
     * The font collection to set.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * Text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setfontcollection
     */
    SetFontCollection(fontCollection, textRange) {
        result := ComCall(30, this, "ptr", fontCollection, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Sets null-terminated font family name for text within a specified text range.
     * @param {PWSTR} fontFamilyName Type: <b>const WCHAR*</b>
     * 
     * The font family name that applies to the entire text string within the range specified by <i>textRange</i>.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * Text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setfontfamilyname
     */
    SetFontFamilyName(fontFamilyName, textRange) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName

        result := ComCall(31, this, "ptr", fontFamilyName, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Sets the font weight for text within a text range specified by a DWRITE_TEXT_RANGE structure.
     * @param {Integer} fontWeight Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a></b>
     * 
     * The font weight to be set for text within the range specified by <i>textRange</i>.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * Text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setfontweight
     */
    SetFontWeight(fontWeight, textRange) {
        result := ComCall(32, this, "int", fontWeight, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Sets the font style for text within a text range specified by a DWRITE_TEXT_RANGE structure.
     * @param {Integer} fontStyle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style">DWRITE_FONT_STYLE</a></b>
     * 
     * The  font style to be set   for text within a range specified by <i>textRange</i>.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * The text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setfontstyle
     */
    SetFontStyle(fontStyle, textRange) {
        result := ComCall(33, this, "int", fontStyle, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Sets the font stretch for text within a specified text range.
     * @param {Integer} fontStretch Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch">DWRITE_FONT_STRETCH</a></b>
     * 
     * A value which indicates the type of font stretch for text within the range specified by <i>textRange</i>.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * Text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setfontstretch
     */
    SetFontStretch(fontStretch, textRange) {
        result := ComCall(34, this, "int", fontStretch, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Sets the font size in DIP units for text within a specified text range.
     * @param {Float} fontSize Type: <b>FLOAT</b>
     * 
     * The  font size in DIP units to be set for   text in the range specified by <i>textRange</i>.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * Text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setfontsize
     */
    SetFontSize(fontSize, textRange) {
        result := ComCall(35, this, "float", fontSize, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Sets underlining for text within a specified text range.
     * @param {BOOL} hasUnderline Type: <b>BOOL</b>
     * 
     * A Boolean flag that indicates whether underline takes place within a specified text range.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * Text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setunderline
     */
    SetUnderline(hasUnderline, textRange) {
        result := ComCall(36, this, "int", hasUnderline, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Sets strikethrough for text within a specified text range.
     * @param {BOOL} hasStrikethrough Type: <b>BOOL</b>
     * 
     * A Boolean flag that indicates whether strikethrough takes place in the range specified by <i>textRange</i>.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * Text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setstrikethrough
     */
    SetStrikethrough(hasStrikethrough, textRange) {
        result := ComCall(37, this, "int", hasStrikethrough, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Sets the application-defined drawing effect.
     * @param {IUnknown} drawingEffect Type: <b>IUnknown*</b>
     * 
     * Application-defined drawing effects that apply to the range. This data object will be passed back to the application's drawing callbacks for final rendering.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * The text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setdrawingeffect
     */
    SetDrawingEffect(drawingEffect, textRange) {
        result := ComCall(38, this, "ptr", drawingEffect, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Sets the inline object.
     * @param {IDWriteInlineObject} inlineObject Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriteinlineobject">IDWriteInlineObject</a>*</b>
     * 
     * An application-defined inline object.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * Text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setinlineobject
     */
    SetInlineObject(inlineObject, textRange) {
        result := ComCall(39, this, "ptr", inlineObject, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Sets font typography features for text within a specified text range.
     * @param {IDWriteTypography} typography Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetypography">IDWriteTypography</a>*</b>
     * 
     * Pointer to font typography settings.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * Text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-settypography
     */
    SetTypography(typography, textRange) {
        result := ComCall(40, this, "ptr", typography, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Sets the locale name for text within a specified text range.
     * @param {PWSTR} localeName Type: <b>const WCHAR*</b>
     * 
     * A null-terminated locale name string.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * Text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-setlocalename
     */
    SetLocaleName(localeName, textRange) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(41, this, "ptr", localeName, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Gets the layout maximum width.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * Returns the layout maximum width.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getmaxwidth
     */
    GetMaxWidth() {
        result := ComCall(42, this, "float")
        return result
    }

    /**
     * Gets the layout maximum height.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * The layout maximum height.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getmaxheight
     */
    GetMaxHeight() {
        result := ComCall(43, this, "float")
        return result
    }

    /**
     * Gets the font collection associated with the text at the specified position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The position of the text to inspect.
     * @param {Pointer<IDWriteFontCollection>} fontCollection Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a>**</b>
     * 
     * Contains an address of a  pointer to the current font collection.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the underline.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getfontcollection
     */
    GetFontCollection(currentPosition, fontCollection, textRange) {
        result := ComCall(44, this, "uint", currentPosition, "ptr*", fontCollection, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Get the length of the font family name at the current position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The current text position.
     * @param {Pointer<Integer>} nameLength Type: <b>UINT32*</b>
     * 
     * When this method returns, contains the size of the character array containing the font family name, in character count, not including the terminated <b>NULL</b> character.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the font family.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getfontfamilynamelength
     */
    GetFontFamilyNameLength(currentPosition, nameLength, textRange) {
        nameLengthMarshal := nameLength is VarRef ? "uint*" : "ptr"

        result := ComCall(45, this, "uint", currentPosition, nameLengthMarshal, nameLength, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Copies the font family name of the text at the specified position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The position of the text to examine.
     * @param {PWSTR} fontFamilyName Type: <b>WCHAR*</b>
     * 
     * When this method returns, contains an array of characters that receives the current font family name. You must allocate storage for this parameter.
     * @param {Integer} nameSize Type: <b>UINT32</b>
     * 
     * The size of the character array in character count including the terminated <b>NULL</b> character.
     * @returns {DWRITE_TEXT_RANGE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the font family name.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getfontfamilyname
     */
    GetFontFamilyName(currentPosition, fontFamilyName, nameSize) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName

        textRange := DWRITE_TEXT_RANGE()
        result := ComCall(46, this, "uint", currentPosition, "ptr", fontFamilyName, "uint", nameSize, "ptr", textRange, "HRESULT")
        return textRange
    }

    /**
     * Gets the font weight of the text at the specified position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The position of the text to inspect.
     * @param {Pointer<Integer>} fontWeight Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a>*</b>
     * 
     * When this method returns, contains a value which indicates the type of font weight being applied at the specified position.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the font weight.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getfontweight
     */
    GetFontWeight(currentPosition, fontWeight, textRange) {
        fontWeightMarshal := fontWeight is VarRef ? "int*" : "ptr"

        result := ComCall(47, this, "uint", currentPosition, fontWeightMarshal, fontWeight, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Gets the font style (also known as slope) of the text at the specified position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The position of the text to inspect.
     * @param {Pointer<Integer>} fontStyle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style">DWRITE_FONT_STYLE</a>*</b>
     * 
     * When this method returns, contains a value which indicates the type of font style (also known as slope or incline) being applied at the specified position.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the font style.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getfontstyle
     */
    GetFontStyle(currentPosition, fontStyle, textRange) {
        fontStyleMarshal := fontStyle is VarRef ? "int*" : "ptr"

        result := ComCall(48, this, "uint", currentPosition, fontStyleMarshal, fontStyle, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Gets the font stretch of the text at the specified position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The position of the text to inspect.
     * @param {Pointer<Integer>} fontStretch Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch">DWRITE_FONT_STRETCH</a>*</b>
     * 
     * When this method returns, contains a value which indicates the type of font stretch (also known as width) being applied at the specified position.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the font stretch.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getfontstretch
     */
    GetFontStretch(currentPosition, fontStretch, textRange) {
        fontStretchMarshal := fontStretch is VarRef ? "int*" : "ptr"

        result := ComCall(49, this, "uint", currentPosition, fontStretchMarshal, fontStretch, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Gets the font em height of the text at the specified position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The position of the text to inspect.
     * @param {Pointer<Float>} fontSize Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the size of the font in ems  of the text at the specified position.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the font size.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getfontsize
     */
    GetFontSize(currentPosition, fontSize, textRange) {
        fontSizeMarshal := fontSize is VarRef ? "float*" : "ptr"

        result := ComCall(50, this, "uint", currentPosition, fontSizeMarshal, fontSize, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Gets the underline presence of the text at the specified position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The current text position.
     * @param {Pointer<BOOL>} hasUnderline Type: <b>BOOL*</b>
     * 
     * A Boolean  flag that indicates whether underline is present at the position indicated by <i>currentPosition</i>.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the underline.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getunderline
     */
    GetUnderline(currentPosition, hasUnderline, textRange) {
        hasUnderlineMarshal := hasUnderline is VarRef ? "int*" : "ptr"

        result := ComCall(51, this, "uint", currentPosition, hasUnderlineMarshal, hasUnderline, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Get the strikethrough presence of the text at the specified position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The position of the text to inspect.
     * @param {Pointer<BOOL>} hasStrikethrough Type: <b>BOOL*</b>
     * 
     * A Boolean  flag that indicates whether strikethrough is present at the position indicated by <i>currentPosition</i>.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * Contains the range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to strikethrough.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getstrikethrough
     */
    GetStrikethrough(currentPosition, hasStrikethrough, textRange) {
        hasStrikethroughMarshal := hasStrikethrough is VarRef ? "int*" : "ptr"

        result := ComCall(52, this, "uint", currentPosition, hasStrikethroughMarshal, hasStrikethrough, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Gets the application-defined drawing effect at the specified text position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The position of the text whose drawing effect is to be retrieved.
     * @param {Pointer<IUnknown>} drawingEffect Type: <b>IUnknown**</b>
     * 
     * When this method returns, contains an address of a pointer to  the current application-defined drawing effect. Usually this effect is a foreground brush that  is used in glyph drawing.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * Contains the range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the drawing effect.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getdrawingeffect
     */
    GetDrawingEffect(currentPosition, drawingEffect, textRange) {
        result := ComCall(53, this, "uint", currentPosition, "ptr*", drawingEffect, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Gets the inline object at the specified position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The specified text position.
     * @param {Pointer<IDWriteInlineObject>} inlineObject Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriteinlineobject">IDWriteInlineObject</a>**</b>
     * 
     * Contains the application-defined inline object.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the inline object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getinlineobject
     */
    GetInlineObject(currentPosition, inlineObject, textRange) {
        result := ComCall(54, this, "uint", currentPosition, "ptr*", inlineObject, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Gets the typography setting of the text at the specified position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The position of the text to inspect.
     * @param {Pointer<IDWriteTypography>} typography Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetypography">IDWriteTypography</a>**</b>
     * 
     * When this method returns, contains an address of a  pointer to the current typography setting.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the typography.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-gettypography
     */
    GetTypography(currentPosition, typography, textRange) {
        result := ComCall(55, this, "uint", currentPosition, "ptr*", typography, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Gets the length of the locale name of the text at the specified position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The position of the text to inspect.
     * @param {Pointer<Integer>} nameLength Type: <b>UINT32*</b>
     * 
     * Size of the character array, in character count, not including the terminated <b>NULL</b> character.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the locale name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getlocalenamelength
     */
    GetLocaleNameLength(currentPosition, nameLength, textRange) {
        nameLengthMarshal := nameLength is VarRef ? "uint*" : "ptr"

        result := ComCall(56, this, "uint", currentPosition, nameLengthMarshal, nameLength, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * Gets the locale name of the text at the specified position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The position of the text to inspect.
     * @param {PWSTR} localeName Type: <b>WCHAR*</b>
     * 
     * When this method returns, contains the character array receiving the current locale name.
     * @param {Integer} nameSize Type: <b>UINT32</b>
     * 
     * Size of the character array, in character count, including the terminated <b>NULL</b> character.
     * @returns {DWRITE_TEXT_RANGE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The range of text that has the same  formatting as the text at the position specified by <i>currentPosition</i>.  This means the run has the exact  formatting as the position specified, including but not limited to the locale name.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getlocalename
     */
    GetLocaleName(currentPosition, localeName, nameSize) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        textRange := DWRITE_TEXT_RANGE()
        result := ComCall(57, this, "uint", currentPosition, "ptr", localeName, "uint", nameSize, "ptr", textRange, "HRESULT")
        return textRange
    }

    /**
     * Draws text using the specified client drawing context.
     * @param {Pointer<Void>} clientDrawingContext Type: <b>void*</b>
     * 
     * An application-defined drawing context.
     * @param {IDWriteTextRenderer} renderer Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextrenderer">IDWriteTextRenderer</a>*</b>
     * 
     * Pointer to the set of callback functions used to draw parts of a text string.
     * @param {Float} originX Type: <b>FLOAT</b>
     * 
     * The x-coordinate of the layout's left side.
     * @param {Float} originY Type: <b>FLOAT</b>
     * 
     * The y-coordinate of the layout's top side.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-draw
     */
    Draw(clientDrawingContext, renderer, originX, originY) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(58, this, clientDrawingContextMarshal, clientDrawingContext, "ptr", renderer, "float", originX, "float", originY, "HRESULT")
        return result
    }

    /**
     * Retrieves the information about each individual text line of the text string.
     * @param {Pointer<DWRITE_LINE_METRICS>} lineMetrics Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_line_metrics">DWRITE_LINE_METRICS</a>*</b>
     * 
     * When this method returns, contains a pointer to an array of structures containing various calculated length values of individual text lines.
     * @param {Integer} maxLineCount Type: <b>UINT32</b>
     * 
     * The maximum size of the <i>lineMetrics</i> array.
     * @param {Pointer<Integer>} actualLineCount Type: <b>UINT32*</b>
     * 
     * When this method returns, contains the actual size of the <i>lineMetrics</i>array that is needed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getlinemetrics
     */
    GetLineMetrics(lineMetrics, maxLineCount, actualLineCount) {
        actualLineCountMarshal := actualLineCount is VarRef ? "uint*" : "ptr"

        result := ComCall(59, this, "ptr", lineMetrics, "uint", maxLineCount, actualLineCountMarshal, actualLineCount, "HRESULT")
        return result
    }

    /**
     * Retrieves overall metrics for the formatted string.
     * @returns {DWRITE_TEXT_METRICS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_metrics">DWRITE_TEXT_METRICS</a>*</b>
     * 
     * When this method returns, contains the measured distances of text and associated content after being formatted.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getmetrics
     */
    GetMetrics() {
        textMetrics := DWRITE_TEXT_METRICS()
        result := ComCall(60, this, "ptr", textMetrics, "HRESULT")
        return textMetrics
    }

    /**
     * Returns the overhangs (in DIPs) of the layout and all objects contained in it, including text glyphs and inline objects.
     * @returns {DWRITE_OVERHANG_METRICS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_overhang_metrics">DWRITE_OVERHANG_METRICS</a>*</b>
     * 
     * Overshoots of visible extents (in DIPs) outside the layout.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getoverhangmetrics
     */
    GetOverhangMetrics() {
        overhangs := DWRITE_OVERHANG_METRICS()
        result := ComCall(61, this, "ptr", overhangs, "HRESULT")
        return overhangs
    }

    /**
     * Retrieves logical properties and measurements of each glyph cluster.
     * @param {Pointer<DWRITE_CLUSTER_METRICS>} clusterMetrics Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_cluster_metrics">DWRITE_CLUSTER_METRICS</a>*</b>
     * 
     * When this method returns, contains metrics, such as line-break or total advance width, for a glyph cluster.
     * @param {Integer} maxClusterCount Type: <b>UINT32</b>
     * 
     * The maximum size of the <i>clusterMetrics</i> array.
     * @param {Pointer<Integer>} actualClusterCount Type: <b>UINT32*</b>
     * 
     * When this method returns, contains the actual size of the <i>clusterMetrics</i> array that is needed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-getclustermetrics
     */
    GetClusterMetrics(clusterMetrics, maxClusterCount, actualClusterCount) {
        actualClusterCountMarshal := actualClusterCount is VarRef ? "uint*" : "ptr"

        result := ComCall(62, this, "ptr", clusterMetrics, "uint", maxClusterCount, actualClusterCountMarshal, actualClusterCount, "HRESULT")
        return result
    }

    /**
     * Determines the minimum possible width the layout can be set to without emergency breaking between the characters of whole words occurring.
     * @returns {Float} Type: <b>FLOAT*</b>
     * 
     * Minimum width.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-determineminwidth
     */
    DetermineMinWidth() {
        result := ComCall(63, this, "float*", &minWidth := 0, "HRESULT")
        return minWidth
    }

    /**
     * The application calls this function passing in a specific pixel location relative to the top-left location of the layout box and obtains the information about the correspondent hit-test metrics of the text string where the hit-test has occurred.
     * @param {Float} pointX Type: <b>FLOAT</b>
     * 
     * The pixel location X to hit-test, relative to the top-left location of the layout box.
     * @param {Float} pointY Type: <b>FLOAT</b>
     * 
     * The pixel location Y to hit-test, relative to the top-left location of the layout box.
     * @param {Pointer<BOOL>} isTrailingHit Type: <b>BOOL*</b>
     * 
     * An output flag that indicates whether the hit-test location is at the leading or the trailing
     *          side of the character. When the output <i>*isInside</i> value is set to <b>FALSE</b>, this value is set according to the output
     *          <i>hitTestMetrics-&gt;textPosition</i> value to represent the edge closest to the hit-test location.
     * @param {Pointer<BOOL>} isInside Type: <b>BOOL*</b>
     * 
     * An output flag that indicates whether the hit-test location is inside the text string.
     *          When <b>FALSE</b>, the position nearest the text's edge is returned.
     * @param {Pointer<DWRITE_HIT_TEST_METRICS>} hitTestMetrics Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_hit_test_metrics">DWRITE_HIT_TEST_METRICS</a>*</b>
     * 
     * The output geometry fully enclosing the hit-test location. When the output <i>*isInside</i> value
     *          is set to <b>FALSE</b>, this structure represents the geometry enclosing the edge closest to the hit-test location.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-hittestpoint
     */
    HitTestPoint(pointX, pointY, isTrailingHit, isInside, hitTestMetrics) {
        isTrailingHitMarshal := isTrailingHit is VarRef ? "int*" : "ptr"
        isInsideMarshal := isInside is VarRef ? "int*" : "ptr"

        result := ComCall(64, this, "float", pointX, "float", pointY, isTrailingHitMarshal, isTrailingHit, isInsideMarshal, isInside, "ptr", hitTestMetrics, "HRESULT")
        return result
    }

    /**
     * The application calls this function to get the pixel location relative to the top-left of the layout box given the text position and the logical side of the position.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The text position used to get the pixel location.
     * @param {BOOL} isTrailingHit Type: <b>BOOL</b>
     * 
     * A Boolean flag that indicates whether the pixel location is of the leading or the trailing side of the specified text position.
     * @param {Pointer<Float>} pointX Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the output pixel location X, relative to the top-left location of the layout box.
     * @param {Pointer<Float>} pointY Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the output pixel location Y, relative to the top-left location of the layout box.
     * @param {Pointer<DWRITE_HIT_TEST_METRICS>} hitTestMetrics Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_hit_test_metrics">DWRITE_HIT_TEST_METRICS</a>*</b>
     * 
     * When this method returns, contains the output geometry fully enclosing the specified text position.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-hittesttextposition
     */
    HitTestTextPosition(textPosition, isTrailingHit, pointX, pointY, hitTestMetrics) {
        pointXMarshal := pointX is VarRef ? "float*" : "ptr"
        pointYMarshal := pointY is VarRef ? "float*" : "ptr"

        result := ComCall(65, this, "uint", textPosition, "int", isTrailingHit, pointXMarshal, pointX, pointYMarshal, pointY, "ptr", hitTestMetrics, "HRESULT")
        return result
    }

    /**
     * The application calls this function to get a set of hit-test metrics corresponding to a range of text positions. One of the main usages is to implement highlight selection of the text string.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The first text position of the specified range.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * The number of positions of the specified range.
     * @param {Float} originX Type: <b>FLOAT</b>
     * 
     * The origin pixel location X at the left of the layout box. This offset is added to the hit-test metrics returned.
     * @param {Float} originY Type: <b>FLOAT</b>
     * 
     * The origin pixel location Y at the top of the layout box. This offset is added to the hit-test metrics returned.
     * @param {Pointer<DWRITE_HIT_TEST_METRICS>} hitTestMetrics Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_hit_test_metrics">DWRITE_HIT_TEST_METRICS</a>*</b>
     * 
     * When this method returns, contains a pointer to a buffer of the output geometry fully enclosing the specified position range.  The buffer must be at least as large as <i>maxHitTestMetricsCount</i>.
     * @param {Integer} maxHitTestMetricsCount Type: <b>UINT32</b>
     * 
     * Maximum number of boxes <i>hitTestMetrics</i> could hold in its buffer memory.
     * @param {Pointer<Integer>} actualHitTestMetricsCount Type: <b>UINT32*</b>
     * 
     * Actual number of geometries <i>hitTestMetrics</i> holds in its buffer memory.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextlayout-hittesttextrange
     */
    HitTestTextRange(textPosition, textLength, originX, originY, hitTestMetrics, maxHitTestMetricsCount, actualHitTestMetricsCount) {
        actualHitTestMetricsCountMarshal := actualHitTestMetricsCount is VarRef ? "uint*" : "ptr"

        result := ComCall(66, this, "uint", textPosition, "uint", textLength, "float", originX, "float", originY, "ptr", hitTestMetrics, "uint", maxHitTestMetricsCount, actualHitTestMetricsCountMarshal, actualHitTestMetricsCount, "HRESULT")
        return result
    }
}
