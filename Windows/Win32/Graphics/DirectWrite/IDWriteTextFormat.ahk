#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontCollection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDWriteTextFormat interface describes the font and paragraph properties used to format text, and it describes locale information.
 * @remarks
 * 
 * To get a reference to the <b>IDWriteTextFormat</b> interface, the application must call the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtextformat">IDWriteFactory::CreateTextFormat</a> method as shown in the following code.
 * 
 * 
 * ```cpp
 * 
 * if (SUCCEEDED(hr))
 * {
 *     hr = pDWriteFactory_->CreateTextFormat(
 *         L"Gabriola",
 *         NULL,
 *         DWRITE_FONT_WEIGHT_REGULAR,
 *         DWRITE_FONT_STYLE_NORMAL,
 *         DWRITE_FONT_STRETCH_NORMAL,
 *         72.0f,
 *         L"en-us",
 *         &pTextFormat_
 *         );
 * }
 * 
 * 
 * ```
 * 
 * 
 * When creating an <b>IDWriteTextFormat</b> object using the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtextformat">CreateTextFormat</a> function, the application specifies the  font family, font collection, font weight, font size, and locale name for the text format.
 * 
 * These properties cannot be changed after the <b>IDWriteTextFormat</b> object is created.  To change these properties, a new <b>IDWriteTextFormat</b> object must be created with the desired properties.
 * 
 * The <b>IDWriteTextFormat</b> interface is used to draw text with a single format
 * 
 * To draw text with multiple formats, or to use a custom text renderer, use the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextlayout">IDWriteTextLayout</a> interface.  <b>IDWriteTextLayout</b> enables the application to change the format for ranges of text within the string.  The <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtextlayout">IDWriteFactory::CreateTextLayout</a> takes an <b>IDWriteTextFormat</b> object as a parameter and initially applies the format information to the entire string.
 *       
 * 
 * This object may not be thread-safe, and it may carry the state of text format change.
 *       
 * 
 * <h3><a id="DirectWrite_and_Direct2D"></a><a id="directwrite_and_direct2d"></a><a id="DIRECTWRITE_AND_DIRECT2D"></a>DirectWrite and Direct2D</h3>
 * To draw simple text with a single format, <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-portal">Direct2D</a> provides the  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtext(constwchar_uint32_idwritetextformat_constd2d1_rect_f__id2d1brush_d2d1_draw_text_options_dwrite_measuring_mode)">ID2D1RenderTarget::DrawText</a> method, which draws a string using the format information provided by an <b>IDWriteTextFormat</b> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritetextformat
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextFormat extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextFormat
     * @type {Guid}
     */
    static IID => Guid("{9c906818-31d7-4fd3-a151-7c5e225db55a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTextAlignment", "SetParagraphAlignment", "SetWordWrapping", "SetReadingDirection", "SetFlowDirection", "SetIncrementalTabStop", "SetTrimming", "SetLineSpacing", "GetTextAlignment", "GetParagraphAlignment", "GetWordWrapping", "GetReadingDirection", "GetFlowDirection", "GetIncrementalTabStop", "GetTrimming", "GetLineSpacing", "GetFontCollection", "GetFontFamilyNameLength", "GetFontFamilyName", "GetFontWeight", "GetFontStyle", "GetFontStretch", "GetFontSize", "GetLocaleNameLength", "GetLocaleName"]

    /**
     * Sets the alignment of text in a paragraph, relative to the leading and trailing edge of a layout box for a IDWriteTextFormat interface.
     * @param {Integer} textAlignment Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_text_alignment">DWRITE_TEXT_ALIGNMENT</a></b>
     * 
     * The text alignment option being set for the paragraph of type DWRITE_TEXT_ALIGNMENT.  For more information, see Remarks.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The textAlignment argument is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-settextalignment
     */
    SetTextAlignment(textAlignment) {
        result := ComCall(3, this, "int", textAlignment, "HRESULT")
        return result
    }

    /**
     * Sets the alignment option of a paragraph relative to the layout box's top and bottom edge.
     * @param {Integer} paragraphAlignment Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_paragraph_alignment">DWRITE_PARAGRAPH_ALIGNMENT</a></b>
     * 
     * The paragraph alignment option being set for a paragraph; see <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_paragraph_alignment">DWRITE_PARAGRAPH_ALIGNMENT</a> for more information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-setparagraphalignment
     */
    SetParagraphAlignment(paragraphAlignment) {
        result := ComCall(4, this, "int", paragraphAlignment, "HRESULT")
        return result
    }

    /**
     * Sets the word wrapping option.
     * @param {Integer} wordWrapping Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_word_wrapping">DWRITE_WORD_WRAPPING</a></b>
     * 
     * The word wrapping option being set for a paragraph; see <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_word_wrapping">DWRITE_WORD_WRAPPING</a> for more information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-setwordwrapping
     */
    SetWordWrapping(wordWrapping) {
        result := ComCall(5, this, "int", wordWrapping, "HRESULT")
        return result
    }

    /**
     * Sets the paragraph reading direction.
     * @param {Integer} readingDirection Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_reading_direction">DWRITE_READING_DIRECTION</a></b>
     * 
     * The text reading direction (for example, <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_reading_direction">DWRITE_READING_DIRECTION_RIGHT_TO_LEFT</a> for languages, such as 
     *             Arabic, that read from right to left) for a paragraph.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-setreadingdirection
     */
    SetReadingDirection(readingDirection) {
        result := ComCall(6, this, "int", readingDirection, "HRESULT")
        return result
    }

    /**
     * Sets the paragraph flow direction.
     * @param {Integer} flowDirection Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_flow_direction">DWRITE_FLOW_DIRECTION</a></b>
     * 
     * The paragraph flow direction; see <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_flow_direction">DWRITE_FLOW_DIRECTION</a> for more information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-setflowdirection
     */
    SetFlowDirection(flowDirection) {
        result := ComCall(7, this, "int", flowDirection, "HRESULT")
        return result
    }

    /**
     * Sets a fixed distance between two adjacent tab stops.
     * @param {Float} incrementalTabStop Type: <b>FLOAT</b>
     * 
     * The fixed distance between two adjacent tab stops.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-setincrementaltabstop
     */
    SetIncrementalTabStop(incrementalTabStop) {
        result := ComCall(8, this, "float", incrementalTabStop, "HRESULT")
        return result
    }

    /**
     * Sets trimming options for text overflowing the layout width.
     * @param {Pointer<DWRITE_TRIMMING>} trimmingOptions Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_trimming">DWRITE_TRIMMING</a>*</b>
     * 
     * Text trimming options.
     * @param {IDWriteInlineObject} trimmingSign Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriteinlineobject">IDWriteInlineObject</a>*</b>
     * 
     * Application-defined omission sign. This parameter may be <b>NULL</b>. See <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriteinlineobject">IDWriteInlineObject</a> for more information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-settrimming
     */
    SetTrimming(trimmingOptions, trimmingSign) {
        result := ComCall(9, this, "ptr", trimmingOptions, "ptr", trimmingSign, "HRESULT")
        return result
    }

    /**
     * Sets the line spacing.
     * @param {Integer} lineSpacingMethod Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_line_spacing_method">DWRITE_LINE_SPACING_METHOD</a></b>
     * 
     * Specifies how line height is being determined; see <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_line_spacing_method">DWRITE_LINE_SPACING_METHOD</a> for more information.
     * @param {Float} lineSpacing Type: <b>FLOAT</b>
     * 
     * The line height, or distance between one baseline to another.
     * @param {Float} baseline Type: <b>FLOAT</b>
     * 
     * The distance from top of line to baseline. A reasonable ratio to <i>lineSpacing</i> is 80 percent.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-setlinespacing
     */
    SetLineSpacing(lineSpacingMethod, lineSpacing, baseline) {
        result := ComCall(10, this, "int", lineSpacingMethod, "float", lineSpacing, "float", baseline, "HRESULT")
        return result
    }

    /**
     * Gets the alignment option of text relative to the layout box's leading and trailing edge.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_text_alignment">DWRITE_TEXT_ALIGNMENT</a></b>
     * 
     * Returns the text alignment option of the current paragraph.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-gettextalignment
     */
    GetTextAlignment() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * Gets the alignment option of a paragraph which is relative to the top and bottom edges of a layout box.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_paragraph_alignment">DWRITE_PARAGRAPH_ALIGNMENT</a></b>
     * 
     * A value that indicates the current paragraph alignment option.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getparagraphalignment
     */
    GetParagraphAlignment() {
        result := ComCall(12, this, "int")
        return result
    }

    /**
     * Gets the word wrapping option.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_word_wrapping">DWRITE_WORD_WRAPPING</a></b>
     * 
     * Returns the word wrapping option; see <a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_word_wrapping">DWRITE_WORD_WRAPPING</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getwordwrapping
     */
    GetWordWrapping() {
        result := ComCall(13, this, "int")
        return result
    }

    /**
     * Gets the current reading direction for text in a paragraph.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_reading_direction">DWRITE_READING_DIRECTION</a></b>
     * 
     * A value that indicates the current reading direction for text in a  paragraph.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getreadingdirection
     */
    GetReadingDirection() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * Gets the direction that text lines flow.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_flow_direction">DWRITE_FLOW_DIRECTION</a></b>
     * 
     * The direction that text lines flow within their parent container.  For example, <a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_flow_direction">DWRITE_FLOW_DIRECTION_TOP_TO_BOTTOM</a> indicates that text lines are placed from top to bottom.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getflowdirection
     */
    GetFlowDirection() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * Gets the incremental tab stop position.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * The incremental tab stop value.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getincrementaltabstop
     */
    GetIncrementalTabStop() {
        result := ComCall(16, this, "float")
        return result
    }

    /**
     * Gets the trimming options for text that overflows the layout box.
     * @param {Pointer<DWRITE_TRIMMING>} trimmingOptions Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_trimming">DWRITE_TRIMMING</a>*</b>
     * 
     * When this method returns, it contains a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_trimming">DWRITE_TRIMMING</a> structure that holds the text trimming options for the overflowing text.
     * @param {Pointer<IDWriteInlineObject>} trimmingSign Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriteinlineobject">IDWriteInlineObject</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to a trimming omission sign. This parameter may be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-gettrimming
     */
    GetTrimming(trimmingOptions, trimmingSign) {
        result := ComCall(17, this, "ptr", trimmingOptions, "ptr*", trimmingSign, "HRESULT")
        return result
    }

    /**
     * Gets the line spacing adjustment set for a multiline text paragraph.
     * @param {Pointer<Integer>} lineSpacingMethod Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_line_spacing_method">DWRITE_LINE_SPACING_METHOD</a>*</b>
     * 
     * A value that indicates how line height is determined.
     * @param {Pointer<Float>} lineSpacing Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the line height, or  distance between one baseline to another.
     * @param {Pointer<Float>} baseline Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the distance from top of line to baseline. A reasonable ratio to <i>lineSpacing</i> is 80 percent.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getlinespacing
     */
    GetLineSpacing(lineSpacingMethod, lineSpacing, baseline) {
        lineSpacingMethodMarshal := lineSpacingMethod is VarRef ? "int*" : "ptr"
        lineSpacingMarshal := lineSpacing is VarRef ? "float*" : "ptr"
        baselineMarshal := baseline is VarRef ? "float*" : "ptr"

        result := ComCall(18, this, lineSpacingMethodMarshal, lineSpacingMethod, lineSpacingMarshal, lineSpacing, baselineMarshal, baseline, "HRESULT")
        return result
    }

    /**
     * Gets the current font collection.
     * @returns {IDWriteFontCollection} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the font collection being used for the current text.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getfontcollection
     */
    GetFontCollection() {
        result := ComCall(19, this, "ptr*", &fontCollection := 0, "HRESULT")
        return IDWriteFontCollection(fontCollection)
    }

    /**
     * Gets the length of the font family name.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The size of the character array, in character count, not including the terminated <b>NULL</b> character.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getfontfamilynamelength
     */
    GetFontFamilyNameLength() {
        result := ComCall(20, this, "uint")
        return result
    }

    /**
     * Gets a copy of the font family name.
     * @param {PWSTR} fontFamilyName Type: <b>WCHAR*</b>
     * 
     * When this method returns, contains a pointer to a character array, which is null-terminated, that receives the current font family name. The buffer allocated for this array should be at least the size, in elements, of <i>nameSize</i>.
     * @param {Integer} nameSize Type: <b>UINT32</b>
     * 
     * The size of the <i>fontFamilyName</i> character array, in character count, including the terminated <b>NULL</b> character.  To find the size of <i>fontFamilyName</i>, use <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getfontfamilynamelength">GetFontFamilyNameLength</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getfontfamilyname
     */
    GetFontFamilyName(fontFamilyName, nameSize) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName

        result := ComCall(21, this, "ptr", fontFamilyName, "uint", nameSize, "HRESULT")
        return result
    }

    /**
     * Gets the font weight of the text.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a></b>
     * 
     * A value that indicates the type of weight (such as normal, bold, or black).
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getfontweight
     */
    GetFontWeight() {
        result := ComCall(22, this, "int")
        return result
    }

    /**
     * Gets the font style of the text.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style">DWRITE_FONT_STYLE</a></b>
     * 
     * A value which indicates the type of font style (such as  slope or incline).
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getfontstyle
     */
    GetFontStyle() {
        result := ComCall(23, this, "int")
        return result
    }

    /**
     * Gets the font stretch of the text.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch">DWRITE_FONT_STRETCH</a></b>
     * 
     * A value which indicates the type of font stretch (such as  normal or condensed).
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getfontstretch
     */
    GetFontStretch() {
        result := ComCall(24, this, "int")
        return result
    }

    /**
     * Gets the font size in DIP unites.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * The current font size in DIP units.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getfontsize
     */
    GetFontSize() {
        result := ComCall(25, this, "float")
        return result
    }

    /**
     * Gets the length of the locale name.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The size of the character array in character count, not including the terminated <b>NULL</b> character.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getlocalenamelength
     */
    GetLocaleNameLength() {
        result := ComCall(26, this, "uint")
        return result
    }

    /**
     * Gets a copy of the locale name.
     * @param {PWSTR} localeName Type: <b>WCHAR*</b>
     * 
     * Contains a character array that receives the current locale name.
     * @param {Integer} nameSize Type: <b>UINT32</b>
     * 
     * The size of the character array, in character count, including the terminated <b>NULL</b> character. Use <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getlocalenamelength">GetLocaleNameLength</a> to get the size of the locale name character array.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextformat-getlocalename
     */
    GetLocaleName(localeName, nameSize) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(27, this, "ptr", localeName, "uint", nameSize, "HRESULT")
        return result
    }
}
