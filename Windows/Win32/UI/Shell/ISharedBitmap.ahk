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
     * Retrieves the bitmap contained in an ISharedBitmap object.
     * @returns {HBITMAP} Type: <b>HBITMAP*</b>
     * 
     * A pointer to a handle to the bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nf-thumbcache-isharedbitmap-getsharedbitmap
     */
    GetSharedBitmap() {
        phbm := HBITMAP()
        result := ComCall(3, this, "ptr", phbm, "HRESULT")
        return phbm
    }

    /**
     * Retrieves the size of the bitmap contained in an ISharedBitmap object.
     * @returns {SIZE} Type: <b><a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a>*</b>
     * 
     * When this method returns, contains a pointer to a value that specifies the size, in pixels, of the contained bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nf-thumbcache-isharedbitmap-getsize
     */
    GetSize() {
        pSize := SIZE()
        result := ComCall(4, this, "ptr", pSize, "HRESULT")
        return pSize
    }

    /**
     * Retrieves the alpha type of the bitmap image.
     * @returns {Integer} Type: <b>WTS_ALPHATYPE*</b>
     * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nf-thumbcache-isharedbitmap-getformat
     */
    GetFormat() {
        result := ComCall(5, this, "int*", &pat := 0, "HRESULT")
        return pat
    }

    /**
     * Initializes a new ISharedBitmap object with a given bitmap.
     * @param {HBITMAP} hbm Type: <b>HBITMAP</b>
     * 
     * A handle to the bitmap with which to initialize a new <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-isharedbitmap">ISharedBitmap</a> object. The bitmap must be a DIB.
     * @param {Integer} wtsAT Type: <b>WTS_ALPHATYPE</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nf-thumbcache-isharedbitmap-initializebitmap
     */
    InitializeBitmap(hbm, wtsAT) {
        hbm := hbm is Win32Handle ? NumGet(hbm, "ptr") : hbm

        result := ComCall(6, this, "ptr", hbm, "int", wtsAT, "HRESULT")
        return result
    }

    /**
     * Retrieves the bitmap contained in an ISharedBitmap object, and returns a copy if the contained bitmap resides in shared memory.
     * @returns {HBITMAP} Type: <b>HBITMAP*</b>
     * 
     * When this method returns, contains a pointer to a handle to the bitmap to retrieve.
     * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nf-thumbcache-isharedbitmap-detach
     */
    Detach() {
        phbm := HBITMAP()
        result := ComCall(7, this, "ptr", phbm, "HRESULT")
        return phbm
    }
}
