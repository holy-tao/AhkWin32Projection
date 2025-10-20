#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Float} maxWidth 
     * @returns {HRESULT} 
     */
    SetMaxWidth(maxWidth) {
        result := ComCall(28, this, "float", maxWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} maxHeight 
     * @returns {HRESULT} 
     */
    SetMaxHeight(maxHeight) {
        result := ComCall(29, this, "float", maxHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontCollection>} fontCollection 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetFontCollection(fontCollection, textRange) {
        result := ComCall(30, this, "ptr", fontCollection, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} fontFamilyName 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetFontFamilyName(fontFamilyName, textRange) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName

        result := ComCall(31, this, "ptr", fontFamilyName, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fontWeight 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetFontWeight(fontWeight, textRange) {
        result := ComCall(32, this, "int", fontWeight, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fontStyle 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetFontStyle(fontStyle, textRange) {
        result := ComCall(33, this, "int", fontStyle, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fontStretch 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetFontStretch(fontStretch, textRange) {
        result := ComCall(34, this, "int", fontStretch, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} fontSize 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetFontSize(fontSize, textRange) {
        result := ComCall(35, this, "float", fontSize, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} hasUnderline 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetUnderline(hasUnderline, textRange) {
        result := ComCall(36, this, "int", hasUnderline, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} hasStrikethrough 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetStrikethrough(hasStrikethrough, textRange) {
        result := ComCall(37, this, "int", hasStrikethrough, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} drawingEffect 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetDrawingEffect(drawingEffect, textRange) {
        result := ComCall(38, this, "ptr", drawingEffect, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteInlineObject>} inlineObject 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetInlineObject(inlineObject, textRange) {
        result := ComCall(39, this, "ptr", inlineObject, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteTypography>} typography 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetTypography(typography, textRange) {
        result := ComCall(40, this, "ptr", typography, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} localeName 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetLocaleName(localeName, textRange) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(41, this, "ptr", localeName, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetMaxWidth() {
        result := ComCall(42, this, "float")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetMaxHeight() {
        result := ComCall(43, this, "float")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<IDWriteFontCollection>} fontCollection 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetFontCollection(currentPosition, fontCollection, textRange) {
        result := ComCall(44, this, "uint", currentPosition, "ptr", fontCollection, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<UInt32>} nameLength 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetFontFamilyNameLength(currentPosition, nameLength, textRange) {
        result := ComCall(45, this, "uint", currentPosition, "uint*", nameLength, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {PWSTR} fontFamilyName 
     * @param {Integer} nameSize 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetFontFamilyName(currentPosition, fontFamilyName, nameSize, textRange) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName

        result := ComCall(46, this, "uint", currentPosition, "ptr", fontFamilyName, "uint", nameSize, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<Int32>} fontWeight 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetFontWeight(currentPosition, fontWeight, textRange) {
        result := ComCall(47, this, "uint", currentPosition, "int*", fontWeight, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<Int32>} fontStyle 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetFontStyle(currentPosition, fontStyle, textRange) {
        result := ComCall(48, this, "uint", currentPosition, "int*", fontStyle, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<Int32>} fontStretch 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetFontStretch(currentPosition, fontStretch, textRange) {
        result := ComCall(49, this, "uint", currentPosition, "int*", fontStretch, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<Single>} fontSize 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetFontSize(currentPosition, fontSize, textRange) {
        result := ComCall(50, this, "uint", currentPosition, "float*", fontSize, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<BOOL>} hasUnderline 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetUnderline(currentPosition, hasUnderline, textRange) {
        result := ComCall(51, this, "uint", currentPosition, "ptr", hasUnderline, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<BOOL>} hasStrikethrough 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetStrikethrough(currentPosition, hasStrikethrough, textRange) {
        result := ComCall(52, this, "uint", currentPosition, "ptr", hasStrikethrough, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<IUnknown>} drawingEffect 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetDrawingEffect(currentPosition, drawingEffect, textRange) {
        result := ComCall(53, this, "uint", currentPosition, "ptr", drawingEffect, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<IDWriteInlineObject>} inlineObject 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetInlineObject(currentPosition, inlineObject, textRange) {
        result := ComCall(54, this, "uint", currentPosition, "ptr", inlineObject, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<IDWriteTypography>} typography 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetTypography(currentPosition, typography, textRange) {
        result := ComCall(55, this, "uint", currentPosition, "ptr", typography, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<UInt32>} nameLength 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetLocaleNameLength(currentPosition, nameLength, textRange) {
        result := ComCall(56, this, "uint", currentPosition, "uint*", nameLength, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {PWSTR} localeName 
     * @param {Integer} nameSize 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetLocaleName(currentPosition, localeName, nameSize, textRange) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(57, this, "uint", currentPosition, "ptr", localeName, "uint", nameSize, "ptr", textRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Pointer<IDWriteTextRenderer>} renderer 
     * @param {Float} originX 
     * @param {Float} originY 
     * @returns {HRESULT} 
     */
    Draw(clientDrawingContext, renderer, originX, originY) {
        result := ComCall(58, this, "ptr", clientDrawingContext, "ptr", renderer, "float", originX, "float", originY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_LINE_METRICS>} lineMetrics 
     * @param {Integer} maxLineCount 
     * @param {Pointer<UInt32>} actualLineCount 
     * @returns {HRESULT} 
     */
    GetLineMetrics(lineMetrics, maxLineCount, actualLineCount) {
        result := ComCall(59, this, "ptr", lineMetrics, "uint", maxLineCount, "uint*", actualLineCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_TEXT_METRICS>} textMetrics 
     * @returns {HRESULT} 
     */
    GetMetrics(textMetrics) {
        result := ComCall(60, this, "ptr", textMetrics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_OVERHANG_METRICS>} overhangs 
     * @returns {HRESULT} 
     */
    GetOverhangMetrics(overhangs) {
        result := ComCall(61, this, "ptr", overhangs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_CLUSTER_METRICS>} clusterMetrics 
     * @param {Integer} maxClusterCount 
     * @param {Pointer<UInt32>} actualClusterCount 
     * @returns {HRESULT} 
     */
    GetClusterMetrics(clusterMetrics, maxClusterCount, actualClusterCount) {
        result := ComCall(62, this, "ptr", clusterMetrics, "uint", maxClusterCount, "uint*", actualClusterCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} minWidth 
     * @returns {HRESULT} 
     */
    DetermineMinWidth(minWidth) {
        result := ComCall(63, this, "float*", minWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} pointX 
     * @param {Float} pointY 
     * @param {Pointer<BOOL>} isTrailingHit 
     * @param {Pointer<BOOL>} isInside 
     * @param {Pointer<DWRITE_HIT_TEST_METRICS>} hitTestMetrics 
     * @returns {HRESULT} 
     */
    HitTestPoint(pointX, pointY, isTrailingHit, isInside, hitTestMetrics) {
        result := ComCall(64, this, "float", pointX, "float", pointY, "ptr", isTrailingHit, "ptr", isInside, "ptr", hitTestMetrics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} textPosition 
     * @param {BOOL} isTrailingHit 
     * @param {Pointer<Single>} pointX 
     * @param {Pointer<Single>} pointY 
     * @param {Pointer<DWRITE_HIT_TEST_METRICS>} hitTestMetrics 
     * @returns {HRESULT} 
     */
    HitTestTextPosition(textPosition, isTrailingHit, pointX, pointY, hitTestMetrics) {
        result := ComCall(65, this, "uint", textPosition, "int", isTrailingHit, "float*", pointX, "float*", pointY, "ptr", hitTestMetrics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {Float} originX 
     * @param {Float} originY 
     * @param {Pointer<DWRITE_HIT_TEST_METRICS>} hitTestMetrics 
     * @param {Integer} maxHitTestMetricsCount 
     * @param {Pointer<UInt32>} actualHitTestMetricsCount 
     * @returns {HRESULT} 
     */
    HitTestTextRange(textPosition, textLength, originX, originY, hitTestMetrics, maxHitTestMetricsCount, actualHitTestMetricsCount) {
        result := ComCall(66, this, "uint", textPosition, "uint", textLength, "float", originX, "float", originY, "ptr", hitTestMetrics, "uint", maxHitTestMetricsCount, "uint*", actualHitTestMetricsCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
