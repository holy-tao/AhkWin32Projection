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
     * 
     * @param {Pointer<UInt32>} puiWidth 
     * @param {Pointer<UInt32>} puiHeight 
     * @returns {HRESULT} 
     */
    GetSize(puiWidth, puiHeight) {
        result := ComCall(3, this, "uint*", puiWidth, "uint*", puiHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @param {Pointer<Guid>} pPixelFormat 
     * @returns {HRESULT} If the function succeeds, the return value is the currently selected pixel format index of the specified device context. This is a positive, one-based index value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat(pPixelFormat) {
        result := ComCall(4, this, "ptr", pPixelFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pDpiX 
     * @param {Pointer<Double>} pDpiY 
     * @returns {HRESULT} 
     */
    GetResolution(pDpiX, pDpiY) {
        result := ComCall(5, this, "double*", pDpiX, "double*", pDpiY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICPalette>} pIPalette 
     * @returns {HRESULT} 
     */
    CopyPalette(pIPalette) {
        result := ComCall(6, this, "ptr", pIPalette, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WICRect>} prc 
     * @param {Integer} cbStride 
     * @param {Integer} cbBufferSize 
     * @param {Pointer<Byte>} pbBuffer 
     * @returns {HRESULT} 
     */
    CopyPixels(prc, cbStride, cbBufferSize, pbBuffer) {
        result := ComCall(7, this, "ptr", prc, "uint", cbStride, "uint", cbBufferSize, "char*", pbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
