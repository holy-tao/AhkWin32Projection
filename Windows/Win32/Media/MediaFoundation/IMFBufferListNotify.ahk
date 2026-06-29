#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables IMFSourceBufferList object to notify its clients of important state changes.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfbufferlistnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFBufferListNotify extends IUnknown {
    /**
     * The interface identifier for IMFBufferListNotify
     * @type {Guid}
     */
    static IID := Guid("{24cd47f7-81d8-4785-adb2-af697a963cd2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFBufferListNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnAddSourceBuffer    : IntPtr
        OnRemoveSourceBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFBufferListNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates that a IMFSourceBuffer has been added.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfbufferlistnotify-onaddsourcebuffer
     */
    OnAddSourceBuffer() {
        ComCall(3, this)
    }

    /**
     * Indicates that a IMFSourceBuffer has been removed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfbufferlistnotify-onremovesourcebuffer
     */
    OnRemoveSourceBuffer() {
        ComCall(4, this)
    }

    Query(iid) {
        if (IMFBufferListNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnAddSourceBuffer := CallbackCreate(GetMethod(implObj, "OnAddSourceBuffer"), flags, 1)
        this.vtbl.OnRemoveSourceBuffer := CallbackCreate(GetMethod(implObj, "OnRemoveSourceBuffer"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnAddSourceBuffer)
        CallbackFree(this.vtbl.OnRemoveSourceBuffer)
    }
}
