#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for accessing and building a color table, primarily for indexed pixel formats.
 * @remarks
 * 
  * If the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmappalettetype">WICBitmapPaletteType</a> is not <b>WICBitmapPaletteCustom</b>, then the colors are automatically generated based on the table above.  If the user subsequently changes a color palette entry the WICBitmapPalette is set to Custom by that action.
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicpalette-initializefrombitmap">InitializeFromBitmap</a>'s <i>fAddTransparentColor</i> parameter will add a transparent color to the end of the color collection if its size if less than 256, otherwise index 255 will be replaced with the transparent color.  If a pre-defined palette type is used, it will change to BitmapPaletteTypeCustom since it no longer matches the predefined palette.
  * 
  * The palette interface is an auxiliary imaging interface in that it does not directly concern bitmaps and pixels; rather it provides indexed color translation for indexed bitmaps. For an indexed pixel format with M bits per pixels: (The number of colors in the palette) greater than 2^M.
  * 
  * Traditionally the basic operation of the palette is to provide a translation from a byte (or smaller) index into a 32bpp color value. This is often accomplished by a 256 entry table of color values.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicpalette
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICPalette extends IUnknown{
    /**
     * The interface identifier for IWICPalette
     * @type {Guid}
     */
    static IID => Guid("{00000040-a8f2-4877-ba0a-fd2b6645fb94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ePaletteType 
     * @param {BOOL} fAddTransparentColor 
     * @returns {HRESULT} 
     */
    InitializePredefined(ePaletteType, fAddTransparentColor) {
        result := ComCall(3, this, "int", ePaletteType, "int", fAddTransparentColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pColors 
     * @param {Integer} cCount 
     * @returns {HRESULT} 
     */
    InitializeCustom(pColors, cCount) {
        result := ComCall(4, this, "uint*", pColors, "uint", cCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICBitmapSource>} pISurface 
     * @param {Integer} cCount 
     * @param {BOOL} fAddTransparentColor 
     * @returns {HRESULT} 
     */
    InitializeFromBitmap(pISurface, cCount, fAddTransparentColor) {
        result := ComCall(5, this, "ptr", pISurface, "uint", cCount, "int", fAddTransparentColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICPalette>} pIPalette 
     * @returns {HRESULT} 
     */
    InitializeFromPalette(pIPalette) {
        result := ComCall(6, this, "ptr", pIPalette, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pePaletteType 
     * @returns {HRESULT} 
     */
    GetType(pePaletteType) {
        result := ComCall(7, this, "int*", pePaletteType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcCount 
     * @returns {HRESULT} 
     */
    GetColorCount(pcCount) {
        result := ComCall(8, this, "uint*", pcCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cCount 
     * @param {Pointer<UInt32>} pColors 
     * @param {Pointer<UInt32>} pcActualColors 
     * @returns {HRESULT} 
     */
    GetColors(cCount, pColors, pcActualColors) {
        result := ComCall(9, this, "uint", cCount, "uint*", pColors, "uint*", pcActualColors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsBlackWhite 
     * @returns {HRESULT} 
     */
    IsBlackWhite(pfIsBlackWhite) {
        result := ComCall(10, this, "ptr", pfIsBlackWhite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsGrayscale 
     * @returns {HRESULT} 
     */
    IsGrayscale(pfIsGrayscale) {
        result := ComCall(11, this, "ptr", pfIsGrayscale, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfHasAlpha 
     * @returns {HRESULT} 
     */
    HasAlpha(pfHasAlpha) {
        result := ComCall(12, this, "ptr", pfHasAlpha, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
