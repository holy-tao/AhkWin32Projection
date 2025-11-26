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
     * Initializes the palette to one of the pre-defined palettes specified by WICBitmapPaletteType and optionally adds a transparent color.
     * @param {Integer} ePaletteType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmappalettetype">WICBitmapPaletteType</a></b>
     * 
     * The desired pre-defined palette type.
     * @param {BOOL} fAddTransparentColor Type: <b>BOOL</b>
     * 
     * The optional transparent color to add to the palette. If no transparent color is needed, use 0. When initializing to a grayscale or black and white palette, set this parameter to <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpalette-initializepredefined
     */
    InitializePredefined(ePaletteType, fAddTransparentColor) {
        result := ComCall(3, this, "int", ePaletteType, "int", fAddTransparentColor, "HRESULT")
        return result
    }

    /**
     * Initializes a palette to the custom color entries provided.
     * @param {Pointer<Integer>} pColors Type: <b>WICColor*</b>
     * 
     * Pointer to the color array.
     * @param {Integer} cCount Type: <b>UINT</b>
     * 
     * The number of colors in <i>pColors</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpalette-initializecustom
     */
    InitializeCustom(pColors, cCount) {
        pColorsMarshal := pColors is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pColorsMarshal, pColors, "uint", cCount, "HRESULT")
        return result
    }

    /**
     * Initializes a palette using a computed optimized values based on the reference bitmap.
     * @param {IWICBitmapSource} pISurface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * Pointer to the source bitmap.
     * @param {Integer} cCount Type: <b>UINT</b>
     * 
     * The number of colors to initialize the palette with.
     * @param {BOOL} fAddTransparentColor Type: <b>BOOL</b>
     * 
     * A value to indicate whether to add a transparent color.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpalette-initializefrombitmap
     */
    InitializeFromBitmap(pISurface, cCount, fAddTransparentColor) {
        result := ComCall(5, this, "ptr", pISurface, "uint", cCount, "int", fAddTransparentColor, "HRESULT")
        return result
    }

    /**
     * Initialize the palette based on a given palette.
     * @param {IWICPalette} pIPalette Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>*</b>
     * 
     * Pointer to the source palette.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpalette-initializefrompalette
     */
    InitializeFromPalette(pIPalette) {
        result := ComCall(6, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * Retrieves the WICBitmapPaletteType that describes the palette.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmappalettetype">WICBitmapPaletteType</a>*</b>
     * 
     * Pointer that receives the palette type of the bimtap.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpalette-gettype
     */
    GetType() {
        result := ComCall(7, this, "int*", &pePaletteType := 0, "HRESULT")
        return pePaletteType
    }

    /**
     * Retrieves the number of colors in the color table.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Pointer that receives the number of colors in the color table.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpalette-getcolorcount
     */
    GetColorCount() {
        result := ComCall(8, this, "uint*", &pcCount := 0, "HRESULT")
        return pcCount
    }

    /**
     * Fills out the supplied color array with the colors from the internal color table. The color array should be sized according to the return results from GetColorCount.
     * @param {Integer} cCount Type: <b>UINT</b>
     * 
     * The size of the <i>pColors</i> array.
     * @param {Pointer<Integer>} pColors Type: <b>WICColor*</b>
     * 
     * Pointer that receives the colors of the palette.
     * @param {Pointer<Integer>} pcActualColors Type: <b>UINT*</b>
     * 
     * The actual size needed to obtain the palette colors.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpalette-getcolors
     */
    GetColors(cCount, pColors, pcActualColors) {
        pColorsMarshal := pColors is VarRef ? "uint*" : "ptr"
        pcActualColorsMarshal := pcActualColors is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", cCount, pColorsMarshal, pColors, pcActualColorsMarshal, pcActualColors, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that describes whether the palette is black and white.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a variable  that receives a boolean value that indicates whether the palette is black and white. <b>TRUE</b> indicates that the palette is black and white; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpalette-isblackwhite
     */
    IsBlackWhite() {
        result := ComCall(10, this, "int*", &pfIsBlackWhite := 0, "HRESULT")
        return pfIsBlackWhite
    }

    /**
     * Retrieves a value that describes whether a palette is grayscale.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a variable that receives a boolean value that indicates whether the palette is grayscale. <b>TRUE</b> indicates that the palette is grayscale; otherwise <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpalette-isgrayscale
     */
    IsGrayscale() {
        result := ComCall(11, this, "int*", &pfIsGrayscale := 0, "HRESULT")
        return pfIsGrayscale
    }

    /**
     * Indicates whether the palette contains an entry that is non-opaque (that is, an entry with an alpha that is less than 1).
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Pointer that receives <c>TRUE</code> if the palette contains a transparent color; otherwise, <code>FALSE</c>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpalette-hasalpha
     */
    HasAlpha() {
        result := ComCall(12, this, "int*", &pfHasAlpha := 0, "HRESULT")
        return pfHasAlpha
    }
}
