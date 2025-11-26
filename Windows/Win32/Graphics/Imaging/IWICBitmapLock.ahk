#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that support the Lock method.
 * @remarks
 * 
 * The bitmap lock is simply an abstraction for a rectangular memory window into the bitmap. For the simplest case, a system memory bitmap, this is simply a pointer to the top left corner of the rectangle and a stride value.
 * 
 * To release the exclusive lock set by <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmap-lock">Lock</a> method and the associated <b>IWICBitmapLock</b> object, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the <b>IWICBitmapLock</b> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmaplock
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapLock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapLock
     * @type {Guid}
     */
    static IID => Guid("{00000123-a8f2-4877-ba0a-fd2b6645fb94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSize", "GetStride", "GetDataPointer", "GetPixelFormat"]

    /**
     * Retrieves the width and height, in pixels, of the locked rectangle.
     * @param {Pointer<Integer>} puiWidth Type: <b>UINT*</b>
     * 
     * A pointer that receives the width of the locked rectangle.
     * @param {Pointer<Integer>} puiHeight Type: <b>UINT*</b>
     * 
     * A pointer that receives the height of the locked rectangle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmaplock-getsize
     */
    GetSize(puiWidth, puiHeight) {
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"
        puiHeightMarshal := puiHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, puiWidthMarshal, puiWidth, puiHeightMarshal, puiHeight, "HRESULT")
        return result
    }

    /**
     * Provides access to the stride value for the memory.
     * @returns {Integer} Type: <b>UINT*</b>
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmaplock-getstride
     */
    GetStride() {
        result := ComCall(4, this, "uint*", &pcbStride := 0, "HRESULT")
        return pcbStride
    }

    /**
     * Gets the pointer to the top left pixel in the locked rectangle.
     * @param {Pointer<Integer>} pcbBufferSize Type: <b>UINT*</b>
     * 
     * A pointer that receives the size of the buffer.
     * @param {Pointer<Pointer<Integer>>} ppbData Type: <b>BYTE**</b>
     * 
     * A pointer that receives a pointer to the top left pixel in the locked rectangle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmaplock-getdatapointer
     */
    GetDataPointer(pcbBufferSize, ppbData) {
        pcbBufferSizeMarshal := pcbBufferSize is VarRef ? "uint*" : "ptr"
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pcbBufferSizeMarshal, pcbBufferSize, ppbDataMarshal, ppbData, "HRESULT")
        return result
    }

    /**
     * Gets the pixel format of for the locked area of pixels. This can be used to compute the number of bytes-per-pixel in the locked area.
     * @returns {Guid} Type: <b>WICPixelFormatGUID*</b>
     * 
     * A pointer that receives the pixel format GUID of the locked area.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmaplock-getpixelformat
     */
    GetPixelFormat() {
        pPixelFormat := Guid()
        result := ComCall(6, this, "ptr", pPixelFormat, "HRESULT")
        return pPixelFormat
    }
}
