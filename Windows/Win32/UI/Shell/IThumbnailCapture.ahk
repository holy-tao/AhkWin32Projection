#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that obtains a thumbnail representation of an HTML wallpaper.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/nn-shlobj-ithumbnailcapture
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IThumbnailCapture extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThumbnailCapture
     * @type {Guid}
     */
    static IID => Guid("{4ea39266-7211-409f-b622-f63dbd16c533}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CaptureThumbnail"]

    /**
     * 
     * @param {Pointer<SIZE>} pMaxSize 
     * @param {IUnknown} pHTMLDoc2 
     * @param {Pointer<HBITMAP>} phbmThumbnail 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-ithumbnailcapture-capturethumbnail
     */
    CaptureThumbnail(pMaxSize, pHTMLDoc2, phbmThumbnail) {
        result := ComCall(3, this, "ptr", pMaxSize, "ptr", pHTMLDoc2, "ptr", phbmThumbnail, "HRESULT")
        return result
    }
}
