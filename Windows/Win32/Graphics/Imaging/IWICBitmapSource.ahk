#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that refers to a source from which pixels are retrieved, but cannot be written back to.
 * @remarks
 * 
 * This interface provides a common way of accessing and linking together bitmaps, decoders, format converters, and scalers. Components that implement this interface can be connected together in a graph to pull imaging data through.
 * 
 * This interface defines only the notion of readability or being able to produce pixels. Modifying or writing to a bitmap is considered to be a specialization specific to bitmaps which have storage and is defined in the descendant interface <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmapsource
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapSource
     * @type {Guid}
     */
    static IID => Guid("{00000120-a8f2-4877-ba0a-fd2b6645fb94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSize", "GetPixelFormat", "GetResolution", "CopyPalette", "CopyPixels"]

    /**
     * Retrieves the pixel width and height of the bitmap.
     * @param {Pointer<Integer>} puiWidth Type: <b>UINT*</b>
     * 
     * A pointer that receives the pixel width of the bitmap.
     * @param {Pointer<Integer>} puiHeight Type: <b>UINT*</b>
     * 
     * A pointer that receives the pixel height of the bitmap
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapsource-getsize
     */
    GetSize(puiWidth, puiHeight) {
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"
        puiHeightMarshal := puiHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, puiWidthMarshal, puiWidth, puiHeightMarshal, puiHeight, "HRESULT")
        return result
    }

    /**
     * Retrieves the pixel format of the bitmap source..
     * @returns {Guid} Type: <b>WICPixelFormatGUID*</b>
     * 
     * Receives the pixel format GUID the bitmap is stored in. For a list of available pixel formats, see the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-native-pixel-formats">Native Pixel Formats</a> topic.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapsource-getpixelformat
     */
    GetPixelFormat() {
        pPixelFormat := Guid()
        result := ComCall(4, this, "ptr", pPixelFormat, "HRESULT")
        return pPixelFormat
    }

    /**
     * Retrieves the sampling rate between pixels and physical world measurements.
     * @param {Pointer<Float>} pDpiX Type: <b>double*</b>
     * 
     * A pointer that receives the x-axis dpi resolution.
     * @param {Pointer<Float>} pDpiY Type: <b>double*</b>
     * 
     * A pointer that receives the y-axis dpi resolution.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapsource-getresolution
     */
    GetResolution(pDpiX, pDpiY) {
        pDpiXMarshal := pDpiX is VarRef ? "double*" : "ptr"
        pDpiYMarshal := pDpiY is VarRef ? "double*" : "ptr"

        result := ComCall(5, this, pDpiXMarshal, pDpiX, pDpiYMarshal, pDpiY, "HRESULT")
        return result
    }

    /**
     * Retrieves the color table for indexed pixel formats.
     * @param {IWICPalette} pIPalette Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>. A palette can be created using the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimagingfactory-createpalette">CreatePalette</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINCODEC_ERR_PALETTEUNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The palette was unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The palette was successfully copied.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapsource-copypalette
     */
    CopyPalette(pIPalette) {
        result := ComCall(6, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * Instructs the object to produce pixels.
     * @param {Pointer<WICRect>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrect">WICRect</a>*</b>
     * 
     * The rectangle to copy. A <b>NULL</b> value specifies the entire bitmap.
     * @param {Integer} cbStride Type: <b>UINT</b>
     * 
     * The stride of the bitmap
     * @param {Integer} cbBufferSize Type: <b>UINT</b>
     * 
     * The size of the buffer.
     * @returns {Integer} Type: <b>BYTE*</b>
     * 
     * A pointer to the buffer.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapsource-copypixels
     */
    CopyPixels(prc, cbStride, cbBufferSize) {
        result := ComCall(7, this, "ptr", prc, "uint", cbStride, "uint", cbBufferSize, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }
}
