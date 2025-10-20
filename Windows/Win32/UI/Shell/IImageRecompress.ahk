#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {IShellItem} psi 
     * @param {Integer} cx 
     * @param {Integer} cy 
     * @param {Integer} iQuality 
     * @param {IStorage} pstg 
     * @param {Pointer<IStream>} ppstrmOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iimagerecompress-recompressimage
     */
    RecompressImage(psi, cx, cy, iQuality, pstg, ppstrmOut) {
        result := ComCall(3, this, "ptr", psi, "int", cx, "int", cy, "int", iQuality, "ptr", pstg, "ptr*", ppstrmOut, "HRESULT")
        return result
    }
}
