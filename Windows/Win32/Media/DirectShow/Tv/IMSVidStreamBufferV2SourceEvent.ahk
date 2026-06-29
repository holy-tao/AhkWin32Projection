#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IMSVidFilePlaybackEvent.ahk" { IMSVidFilePlaybackEvent }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Implements an event system for the Stream Buffer Engine, version 2 (SBE2) source filter that is wrapped in the Video Control. Each event corresponds to an event that the SBE2 source filter receives inside a DirectShow graph.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferV2SourceEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidstreambufferv2sourceevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidStreamBufferV2SourceEvent extends IMSVidFilePlaybackEvent {
    /**
     * The interface identifier for IMSVidStreamBufferV2SourceEvent
     * @type {Guid}
     */
    static IID := Guid("{49c771f9-41b2-4cf7-9f9a-a313a8f6027e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidStreamBufferV2SourceEvent interfaces
    */
    struct Vtbl extends IMSVidFilePlaybackEvent.Vtbl {
        RatingsChanged        : IntPtr
        TimeHole              : IntPtr
        StaleDataRead         : IntPtr
        ContentBecomingStale  : IntPtr
        StaleFileDeleted      : IntPtr
        RateChange            : IntPtr
        BroadcastEvent        : IntPtr
        BroadcastEventEx      : IntPtr
        ContentPrimarilyAudio : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidStreamBufferV2SourceEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Fired when the SBE2 source filter receives a STREAMBUFFER_EC_RATE_CHANGED event, which indicates the playback rate has changed.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-ratingschanged
     */
    RatingsChanged() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Fired when the SBE2 source filter receives a STREAMBUFFER_EC_TIMEHOLE event, which indicates playback has reached a gap in recorded content.
     * @param {Integer} StreamOffsetMS Time of the start of the gap relative to the content start, in milliseconds.
     * @param {Integer} SizeMS Duration of the gap, in milliseconds.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-timehole
     */
    TimeHole(StreamOffsetMS, SizeMS) {
        result := ComCall(9, this, "int", StreamOffsetMS, "int", SizeMS, "HRESULT")
        return result
    }

    /**
     * Fired when the SBE2 source filter receives a STREAMBUFFER_EC_STALE_DATA_READ event, which indicates an MSVidStreamBufferSource object has read from a temporary recording file that is marked for deletion.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-staledataread
     */
    StaleDataRead() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Fired when the SBE2 source filter receives a STREAMBUFFER_EC_CONTENT_BECOMING_STALE event, which indicates the stream buffer source lags behind the stream buffer sink by more than a preset number of files.For more information, see IStreamBufferConfigure::GetBackingFileCount.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-contentbecomingstale
     */
    ContentBecomingStale() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Fired when the SBE2 source filter receives a STREAMBUFFER_EC_STALE_FILE_DELETED event, which indicates that a temporary file has been deleted.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-stalefiledeleted
     */
    StaleFileDeleted() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Fired when the SBE2 source filter receives a STREAMBUFFER_EC_RATE_CHANGED event, which indicates the playback rate has changed.
     * @param {Float} qwNewRate New playback rate, multiplied by 1,000.
     * @param {Float} qwOldRate Old playback rate, multiplied by 1,000.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-ratechange
     */
    RateChange(qwNewRate, qwOldRate) {
        result := ComCall(13, this, "double", qwNewRate, "double", qwOldRate, "HRESULT")
        return result
    }

    /**
     * Fired when the SBE2 source filter receives any event fired through the IBroadcastEvent interface, other than the EVENTID_DTFilterRatingChange event.
     * @param {BSTR} Guid <b>BSTR</b> object that contains the GUID that identifies the event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-broadcastevent
     */
    BroadcastEvent(Guid) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(14, this, BSTR, Guid, "HRESULT")
        return result
    }

    /**
     * Fired when an SBE2 source filter receives any event fired by a call to IBroadcastEventEx::FireEx.
     * @param {BSTR} Guid <b>BSTR</b> object that contains the GUID that identifies the event.
     * @param {Integer} Param1 Specifies the first implementation-dependent parameter.
     * @param {Integer} Param2 Specifies the second implementation-dependent parameter.
     * @param {Integer} Param3 Specifies the third implementation-dependent parameter.
     * @param {Integer} Param4 Specifies the fourth implementation-dependent parameter.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-broadcasteventex
     */
    BroadcastEventEx(Guid, Param1, Param2, Param3, Param4) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(15, this, BSTR, Guid, "uint", Param1, "uint", Param2, "uint", Param3, "uint", Param4, "HRESULT")
        return result
    }

    /**
     * Fired when an SBE2 source filter receives a STREAMBUFFER_EC_PRIMARY_AUDIO event, which is fired through the IMSVidStreamBufferSourceEvent3 interface, and indicates that SBE is processing primarily audio data.
     * @remarks
     * A STREAMBUFFER_EC_PRIMARY_AUDIO event is sent if video samples are captured at a low frame rate. This event generally occurs with audio services on a DVB stream, but it might also indicate a problem with capturing or encoding the video. 
     * 
     * This event applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-contentprimarilyaudio
     */
    ContentPrimarilyAudio() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidStreamBufferV2SourceEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RatingsChanged := CallbackCreate(GetMethod(implObj, "RatingsChanged"), flags, 1)
        this.vtbl.TimeHole := CallbackCreate(GetMethod(implObj, "TimeHole"), flags, 3)
        this.vtbl.StaleDataRead := CallbackCreate(GetMethod(implObj, "StaleDataRead"), flags, 1)
        this.vtbl.ContentBecomingStale := CallbackCreate(GetMethod(implObj, "ContentBecomingStale"), flags, 1)
        this.vtbl.StaleFileDeleted := CallbackCreate(GetMethod(implObj, "StaleFileDeleted"), flags, 1)
        this.vtbl.RateChange := CallbackCreate(GetMethod(implObj, "RateChange"), flags, 3)
        this.vtbl.BroadcastEvent := CallbackCreate(GetMethod(implObj, "BroadcastEvent"), flags, 2)
        this.vtbl.BroadcastEventEx := CallbackCreate(GetMethod(implObj, "BroadcastEventEx"), flags, 6)
        this.vtbl.ContentPrimarilyAudio := CallbackCreate(GetMethod(implObj, "ContentPrimarilyAudio"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RatingsChanged)
        CallbackFree(this.vtbl.TimeHole)
        CallbackFree(this.vtbl.StaleDataRead)
        CallbackFree(this.vtbl.ContentBecomingStale)
        CallbackFree(this.vtbl.StaleFileDeleted)
        CallbackFree(this.vtbl.RateChange)
        CallbackFree(this.vtbl.BroadcastEvent)
        CallbackFree(this.vtbl.BroadcastEventEx)
        CallbackFree(this.vtbl.ContentPrimarilyAudio)
    }
}
