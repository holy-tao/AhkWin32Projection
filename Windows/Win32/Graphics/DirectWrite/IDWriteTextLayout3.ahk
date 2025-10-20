#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteTextLayout2.ahk

/**
 * Represents a block of text after it has been fully analyzed and formatted.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritetextlayout3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextLayout3 extends IDWriteTextLayout2{
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
     * 
     * @returns {HRESULT} 
     */
    InvalidateLayout() {
        result := ComCall(80, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_LINE_SPACING>} lineSpacingOptions 
     * @returns {HRESULT} 
     */
    SetLineSpacing(lineSpacingOptions) {
        result := ComCall(81, this, "ptr", lineSpacingOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_LINE_SPACING>} lineSpacingOptions 
     * @returns {HRESULT} 
     */
    GetLineSpacing(lineSpacingOptions) {
        result := ComCall(82, this, "ptr", lineSpacingOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_LINE_METRICS1>} lineMetrics 
     * @param {Integer} maxLineCount 
     * @param {Pointer<UInt32>} actualLineCount 
     * @returns {HRESULT} 
     */
    GetLineMetrics(lineMetrics, maxLineCount, actualLineCount) {
        result := ComCall(83, this, "ptr", lineMetrics, "uint", maxLineCount, "uint*", actualLineCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
