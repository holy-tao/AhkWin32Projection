#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWritePaintReader extends IUnknown{
    /**
     * The interface identifier for IDWritePaintReader
     * @type {Guid}
     */
    static IID => Guid("{8128e912-3b97-42a5-ab6c-24aad3a86e54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} glyphIndex 
     * @param {Pointer} paintElement 
     * @param {Integer} structSize 
     * @param {Pointer<D2D_RECT_F>} clipBox 
     * @param {Pointer<Int32>} glyphAttributes 
     * @returns {HRESULT} 
     */
    SetCurrentGlyph(glyphIndex, paintElement, structSize, clipBox, glyphAttributes) {
        result := ComCall(3, this, "uint", glyphIndex, "ptr", paintElement, "uint", structSize, "ptr", clipBox, "int*", glyphAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The SetTextColor function sets the text color for the specified device context to the specified color.
     * @param {Pointer<DWRITE_COLOR_F>} textColor 
     * @returns {HRESULT} If the function succeeds, the return value is a color reference for the previous text color as a <a href="/windows/desktop/gdi/colorref">COLORREF</a> value.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-settextcolor
     */
    SetTextColor(textColor) {
        result := ComCall(4, this, "ptr", textColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} colorPaletteIndex 
     * @returns {HRESULT} 
     */
    SetColorPaletteIndex(colorPaletteIndex) {
        result := ComCall(5, this, "uint", colorPaletteIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_COLOR_F>} paletteEntries 
     * @param {Integer} paletteEntryCount 
     * @returns {HRESULT} 
     */
    SetCustomColorPalette(paletteEntries, paletteEntryCount) {
        result := ComCall(6, this, "ptr", paletteEntries, "uint", paletteEntryCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} paintElement 
     * @param {Integer} structSize 
     * @returns {HRESULT} 
     */
    MoveToFirstChild(paintElement, structSize) {
        result := ComCall(7, this, "ptr", paintElement, "uint", structSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} paintElement 
     * @param {Integer} structSize 
     * @returns {HRESULT} 
     */
    MoveToNextSibling(paintElement, structSize) {
        result := ComCall(8, this, "ptr", paintElement, "uint", structSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveToParent() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} firstGradientStopIndex 
     * @param {Integer} gradientStopCount 
     * @param {Pointer<D2D1_GRADIENT_STOP>} gradientStops 
     * @returns {HRESULT} 
     */
    GetGradientStops(firstGradientStopIndex, gradientStopCount, gradientStops) {
        result := ComCall(10, this, "uint", firstGradientStopIndex, "uint", gradientStopCount, "ptr", gradientStops, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} firstGradientStopIndex 
     * @param {Integer} gradientStopCount 
     * @param {Pointer<DWRITE_PAINT_COLOR>} gradientStopColors 
     * @returns {HRESULT} 
     */
    GetGradientStopColors(firstGradientStopIndex, gradientStopCount, gradientStopColors) {
        result := ComCall(11, this, "uint", firstGradientStopIndex, "uint", gradientStopCount, "ptr", gradientStopColors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
