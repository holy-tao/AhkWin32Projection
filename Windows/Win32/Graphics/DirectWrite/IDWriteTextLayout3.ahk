#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_LINE_SPACING.ahk
#Include .\IDWriteTextLayout2.ahk

/**
 * Represents a block of text after it has been fully analyzed and formatted.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritetextlayout3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextLayout3 extends IDWriteTextLayout2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextLayout3
     * @type {Guid}
     */
    static IID => Guid("{07ddcd52-020e-4de8-ac33-6c953d83f92d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 80

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InvalidateLayout", "SetLineSpacing", "GetLineSpacing", "GetLineMetrics"]

    /**
     * Invalidates the layout, forcing layout to remeasure before calling the metrics or drawing functions. This is useful if the locality of a font changes, and layout should be redrawn, or if the size of a client implemented IDWriteInlineObject changes.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritetextlayout3-invalidatelayout
     */
    InvalidateLayout() {
        result := ComCall(80, this, "HRESULT")
        return result
    }

    /**
     * Set line spacing.
     * @param {Pointer<DWRITE_LINE_SPACING>} lineSpacingOptions How to manage space between lines.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritetextlayout3-setlinespacing
     */
    SetLineSpacing(lineSpacingOptions) {
        result := ComCall(81, this, "ptr", lineSpacingOptions, "HRESULT")
        return result
    }

    /**
     * Gets line spacing information.
     * @returns {DWRITE_LINE_SPACING} How to manage space between lines.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritetextlayout3-getlinespacing
     */
    GetLineSpacing() {
        lineSpacingOptions := DWRITE_LINE_SPACING()
        result := ComCall(82, this, "ptr", lineSpacingOptions, "HRESULT")
        return lineSpacingOptions
    }

    /**
     * Retrieves properties of each line.
     * @param {Pointer<DWRITE_LINE_METRICS1>} lineMetrics The array to fill with line information.
     * @param {Integer} maxLineCount The maximum size of the lineMetrics array.
     * @param {Pointer<Integer>} actualLineCount The actual size of the lineMetrics    
     *      array that is needed.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritetextlayout3-getlinemetrics
     */
    GetLineMetrics(lineMetrics, maxLineCount, actualLineCount) {
        actualLineCountMarshal := actualLineCount is VarRef ? "uint*" : "ptr"

        result := ComCall(83, this, "ptr", lineMetrics, "uint", maxLineCount, actualLineCountMarshal, actualLineCount, "HRESULT")
        return result
    }
}
