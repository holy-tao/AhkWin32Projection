#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implement this callback to receive notifications when system-allocated frame buffers are sent to the device driver.
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/nn-mftransform-imfdevicetransformcallback
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFDeviceTransformCallback extends IUnknown {
    /**
     * The interface identifier for IMFDeviceTransformCallback
     * @type {Guid}
     */
    static IID := Guid("{6d5cb646-29ec-41fb-8179-8c4c6d750811}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFDeviceTransformCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnBufferSent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFDeviceTransformCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when system-allocated frame buffers are sent to the device driver.
     * @remarks
     * The frame buffer header information provided by this callback is read-only. You should not try to allocate, deallocate, open, or close anything within the header.
     * @param {IMFAttributes} pCallbackAttributes The attributes containing the callback data. The System-allocated frame buffer information is stored in the attribute with the MF_DMFT_FRAME_BUFFER_INFO key.
     * @param {Integer} pinId The identifier of the device pin to which the frame buffers are sent.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransformcallback-onbuffersent
     */
    OnBufferSent(pCallbackAttributes, pinId) {
        result := ComCall(3, this, "ptr", pCallbackAttributes, "uint", pinId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFDeviceTransformCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnBufferSent := CallbackCreate(GetMethod(implObj, "OnBufferSent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnBufferSent)
    }
}
