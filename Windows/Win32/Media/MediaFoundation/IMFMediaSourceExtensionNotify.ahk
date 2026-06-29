#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides functionality for raising events associated with IMFMediaSourceExtension.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediasourceextensionnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaSourceExtensionNotify extends IUnknown {
    /**
     * The interface identifier for IMFMediaSourceExtensionNotify
     * @type {Guid}
     */
    static IID := Guid("{a7901327-05dd-4469-a7b7-0e01979e361d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaSourceExtensionNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnSourceOpen  : IntPtr
        OnSourceEnded : IntPtr
        OnSourceClose : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaSourceExtensionNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used to indicate that the media source has opened.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextensionnotify-onsourceopen
     */
    OnSourceOpen() {
        ComCall(3, this)
    }

    /**
     * Used to indicate that the media source has ended.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextensionnotify-onsourceended
     */
    OnSourceEnded() {
        ComCall(4, this)
    }

    /**
     * Used to indicate that the media source has closed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextensionnotify-onsourceclose
     */
    OnSourceClose() {
        ComCall(5, this)
    }

    Query(iid) {
        if (IMFMediaSourceExtensionNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSourceOpen := CallbackCreate(GetMethod(implObj, "OnSourceOpen"), flags, 1)
        this.vtbl.OnSourceEnded := CallbackCreate(GetMethod(implObj, "OnSourceEnded"), flags, 1)
        this.vtbl.OnSourceClose := CallbackCreate(GetMethod(implObj, "OnSourceClose"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSourceOpen)
        CallbackFree(this.vtbl.OnSourceEnded)
        CallbackFree(this.vtbl.OnSourceClose)
    }
}
