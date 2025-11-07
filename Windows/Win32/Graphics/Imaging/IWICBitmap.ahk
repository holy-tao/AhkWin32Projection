#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapLock.ahk
#Include .\IWICBitmapSource.ahk

/**
 * Defines methods that add the concept of writeability and static in-memory representations of bitmaps to IWICBitmapSource.
 * @remarks
 * 
 * <b>IWICBitmap</b> inherits from <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> and therefore also inherits the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">CopyPixels</a> method.
 *             When pixels need to be moved to a new memory location, <b>CopyPixels</b> is often the most efficient.
 *          
 * 
 * Because of the internal memory representation implied by the <b>IWICBitmap</b>, in-place modification and processing using the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmap-lock">Lock</a> is more efficient than <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">CopyPixels</a>, usually reducing to a simple pointer access directly into the memory owned by the bitmap rather than a copy. 
 *             This is contrasted to procedural bitmaps which implement only <b>CopyPixels</b> because there is no internal memory representation and one would need to be created on demand to satisfy a call to <b>Lock</b>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmap
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmap extends IWICBitmapSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmap
     * @type {Guid}
     */
    static IID => Guid("{00000121-a8f2-4877-ba0a-fd2b6645fb94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Lock", "SetPalette", "SetResolution"]

    /**
     * 
     * @param {Pointer<WICRect>} prcLock 
     * @param {Integer} flags 
     * @returns {IWICBitmapLock} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmap-lock
     */
    Lock(prcLock, flags) {
        result := ComCall(8, this, "ptr", prcLock, "uint", flags, "ptr*", &ppILock := 0, "HRESULT")
        return IWICBitmapLock(ppILock)
    }

    /**
     * 
     * @param {IWICPalette} pIPalette 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmap-setpalette
     */
    SetPalette(pIPalette) {
        result := ComCall(9, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dpiX 
     * @param {Float} dpiY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmap-setresolution
     */
    SetResolution(dpiX, dpiY) {
        result := ComCall(10, this, "double", dpiX, "double", dpiY, "HRESULT")
        return result
    }
}
