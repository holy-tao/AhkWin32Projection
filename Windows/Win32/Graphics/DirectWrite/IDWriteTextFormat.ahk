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
     * 
     * @param {Integer} textAlignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-settextalignment
     */
    SetTextAlignment(textAlignment) {
        result := ComCall(3, this, "int", textAlignment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} paragraphAlignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-setparagraphalignment
     */
    SetParagraphAlignment(paragraphAlignment) {
        result := ComCall(4, this, "int", paragraphAlignment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wordWrapping 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-setwordwrapping
     */
    SetWordWrapping(wordWrapping) {
        result := ComCall(5, this, "int", wordWrapping, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} readingDirection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-setreadingdirection
     */
    SetReadingDirection(readingDirection) {
        result := ComCall(6, this, "int", readingDirection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flowDirection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-setflowdirection
     */
    SetFlowDirection(flowDirection) {
        result := ComCall(7, this, "int", flowDirection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} incrementalTabStop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-setincrementaltabstop
     */
    SetIncrementalTabStop(incrementalTabStop) {
        result := ComCall(8, this, "float", incrementalTabStop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_TRIMMING>} trimmingOptions 
     * @param {IDWriteInlineObject} trimmingSign 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-settrimming
     */
    SetTrimming(trimmingOptions, trimmingSign) {
        result := ComCall(9, this, "ptr", trimmingOptions, "ptr", trimmingSign, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lineSpacingMethod 
     * @param {Float} lineSpacing 
     * @param {Float} baseline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-setlinespacing
     */
    SetLineSpacing(lineSpacingMethod, lineSpacing, baseline) {
        result := ComCall(10, this, "int", lineSpacingMethod, "float", lineSpacing, "float", baseline, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-gettextalignment
     */
    GetTextAlignment() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getparagraphalignment
     */
    GetParagraphAlignment() {
        result := ComCall(12, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getwordwrapping
     */
    GetWordWrapping() {
        result := ComCall(13, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getreadingdirection
     */
    GetReadingDirection() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getflowdirection
     */
    GetFlowDirection() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getincrementaltabstop
     */
    GetIncrementalTabStop() {
        result := ComCall(16, this, "float")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_TRIMMING>} trimmingOptions 
     * @param {Pointer<IDWriteInlineObject>} trimmingSign 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-gettrimming
     */
    GetTrimming(trimmingOptions, trimmingSign) {
        result := ComCall(17, this, "ptr", trimmingOptions, "ptr*", trimmingSign, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lineSpacingMethod 
     * @param {Pointer<Float>} lineSpacing 
     * @param {Pointer<Float>} baseline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getlinespacing
     */
    GetLineSpacing(lineSpacingMethod, lineSpacing, baseline) {
        lineSpacingMethodMarshal := lineSpacingMethod is VarRef ? "int*" : "ptr"
        lineSpacingMarshal := lineSpacing is VarRef ? "float*" : "ptr"
        baselineMarshal := baseline is VarRef ? "float*" : "ptr"

        result := ComCall(18, this, lineSpacingMethodMarshal, lineSpacingMethod, lineSpacingMarshal, lineSpacing, baselineMarshal, baseline, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDWriteFontCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getfontcollection
     */
    GetFontCollection() {
        result := ComCall(19, this, "ptr*", &fontCollection := 0, "HRESULT")
        return IDWriteFontCollection(fontCollection)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getfontfamilynamelength
     */
    GetFontFamilyNameLength() {
        result := ComCall(20, this, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} fontFamilyName 
     * @param {Integer} nameSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getfontfamilyname
     */
    GetFontFamilyName(fontFamilyName, nameSize) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName

        result := ComCall(21, this, "ptr", fontFamilyName, "uint", nameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getfontweight
     */
    GetFontWeight() {
        result := ComCall(22, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getfontstyle
     */
    GetFontStyle() {
        result := ComCall(23, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getfontstretch
     */
    GetFontStretch() {
        result := ComCall(24, this, "int")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getfontsize
     */
    GetFontSize() {
        result := ComCall(25, this, "float")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getlocalenamelength
     */
    GetLocaleNameLength() {
        result := ComCall(26, this, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} localeName 
     * @param {Integer} nameSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getlocalename
     */
    GetLocaleName(localeName, nameSize) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(27, this, "ptr", localeName, "uint", nameSize, "HRESULT")
        return result
    }
}
