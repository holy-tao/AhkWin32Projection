#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFQualityAdvise.ahk" { IMFQualityAdvise }
#Import ".\IMFMediaEvent.ahk" { IMFMediaEvent }

/**
 * Enables a pipeline object to adjust its own audio or video quality, in response to quality messages.
 * @remarks
 * This interface enables a pipeline object to respond to quality messages from the media sink. Currently, it is supported only for video decoders.
 * 
 * If a video decoder exposes <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfqualityadvise">IMFQualityAdvise</a> but not <b>IMFQualityAdvise2</b>, the quality manager controls quality adjustments for the decoder. In this case, the quality manager responds to <a href="https://docs.microsoft.com/windows/desktop/medfound/mequalitynotify">MEQualityNotify</a> events from the Enhanced Video Renderer (EVR) by calling <b>IMFQualityAdvise</b> methods on the decoder.
 * 
 * If the decoder exposes <b>IMFQualityAdvise2</b>, the quality manager forwards the <a href="https://docs.microsoft.com/windows/desktop/medfound/mequalitynotify">MEQualityNotify</a> events to the decoder and does not adjust the decoder's quality settings. The decoder should respond to these events by adjusting its own quality settings internally.
 * 
 * The preceding remarks apply to the default implementation of the quality manager; custom quality managers can implement other behaviors.
 * 
 * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfqualityadvise2
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFQualityAdvise2 extends IMFQualityAdvise {
    /**
     * The interface identifier for IMFQualityAdvise2
     * @type {Guid}
     */
    static IID := Guid("{f3706f0d-8ea2-4886-8000-7155e9ec2eae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFQualityAdvise2 interfaces
    */
    struct Vtbl extends IMFQualityAdvise.Vtbl {
        NotifyQualityEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFQualityAdvise2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Forwards an MEQualityNotify event from the media sink.
     * @remarks
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {IMFMediaEvent} pEvent A pointer to the event's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_advise_flags">MF_QUALITY_ADVISE_FLAGS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadvise2-notifyqualityevent
     */
    NotifyQualityEvent(pEvent) {
        result := ComCall(8, this, "ptr", pEvent, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    Query(iid) {
        if (IMFQualityAdvise2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NotifyQualityEvent := CallbackCreate(GetMethod(implObj, "NotifyQualityEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NotifyQualityEvent)
    }
}
