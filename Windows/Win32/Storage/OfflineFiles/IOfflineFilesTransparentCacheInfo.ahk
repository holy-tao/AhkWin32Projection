#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents information associated with transparently cached items.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilestransparentcacheinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesTransparentCacheInfo extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesTransparentCacheInfo
     * @type {Guid}
     */
    static IID := Guid("{bcaf4a01-5b68-4b56-a6a1-8d2786ede8e3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesTransparentCacheInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsTransparentlyCached : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesTransparentCacheInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the item is transparently cached.
     * @remarks
     * A transparently cached item is cached locally. However, it can be accessed only when the server is available and the user is online with respect to that server. If the cached version of the file matches the correct version of the file on the server, requests to read data will be satisfied from the cache rather than requesting the data from the server.
     * @returns {BOOL} A pointer to a variable that receives <b>TRUE</b> if the item is transparently cached, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilestransparentcacheinfo-istransparentlycached
     */
    IsTransparentlyCached() {
        result := ComCall(3, this, BOOL.Ptr, &pbTransparentlyCached := 0, "HRESULT")
        return pbTransparentlyCached
    }

    Query(iid) {
        if (IOfflineFilesTransparentCacheInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsTransparentlyCached := CallbackCreate(GetMethod(implObj, "IsTransparentlyCached"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsTransparentlyCached)
    }
}
