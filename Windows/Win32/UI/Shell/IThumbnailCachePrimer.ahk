#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WTS_FLAGS.ahk" { WTS_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * . (IThumbnailCachePrimer)
 * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nn-thumbcache-ithumbnailcacheprimer
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IThumbnailCachePrimer extends IUnknown {
    /**
     * The interface identifier for IThumbnailCachePrimer
     * @type {Guid}
     */
    static IID := Guid("{0f03f8fe-2b26-46f0-965a-212aa8d66b76}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IThumbnailCachePrimer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PageInThumbnail : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IThumbnailCachePrimer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * . (IThumbnailCachePrimer.PageInThumbnail)
     * @param {IShellItem} psi 
     * @param {WTS_FLAGS} wtsFlags 
     * @param {Integer} cxyRequestedThumbSize 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-ithumbnailcacheprimer-pageinthumbnail
     */
    PageInThumbnail(psi, wtsFlags, cxyRequestedThumbSize) {
        result := ComCall(3, this, "ptr", psi, WTS_FLAGS, wtsFlags, "uint", cxyRequestedThumbSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IThumbnailCachePrimer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PageInThumbnail := CallbackCreate(GetMethod(implObj, "PageInThumbnail"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PageInThumbnail)
    }
}
