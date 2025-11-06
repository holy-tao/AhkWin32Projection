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
     * 
     * @param {Pointer<Integer>} puiWidth 
     * @param {Pointer<Integer>} puiHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsource-getsize
     */
    GetSize(puiWidth, puiHeight) {
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"
        puiHeightMarshal := puiHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, puiWidthMarshal, puiWidth, puiHeightMarshal, puiHeight, "HRESULT")
        return result
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @returns {Guid} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat() {
        pPixelFormat := Guid()
        result := ComCall(4, this, "ptr", pPixelFormat, "HRESULT")
        return pPixelFormat
    }

    /**
     * 
     * @param {Pointer<Float>} pDpiX 
     * @param {Pointer<Float>} pDpiY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsource-getresolution
     */
    GetResolution(pDpiX, pDpiY) {
        pDpiXMarshal := pDpiX is VarRef ? "double*" : "ptr"
        pDpiYMarshal := pDpiY is VarRef ? "double*" : "ptr"

        result := ComCall(5, this, pDpiXMarshal, pDpiX, pDpiYMarshal, pDpiY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICPalette} pIPalette 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsource-copypalette
     */
    CopyPalette(pIPalette) {
        result := ComCall(6, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WICRect>} prc 
     * @param {Integer} cbStride 
     * @param {Integer} cbBufferSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels
     */
    CopyPixels(prc, cbStride, cbBufferSize) {
        result := ComCall(7, this, "ptr", prc, "uint", cbStride, "uint", cbBufferSize, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }
}
