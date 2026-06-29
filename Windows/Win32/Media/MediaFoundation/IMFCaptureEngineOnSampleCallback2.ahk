#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFCaptureEngineOnSampleCallback.ahk" { IMFCaptureEngineOnSampleCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMediaEvent.ahk" { IMFMediaEvent }

/**
 * Extensions for the IMFCaptureEngineOnSampleCallback callback interface that is used to receive data from the capture engine.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nn-mfcaptureengine-imfcaptureengineonsamplecallback2
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCaptureEngineOnSampleCallback2 extends IMFCaptureEngineOnSampleCallback {
    /**
     * The interface identifier for IMFCaptureEngineOnSampleCallback2
     * @type {Guid}
     */
    static IID := Guid("{e37ceed7-340f-4514-9f4d-9c2ae026100b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCaptureEngineOnSampleCallback2 interfaces
    */
    struct Vtbl extends IMFCaptureEngineOnSampleCallback.Vtbl {
        OnSynchronizedEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCaptureEngineOnSampleCallback2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the capture sink when the format of the sample is changed.
     * @remarks
     * The return value is ignored.
     * @param {IMFMediaEvent} pEvent The new media type.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengineonsamplecallback2-onsynchronizedevent
     */
    OnSynchronizedEvent(pEvent) {
        result := ComCall(4, this, "ptr", pEvent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFCaptureEngineOnSampleCallback2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSynchronizedEvent := CallbackCreate(GetMethod(implObj, "OnSynchronizedEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSynchronizedEvent)
    }
}
