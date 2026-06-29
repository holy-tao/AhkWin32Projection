#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WTS_ALPHATYPE.ahk" { WTS_ALPHATYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * Exposes memory-efficient methods for accessing bitmaps. This interface is used as a thin wrapper around HBITMAP objects, allowing those objects to be reference counted and protected from having their underlying data changed.
 * @remarks
 * This interface is used in conjunction with the methods of <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-ithumbnailcache">IThumbnailCache</a>. Bitmaps returned by <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnail">IThumbnailCache::GetThumbnail</a> and <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnailbyid">IThumbnailCache::GetThumbnailByID</a> are of type <b>ISharedBitmap</b>.
 * 
 * When an <b>ISharedBitmap</b> object is retrieved from the thumbnail cache, the underlying bitmap may reside in shared memory to provide improved performance.
 * 
 * The underlying data of the memory-mapped bitmap is protected while the client is accessing it.
 * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nn-thumbcache-isharedbitmap
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISharedBitmap extends IUnknown {
    /**
     * The interface identifier for ISharedBitmap
     * @type {Guid}
     */
    static IID := Guid("{091162a4-bc96-411f-aae8-c5122cd03363}")

    /**
     * The class identifier for SharedBitmap
     * @type {Guid}
     */
    static CLSID := Guid("{4db26476-6787-4046-b836-e8412a9e8a27}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISharedBitmap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSharedBitmap  : IntPtr
        GetSize          : IntPtr
        GetFormat        : IntPtr
        InitializeBitmap : IntPtr
        Detach           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISharedBitmap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the bitmap contained in an ISharedBitmap object.
     * @remarks
     * The bitmap retrieved might reside in shared memory.
     * @returns {HBITMAP} Type: <b>HBITMAP*</b>
     * 
     * A pointer to a handle to the bitmap.
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-isharedbitmap-getsharedbitmap
     */
    GetSharedBitmap() {
        phbm := HBITMAP.Owned()
        result := ComCall(3, this, HBITMAP.Ptr, phbm, "HRESULT")
        return phbm
    }

    /**
     * Retrieves the size of the bitmap contained in an ISharedBitmap object.
     * @returns {SIZE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a>*</b>
     * 
     * When this method returns, contains a pointer to a value that specifies the size, in pixels, of the contained bitmap.
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-isharedbitmap-getsize
     */
    GetSize() {
        pSize := SIZE()
        result := ComCall(4, this, SIZE.Ptr, pSize, "HRESULT")
        return pSize
    }

    /**
     * Retrieves the alpha type of the bitmap image.
     * @returns {WTS_ALPHATYPE} Type: <b>WTS_ALPHATYPE*</b>
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-isharedbitmap-getformat
     */
    GetFormat() {
        result := ComCall(5, this, "int*", &pat := 0, "HRESULT")
        return pat
    }

    /**
     * Initializes a new ISharedBitmap object with a given bitmap.
     * @remarks
     * When an <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-isharedbitmap">ISharedBitmap</a> object is instantiated by the client (as opposed to being returned by the <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnailbyid">IThumbnailCache::GetThumbnailByID</a> or <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnail">IThumbnailCache::GetThumbnail</a> methods), the underlying bitmap will not reside in shared memory.
     * @param {HBITMAP} _hbm Type: <b>HBITMAP</b>
     * 
     * A handle to the bitmap with which to initialize a new <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-isharedbitmap">ISharedBitmap</a> object. The bitmap must be a DIB.
     * @param {WTS_ALPHATYPE} wtsAT Type: <b>WTS_ALPHATYPE</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-isharedbitmap-initializebitmap
     */
    InitializeBitmap(_hbm, wtsAT) {
        result := ComCall(6, this, HBITMAP, _hbm, WTS_ALPHATYPE, wtsAT, "HRESULT")
        return result
    }

    /**
     * Retrieves the bitmap contained in an ISharedBitmap object, and returns a copy if the contained bitmap resides in shared memory.
     * @remarks
     * If the bitmap being retrieved resides in shared memory, a copy of the bitmap is returned.  The <b>Detach</b> method does not release any references to the underlying shared memory.
     * 
     * If the bitmap being retrieved does not reside in shared memory, the bitmap itself is returned and no copy is made.
     * @returns {HBITMAP} Type: <b>HBITMAP*</b>
     * 
     * When this method returns, contains a pointer to a handle to the bitmap to retrieve.
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-isharedbitmap-detach
     */
    Detach() {
        phbm := HBITMAP.Owned()
        result := ComCall(7, this, HBITMAP.Ptr, phbm, "HRESULT")
        return phbm
    }

    Query(iid) {
        if (ISharedBitmap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSharedBitmap := CallbackCreate(GetMethod(implObj, "GetSharedBitmap"), flags, 2)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 2)
        this.vtbl.GetFormat := CallbackCreate(GetMethod(implObj, "GetFormat"), flags, 2)
        this.vtbl.InitializeBitmap := CallbackCreate(GetMethod(implObj, "InitializeBitmap"), flags, 3)
        this.vtbl.Detach := CallbackCreate(GetMethod(implObj, "Detach"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSharedBitmap)
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.GetFormat)
        CallbackFree(this.vtbl.InitializeBitmap)
        CallbackFree(this.vtbl.Detach)
    }
}
