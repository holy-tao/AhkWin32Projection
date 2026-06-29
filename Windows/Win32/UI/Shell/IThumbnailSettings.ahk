#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WTS_CONTEXTFLAGS.ahk" { WTS_CONTEXTFLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method that enables a thumbnail provider to determine the user context of a thumbnail request.
 * @remarks
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * This interface can be implemented by any thumbnail provider that supports <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iextractimage">IExtractImage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-ithumbnailprovider">IThumbnailProvider</a>.
 * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nn-thumbcache-ithumbnailsettings
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IThumbnailSettings extends IUnknown {
    /**
     * The interface identifier for IThumbnailSettings
     * @type {Guid}
     */
    static IID := Guid("{f4376f00-bef5-4d45-80f3-1e023bbf1209}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IThumbnailSettings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IThumbnailSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables a thumbnail provider to return a thumbnail specific to the user's context.
     * @param {WTS_CONTEXTFLAGS} dwContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_contextflags">WTS_CONTEXTFLAGS</a></b>
     * 
     * One or more flags that specify the context. This value is based on the <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_flags">WTS_FLAGS</a> values that are received by the thumbnail provider through the call to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailprovider-getthumbnail">IThumbnailProvider::GetThumbnail</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-ithumbnailsettings-setcontext
     */
    SetContext(dwContext) {
        result := ComCall(3, this, WTS_CONTEXTFLAGS, dwContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IThumbnailSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetContext := CallbackCreate(GetMethod(implObj, "SetContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetContext)
    }
}
