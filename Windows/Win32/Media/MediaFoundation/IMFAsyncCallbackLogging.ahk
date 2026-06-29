#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFAsyncCallback.ahk" { IMFAsyncCallback }

/**
 * Provides logging information about the parent object the async callback is associated with.
 * @remarks
 * <b>IMFAsyncCallbackLogging</b> is primarily used for async callbacks to return an ID of the parent object that they are associated with.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfasynccallbacklogging
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFAsyncCallbackLogging extends IMFAsyncCallback {
    /**
     * The interface identifier for IMFAsyncCallbackLogging
     * @type {Guid}
     */
    static IID := Guid("{c7a4dca1-f5f0-47b6-b92b-bf0106d25791}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFAsyncCallbackLogging interfaces
    */
    struct Vtbl extends IMFAsyncCallback.Vtbl {
        GetObjectPointer : IntPtr
        GetObjectTag     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFAsyncCallbackLogging.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the pointer to the parent object the async callback is associated with.
     * @returns {Pointer<Void>} void pointer to the object.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfasynccallbacklogging-getobjectpointer
     */
    GetObjectPointer() {
        result := ComCall(5, this, IntPtr)
        return result
    }

    /**
     * Gets the tag of the parent object the async callback is associated object.
     * @returns {Integer} The tag of the object.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfasynccallbacklogging-getobjecttag
     */
    GetObjectTag() {
        result := ComCall(6, this, UInt32)
        return result
    }

    Query(iid) {
        if (IMFAsyncCallbackLogging.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetObjectPointer := CallbackCreate(GetMethod(implObj, "GetObjectPointer"), flags, 1)
        this.vtbl.GetObjectTag := CallbackCreate(GetMethod(implObj, "GetObjectTag"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetObjectPointer)
        CallbackFree(this.vtbl.GetObjectTag)
    }
}
