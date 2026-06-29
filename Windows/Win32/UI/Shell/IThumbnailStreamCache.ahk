#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\ThumbnailStreamCacheOptions.ahk" { ThumbnailStreamCacheOptions }

/**
 * Gets or sets the thumbnail stream. This interface is for internal use only and can only be called by the photos application.
 * @see https://learn.microsoft.com/windows/win32/api/thumbnailstreamcache/nn-thumbnailstreamcache-ithumbnailstreamcache
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IThumbnailStreamCache extends IUnknown {
    /**
     * The interface identifier for IThumbnailStreamCache
     * @type {Guid}
     */
    static IID := Guid("{90e11430-9569-41d8-ae75-6d4d2ae7cca0}")

    /**
     * The class identifier for ThumbnailStreamCache
     * @type {Guid}
     */
    static CLSID := Guid("{cbe0fed3-4b91-4e90-8354-8a8c84ec6872}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IThumbnailStreamCache interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetThumbnailStream : IntPtr
        SetThumbnailStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IThumbnailStreamCache.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the thumbnail stream. This method is for internal use only and can only be called by the photos application.
     * @param {PWSTR} _path The path to the thumbnail.
     * @param {Integer} cacheId The identifier of the thumbnail.
     * @param {ThumbnailStreamCacheOptions} options The cache options for the thumbnail stream.
     * @param {Integer} requestedThumbnailSize The requested size of the thumbnail.
     * @param {Pointer<SIZE>} thumbnailSize The actual size of the returned thumbnail.
     * @param {Pointer<IStream>} thumbnailStream The requested thumbnail.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/thumbnailstreamcache/nf-thumbnailstreamcache-ithumbnailstreamcache-getthumbnailstream
     */
    GetThumbnailStream(_path, cacheId, options, requestedThumbnailSize, thumbnailSize, thumbnailStream) {
        _path := _path is String ? StrPtr(_path) : _path

        result := ComCall(3, this, "ptr", _path, "uint", cacheId, ThumbnailStreamCacheOptions, options, "uint", requestedThumbnailSize, SIZE.Ptr, thumbnailSize, IStream.Ptr, thumbnailStream, "HRESULT")
        return result
    }

    /**
     * Sets the thumbnail stream. This method is for internal use only and can only be called by the photos application.
     * @param {PWSTR} _path The path to the thumbnail.
     * @param {Integer} cacheId The identifier of the thumbnail.
     * @param {SIZE} thumbnailSize The size of the thumbnail.
     * @param {IStream} thumbnailStream The pointer to the thumbnail stream.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/thumbnailstreamcache/nf-thumbnailstreamcache-ithumbnailstreamcache-setthumbnailstream
     */
    SetThumbnailStream(_path, cacheId, thumbnailSize, thumbnailStream) {
        _path := _path is String ? StrPtr(_path) : _path

        result := ComCall(4, this, "ptr", _path, "uint", cacheId, SIZE, thumbnailSize, "ptr", thumbnailStream, "HRESULT")
        return result
    }

    Query(iid) {
        if (IThumbnailStreamCache.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetThumbnailStream := CallbackCreate(GetMethod(implObj, "GetThumbnailStream"), flags, 7)
        this.vtbl.SetThumbnailStream := CallbackCreate(GetMethod(implObj, "SetThumbnailStream"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetThumbnailStream)
        CallbackFree(this.vtbl.SetThumbnailStream)
    }
}
