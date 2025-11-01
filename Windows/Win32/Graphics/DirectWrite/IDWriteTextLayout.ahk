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
     * 
     * @param {Float} maxWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setmaxwidth
     */
    SetMaxWidth(maxWidth) {
        result := ComCall(28, this, "float", maxWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} maxHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setmaxheight
     */
    SetMaxHeight(maxHeight) {
        result := ComCall(29, this, "float", maxHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontCollection} fontCollection 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setfontcollection
     */
    SetFontCollection(fontCollection, textRange) {
        result := ComCall(30, this, "ptr", fontCollection, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} fontFamilyName 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setfontfamilyname
     */
    SetFontFamilyName(fontFamilyName, textRange) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName

        result := ComCall(31, this, "ptr", fontFamilyName, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fontWeight 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setfontweight
     */
    SetFontWeight(fontWeight, textRange) {
        result := ComCall(32, this, "int", fontWeight, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fontStyle 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setfontstyle
     */
    SetFontStyle(fontStyle, textRange) {
        result := ComCall(33, this, "int", fontStyle, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fontStretch 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setfontstretch
     */
    SetFontStretch(fontStretch, textRange) {
        result := ComCall(34, this, "int", fontStretch, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} fontSize 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setfontsize
     */
    SetFontSize(fontSize, textRange) {
        result := ComCall(35, this, "float", fontSize, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} hasUnderline 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setunderline
     */
    SetUnderline(hasUnderline, textRange) {
        result := ComCall(36, this, "int", hasUnderline, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} hasStrikethrough 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setstrikethrough
     */
    SetStrikethrough(hasStrikethrough, textRange) {
        result := ComCall(37, this, "int", hasStrikethrough, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} drawingEffect 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setdrawingeffect
     */
    SetDrawingEffect(drawingEffect, textRange) {
        result := ComCall(38, this, "ptr", drawingEffect, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteInlineObject} inlineObject 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setinlineobject
     */
    SetInlineObject(inlineObject, textRange) {
        result := ComCall(39, this, "ptr", inlineObject, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteTypography} typography 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-settypography
     */
    SetTypography(typography, textRange) {
        result := ComCall(40, this, "ptr", typography, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} localeName 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setlocalename
     */
    SetLocaleName(localeName, textRange) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(41, this, "ptr", localeName, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getmaxwidth
     */
    GetMaxWidth() {
        result := ComCall(42, this, "float")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getmaxheight
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getfontcollection
     */
    GetFontCollection(currentPosition, fontCollection, textRange) {
        result := ComCall(44, this, "uint", currentPosition, "ptr*", fontCollection, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<Integer>} nameLength 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getfontfamilynamelength
     */
    GetFontFamilyNameLength(currentPosition, nameLength, textRange) {
        result := ComCall(45, this, "uint", currentPosition, "uint*", nameLength, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {PWSTR} fontFamilyName 
     * @param {Integer} nameSize 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getfontfamilyname
     */
    GetFontFamilyName(currentPosition, fontFamilyName, nameSize, textRange) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName

        result := ComCall(46, this, "uint", currentPosition, "ptr", fontFamilyName, "uint", nameSize, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<Integer>} fontWeight 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getfontweight
     */
    GetFontWeight(currentPosition, fontWeight, textRange) {
        result := ComCall(47, this, "uint", currentPosition, "int*", fontWeight, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<Integer>} fontStyle 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getfontstyle
     */
    GetFontStyle(currentPosition, fontStyle, textRange) {
        result := ComCall(48, this, "uint", currentPosition, "int*", fontStyle, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<Integer>} fontStretch 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getfontstretch
     */
    GetFontStretch(currentPosition, fontStretch, textRange) {
        result := ComCall(49, this, "uint", currentPosition, "int*", fontStretch, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<Float>} fontSize 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getfontsize
     */
    GetFontSize(currentPosition, fontSize, textRange) {
        result := ComCall(50, this, "uint", currentPosition, "float*", fontSize, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<BOOL>} hasUnderline 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getunderline
     */
    GetUnderline(currentPosition, hasUnderline, textRange) {
        result := ComCall(51, this, "uint", currentPosition, "ptr", hasUnderline, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<BOOL>} hasStrikethrough 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getstrikethrough
     */
    GetStrikethrough(currentPosition, hasStrikethrough, textRange) {
        result := ComCall(52, this, "uint", currentPosition, "ptr", hasStrikethrough, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<IUnknown>} drawingEffect 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getdrawingeffect
     */
    GetDrawingEffect(currentPosition, drawingEffect, textRange) {
        result := ComCall(53, this, "uint", currentPosition, "ptr*", drawingEffect, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<IDWriteInlineObject>} inlineObject 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getinlineobject
     */
    GetInlineObject(currentPosition, inlineObject, textRange) {
        result := ComCall(54, this, "uint", currentPosition, "ptr*", inlineObject, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<IDWriteTypography>} typography 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-gettypography
     */
    GetTypography(currentPosition, typography, textRange) {
        result := ComCall(55, this, "uint", currentPosition, "ptr*", typography, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<Integer>} nameLength 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getlocalenamelength
     */
    GetLocaleNameLength(currentPosition, nameLength, textRange) {
        result := ComCall(56, this, "uint", currentPosition, "uint*", nameLength, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {PWSTR} localeName 
     * @param {Integer} nameSize 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getlocalename
     */
    GetLocaleName(currentPosition, localeName, nameSize, textRange) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(57, this, "uint", currentPosition, "ptr", localeName, "uint", nameSize, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {IDWriteTextRenderer} renderer 
     * @param {Float} originX 
     * @param {Float} originY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-draw
     */
    Draw(clientDrawingContext, renderer, originX, originY) {
        result := ComCall(58, this, "ptr", clientDrawingContext, "ptr", renderer, "float", originX, "float", originY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_LINE_METRICS>} lineMetrics 
     * @param {Integer} maxLineCount 
     * @param {Pointer<Integer>} actualLineCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getlinemetrics
     */
    GetLineMetrics(lineMetrics, maxLineCount, actualLineCount) {
        result := ComCall(59, this, "ptr", lineMetrics, "uint", maxLineCount, "uint*", actualLineCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_TEXT_METRICS>} textMetrics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getmetrics
     */
    GetMetrics(textMetrics) {
        result := ComCall(60, this, "ptr", textMetrics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_OVERHANG_METRICS>} overhangs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout-getoverhangmetrics
     */
    GetOverhangMetrics(overhangs) {
        result := ComCall(61, this, "ptr", overhangs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_CLUSTER_METRICS>} clusterMetrics 
     * @param {Integer} maxClusterCount 
     * @param {Pointer<Integer>} actualClusterCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-getclustermetrics
     */
    GetClusterMetrics(clusterMetrics, maxClusterCount, actualClusterCount) {
        result := ComCall(62, this, "ptr", clusterMetrics, "uint", maxClusterCount, "uint*", actualClusterCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} minWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout-determineminwidth
     */
    DetermineMinWidth(minWidth) {
        result := ComCall(63, this, "float*", minWidth, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-hittestpoint
     */
    HitTestPoint(pointX, pointY, isTrailingHit, isInside, hitTestMetrics) {
        result := ComCall(64, this, "float", pointX, "float", pointY, "ptr", isTrailingHit, "ptr", isInside, "ptr", hitTestMetrics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} textPosition 
     * @param {BOOL} isTrailingHit 
     * @param {Pointer<Float>} pointX 
     * @param {Pointer<Float>} pointY 
     * @param {Pointer<DWRITE_HIT_TEST_METRICS>} hitTestMetrics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-hittesttextposition
     */
    HitTestTextPosition(textPosition, isTrailingHit, pointX, pointY, hitTestMetrics) {
        result := ComCall(65, this, "uint", textPosition, "int", isTrailingHit, "float*", pointX, "float*", pointY, "ptr", hitTestMetrics, "HRESULT")
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
     * @param {Pointer<Integer>} actualHitTestMetricsCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-hittesttextrange
     */
    HitTestTextRange(textPosition, textLength, originX, originY, hitTestMetrics, maxHitTestMetricsCount, actualHitTestMetricsCount) {
        result := ComCall(66, this, "uint", textPosition, "uint", textLength, "float", originX, "float", originY, "ptr", hitTestMetrics, "uint", maxHitTestMetricsCount, "uint*", actualHitTestMetricsCount, "HRESULT")
        return result
    }
}
