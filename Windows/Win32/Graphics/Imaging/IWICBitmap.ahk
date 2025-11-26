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
     * Provides access to a rectangular area of the bitmap.
     * @param {Pointer<WICRect>} prcLock Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrect">WICRect</a>*</b>
     * 
     * The rectangle to be accessed.
     * @param {Integer} flags Type: <b>DWORD</b>
     * 
     * The access mode you wish to obtain for the lock. This is a bitwise combination of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmaplockflags">WICBitmapLockFlags</a> for read, write, or read and write access.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WICBitmapLockRead"></a><a id="wicbitmaplockread"></a><a id="WICBITMAPLOCKREAD"></a><dl>
     * <dt><b>WICBitmapLockRead</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read access lock.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WICBitmapLockWrite"></a><a id="wicbitmaplockwrite"></a><a id="WICBITMAPLOCKWRITE"></a><dl>
     * <dt><b>WICBitmapLockWrite</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The write access lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IWICBitmapLock} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmaplock">IWICBitmapLock</a>**</b>
     * 
     * A pointer that receives the locked memory location.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmap-lock
     */
    Lock(prcLock, flags) {
        result := ComCall(8, this, "ptr", prcLock, "uint", flags, "ptr*", &ppILock := 0, "HRESULT")
        return IWICBitmapLock(ppILock)
    }

    /**
     * Provides access for palette modifications.
     * @param {IWICPalette} pIPalette Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>*</b>
     * 
     * The palette to use for conversion.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmap-setpalette
     */
    SetPalette(pIPalette) {
        result := ComCall(9, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * Changes the physical resolution of the image.
     * @param {Float} dpiX Type: <b>double</b>
     * 
     * The horizontal resolution.
     * @param {Float} dpiY Type: <b>double</b>
     * 
     * The vertical resolution.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmap-setresolution
     */
    SetResolution(dpiX, dpiY) {
        result := ComCall(10, this, "double", dpiX, "double", dpiY, "HRESULT")
        return result
    }
}
