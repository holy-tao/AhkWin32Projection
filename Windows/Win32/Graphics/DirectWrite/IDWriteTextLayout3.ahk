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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout3-invalidatelayout
     */
    InvalidateLayout() {
        result := ComCall(80, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_LINE_SPACING>} lineSpacingOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout3-setlinespacing
     */
    SetLineSpacing(lineSpacingOptions) {
        result := ComCall(81, this, "ptr", lineSpacingOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DWRITE_LINE_SPACING} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout3-getlinespacing
     */
    GetLineSpacing() {
        lineSpacingOptions := DWRITE_LINE_SPACING()
        result := ComCall(82, this, "ptr", lineSpacingOptions, "HRESULT")
        return lineSpacingOptions
    }

    /**
     * 
     * @param {Pointer<DWRITE_LINE_METRICS1>} lineMetrics 
     * @param {Integer} maxLineCount 
     * @param {Pointer<Integer>} actualLineCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout3-getlinemetrics
     */
    GetLineMetrics(lineMetrics, maxLineCount, actualLineCount) {
        actualLineCountMarshal := actualLineCount is VarRef ? "uint*" : "ptr"

        result := ComCall(83, this, "ptr", lineMetrics, "uint", maxLineCount, actualLineCountMarshal, actualLineCount, "HRESULT")
        return result
    }
}
