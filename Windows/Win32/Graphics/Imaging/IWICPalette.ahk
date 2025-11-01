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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializePredefined", "InitializeCustom", "InitializeFromBitmap", "InitializeFromPalette", "GetType", "GetColorCount", "GetColors", "IsBlackWhite", "IsGrayscale", "HasAlpha"]

    /**
     * 
     * @param {Integer} ePaletteType 
     * @param {BOOL} fAddTransparentColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpalette-initializepredefined
     */
    InitializePredefined(ePaletteType, fAddTransparentColor) {
        result := ComCall(3, this, "int", ePaletteType, "int", fAddTransparentColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pColors 
     * @param {Integer} cCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpalette-initializecustom
     */
    InitializeCustom(pColors, cCount) {
        result := ComCall(4, this, "uint*", pColors, "uint", cCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICBitmapSource} pISurface 
     * @param {Integer} cCount 
     * @param {BOOL} fAddTransparentColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpalette-initializefrombitmap
     */
    InitializeFromBitmap(pISurface, cCount, fAddTransparentColor) {
        result := ComCall(5, this, "ptr", pISurface, "uint", cCount, "int", fAddTransparentColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICPalette} pIPalette 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpalette-initializefrompalette
     */
    InitializeFromPalette(pIPalette) {
        result := ComCall(6, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pePaletteType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpalette-gettype
     */
    GetType(pePaletteType) {
        result := ComCall(7, this, "int*", pePaletteType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpalette-getcolorcount
     */
    GetColorCount(pcCount) {
        result := ComCall(8, this, "uint*", pcCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCount 
     * @param {Pointer<Integer>} pColors 
     * @param {Pointer<Integer>} pcActualColors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpalette-getcolors
     */
    GetColors(cCount, pColors, pcActualColors) {
        result := ComCall(9, this, "uint", cCount, "uint*", pColors, "uint*", pcActualColors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsBlackWhite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpalette-isblackwhite
     */
    IsBlackWhite(pfIsBlackWhite) {
        result := ComCall(10, this, "ptr", pfIsBlackWhite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsGrayscale 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpalette-isgrayscale
     */
    IsGrayscale(pfIsGrayscale) {
        result := ComCall(11, this, "ptr", pfIsGrayscale, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfHasAlpha 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpalette-hasalpha
     */
    HasAlpha(pfHasAlpha) {
        result := ComCall(12, this, "ptr", pfHasAlpha, "HRESULT")
        return result
    }
}
