#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFSample.ahk" { IMFSample }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Callback interface to receive data from the capture engine.
 * @remarks
 * To set the callback interface, call one of the following methods.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturephotosink-setsamplecallback">IMFCapturePhotoSink::SetSampleCallback</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturepreviewsink-setsamplecallback">IMFCapturePreviewSink::SetSampleCallback</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturerecordsink-setsamplecallback">IMFCaptureRecordSink::SetSampleCallback</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nn-mfcaptureengine-imfcaptureengineonsamplecallback
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCaptureEngineOnSampleCallback extends IUnknown {
    /**
     * The interface identifier for IMFCaptureEngineOnSampleCallback
     * @type {Guid}
     */
    static IID := Guid("{52150b82-ab39-4467-980f-e48bf0822ecd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCaptureEngineOnSampleCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnSample : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCaptureEngineOnSampleCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the capture sink receives a sample.
     * @param {IMFSample} pSample A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface. Use this interface to get the time stamp, duration, and stream data. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-samples">Media Samples</a>. This parameter can be <b>NULL</b>, so make sure to check for a <b>NULL</b> value before you dereference the pointer.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengineonsamplecallback-onsample
     */
    OnSample(pSample) {
        result := ComCall(3, this, "ptr", pSample, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFCaptureEngineOnSampleCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSample := CallbackCreate(GetMethod(implObj, "OnSample"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSample)
    }
}
