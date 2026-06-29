#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables a media sink to receive samples before the presentation clock is started.
 * @remarks
 * Media sinks can implement this interface to support seamless playback and transitions. If a media sink exposes this interface, it can receive samples before the presentation clock starts. It can then pre-process the samples, so that rendering can begin immediately when the clock starts. Prerolling helps to avoid glitches during playback.
 * 
 * If a media sink supports preroll, the media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-getcharacteristics">IMFMediaSink::GetCharacteristics</a> method should return the MEDIASINK_CAN_PREROLL flag.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfmediasinkpreroll
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaSinkPreroll extends IUnknown {
    /**
     * The interface identifier for IMFMediaSinkPreroll
     * @type {Guid}
     */
    static IID := Guid("{5dfd4b2a-7674-4110-a4e6-8a68fd5f3688}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaSinkPreroll interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NotifyPreroll : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaSinkPreroll.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the media sink that the presentation clock is about to start.
     * @remarks
     * After this method is called, the media sink sends any number of <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamsinkrequestsample">MEStreamSinkRequestSample</a> events to request samples, until is has enough preroll data. When it has enough preroll data, the media sink sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamsinkprerolled">MEStreamSinkPrerolled</a> event. This event signals that the client can start the presentation clock.
     *       
     * 
     * During preroll, the media sink can prepare the samples that it receives, so that they are ready to be rendered. It does not actually render any samples until the clock starts.
     * @param {Integer} hnsUpcomingStartTime The upcoming start time for the presentation clock, in 100-nanosecond units. This time is the same value that will be given to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-start">IMFPresentationClock::Start</a> method when the presentation clock is started.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasinkpreroll-notifypreroll
     */
    NotifyPreroll(hnsUpcomingStartTime) {
        result := ComCall(3, this, "int64", hnsUpcomingStartTime, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaSinkPreroll.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NotifyPreroll := CallbackCreate(GetMethod(implObj, "NotifyPreroll"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NotifyPreroll)
    }
}
