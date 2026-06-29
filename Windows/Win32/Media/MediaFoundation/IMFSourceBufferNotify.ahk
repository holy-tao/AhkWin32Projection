#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides functionality for raising events associated with IMFSourceBuffer.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfsourcebuffernotify
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSourceBufferNotify extends IUnknown {
    /**
     * The interface identifier for IMFSourceBufferNotify
     * @type {Guid}
     */
    static IID := Guid("{87e47623-2ceb-45d6-9b88-d8520c4dcbbc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSourceBufferNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnUpdateStart : IntPtr
        OnAbort       : IntPtr
        OnError       : IntPtr
        OnUpdate      : IntPtr
        OnUpdateEnd   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSourceBufferNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used to indicate that the source buffer has started updating.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffernotify-onupdatestart
     */
    OnUpdateStart() {
        ComCall(3, this)
    }

    /**
     * Used to indicate that the source buffer has been aborted.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffernotify-onabort
     */
    OnAbort() {
        ComCall(4, this)
    }

    /**
     * Used to indicate that an error has occurred with the source buffer.
     * @param {HRESULT} hr 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffernotify-onerror
     */
    OnError(hr) {
        ComCall(5, this, "int", hr)
    }

    /**
     * Used to indicate that the source buffer is updating.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffernotify-onupdate
     */
    OnUpdate() {
        ComCall(6, this)
    }

    /**
     * Used to indicate that the source buffer has finished updating.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffernotify-onupdateend
     */
    OnUpdateEnd() {
        ComCall(7, this)
    }

    Query(iid) {
        if (IMFSourceBufferNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnUpdateStart := CallbackCreate(GetMethod(implObj, "OnUpdateStart"), flags, 1)
        this.vtbl.OnAbort := CallbackCreate(GetMethod(implObj, "OnAbort"), flags, 1)
        this.vtbl.OnError := CallbackCreate(GetMethod(implObj, "OnError"), flags, 2)
        this.vtbl.OnUpdate := CallbackCreate(GetMethod(implObj, "OnUpdate"), flags, 1)
        this.vtbl.OnUpdateEnd := CallbackCreate(GetMethod(implObj, "OnUpdateEnd"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnUpdateStart)
        CallbackFree(this.vtbl.OnAbort)
        CallbackFree(this.vtbl.OnError)
        CallbackFree(this.vtbl.OnUpdate)
        CallbackFree(this.vtbl.OnUpdateEnd)
    }
}
