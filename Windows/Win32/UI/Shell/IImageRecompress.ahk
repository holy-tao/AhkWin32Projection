#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that recompress images.
 * @remarks
 * 
 * Implement <b>IImageRecompress</b> if you are implementing
 * 			an image object that may need recompressing. The
 * 			<b>IImageRecompress</b> interface is implemented in the
 * 			<a href="https://docs.microsoft.com/windows/desktop/shell/known-folders">ImageRecompress</a> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iimagerecompress
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IImageRecompress extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageRecompress
     * @type {Guid}
     */
    static IID => Guid("{505f1513-6b3e-4892-a272-59f8889a4d3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RecompressImage"]

    /**
     * Recompresses an image. Implemented in an ImageRecompress object, this method accepts x and y dimensions with a designation of quality. The method creates a stream containing the new image that has been recompressed to the specified size.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the object containing the stream of the image to read.
     * @param {Integer} cx Type: <b>int</b>
     * 
     * The x dimension of the image to return.
     * @param {Integer} cy Type: <b>int</b>
     * 
     * The y dimension of the image to return.
     * @param {Integer} iQuality Type: <b>int</b>
     * 
     * An indication of recompression quality that can range from 0 to 100.
     * @param {IStorage} pstg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the
     * 				object that contains the stream to be written to.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface pointer
     * 				variable that receives the output stream written to.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iimagerecompress-recompressimage
     */
    RecompressImage(psi, cx, cy, iQuality, pstg) {
        result := ComCall(3, this, "ptr", psi, "int", cx, "int", cy, "int", iQuality, "ptr", pstg, "ptr*", &ppstrmOut := 0, "HRESULT")
        return IStream(ppstrmOut)
    }
}
