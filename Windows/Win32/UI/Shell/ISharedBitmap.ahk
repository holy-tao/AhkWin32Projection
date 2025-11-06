#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes memory-efficient methods for accessing bitmaps. This interface is used as a thin wrapper around HBITMAP objects, allowing those objects to be reference counted and protected from having their underlying data changed.
 * @remarks
 * 
  * This interface is used in conjunction with the methods of <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-ithumbnailcache">IThumbnailCache</a>. Bitmaps returned by <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnail">IThumbnailCache::GetThumbnail</a> and <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnailbyid">IThumbnailCache::GetThumbnailByID</a> are of type <b>ISharedBitmap</b>.
  * 
  * When an <b>ISharedBitmap</b> object is retrieved from the thumbnail cache, the underlying bitmap may reside in shared memory to provide improved performance.
  * 
  * The underlying data of the memory-mapped bitmap is protected while the client is accessing it.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nn-thumbcache-isharedbitmap
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISharedBitmap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISharedBitmap
     * @type {Guid}
     */
    static IID => Guid("{091162a4-bc96-411f-aae8-c5122cd03363}")

    /**
     * The class identifier for SharedBitmap
     * @type {Guid}
     */
    static CLSID => Guid("{4db26476-6787-4046-b836-e8412a9e8a27}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSharedBitmap", "GetSize", "GetFormat", "InitializeBitmap", "Detach"]

    /**
     * 
     * @returns {HBITMAP} 
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-isharedbitmap-getsharedbitmap
     */
    GetSharedBitmap() {
        phbm := HBITMAP()
        result := ComCall(3, this, "ptr", phbm, "HRESULT")
        return phbm
    }

    /**
     * 
     * @returns {SIZE} 
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-isharedbitmap-getsize
     */
    GetSize() {
        pSize := SIZE()
        result := ComCall(4, this, "ptr", pSize, "HRESULT")
        return pSize
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-isharedbitmap-getformat
     */
    GetFormat() {
        result := ComCall(5, this, "int*", &pat := 0, "HRESULT")
        return pat
    }

    /**
     * 
     * @param {HBITMAP} hbm 
     * @param {Integer} wtsAT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-isharedbitmap-initializebitmap
     */
    InitializeBitmap(hbm, wtsAT) {
        hbm := hbm is Win32Handle ? NumGet(hbm, "ptr") : hbm

        result := ComCall(6, this, "ptr", hbm, "int", wtsAT, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HBITMAP} 
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-isharedbitmap-detach
     */
    Detach() {
        phbm := HBITMAP()
        result := ComCall(7, this, "ptr", phbm, "HRESULT")
        return phbm
    }
}
