#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IMSVidFilePlaybackEvent.ahk

/**
 * Implements an event system for the Stream Buffer Engine, version 2 (SBE2) source filter that is wrapped in the Video Control. Each event corresponds to an event that the SBE2 source filter receives inside a DirectShow graph.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferV2SourceEvent)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambufferv2sourceevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferV2SourceEvent extends IMSVidFilePlaybackEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferV2SourceEvent
     * @type {Guid}
     */
    static IID => Guid("{49c771f9-41b2-4cf7-9f9a-a313a8f6027e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RatingsChanged", "TimeHole", "StaleDataRead", "ContentBecomingStale", "StaleFileDeleted", "RateChange", "BroadcastEvent", "BroadcastEventEx", "ContentPrimarilyAudio"]

    /**
     * Fired when the SBE2 source filter receives a STREAMBUFFER_EC_RATE_CHANGED event, which indicates the playback rate has changed.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferv2sourceevent-ratingschanged
     */
    RatingsChanged() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Fired when the SBE2 source filter receives a STREAMBUFFER_EC_TIMEHOLE event, which indicates playback has reached a gap in recorded content.
     * @param {Integer} StreamOffsetMS Time of the start of the gap relative to the content start, in milliseconds.
     * @param {Integer} SizeMS Duration of the gap, in milliseconds.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferv2sourceevent-timehole
     */
    TimeHole(StreamOffsetMS, SizeMS) {
        result := ComCall(9, this, "int", StreamOffsetMS, "int", SizeMS, "HRESULT")
        return result
    }

    /**
     * Fired when the SBE2 source filter receives a STREAMBUFFER_EC_STALE_DATA_READ event, which indicates an MSVidStreamBufferSource object has read from a temporary recording file that is marked for deletion.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferv2sourceevent-staledataread
     */
    StaleDataRead() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Fired when the SBE2 source filter receives a STREAMBUFFER_EC_CONTENT_BECOMING_STALE event, which indicates the stream buffer source lags behind the stream buffer sink by more than a preset number of files.For more information, see IStreamBufferConfigure::GetBackingFileCount.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferv2sourceevent-contentbecomingstale
     */
    ContentBecomingStale() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Fired when the SBE2 source filter receives a STREAMBUFFER_EC_STALE_FILE_DELETED event, which indicates that a temporary file has been deleted.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferv2sourceevent-stalefiledeleted
     */
    StaleFileDeleted() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Fired when the SBE2 source filter receives a STREAMBUFFER_EC_RATE_CHANGED event, which indicates the playback rate has changed.
     * @param {Float} qwNewRate New playback rate, multiplied by 1,000.
     * @param {Float} qwOldRate Old playback rate, multiplied by 1,000.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferv2sourceevent-ratechange
     */
    RateChange(qwNewRate, qwOldRate) {
        result := ComCall(13, this, "double", qwNewRate, "double", qwOldRate, "HRESULT")
        return result
    }

    /**
     * Fired when the SBE2 source filter receives any event fired through the IBroadcastEvent interface, other than the EVENTID_DTFilterRatingChange event.
     * @param {BSTR} Guid <b>BSTR</b> object that contains the GUID that identifies the event.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferv2sourceevent-broadcastevent
     */
    BroadcastEvent(Guid) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(14, this, "ptr", Guid, "HRESULT")
        return result
    }

    /**
     * Fired when an SBE2 source filter receives any event fired by a call to IBroadcastEventEx::FireEx.
     * @param {BSTR} Guid <b>BSTR</b> object that contains the GUID that identifies the event.
     * @param {Integer} Param1 Specifies the first implementation-dependent parameter.
     * @param {Integer} Param2 Specifies the second implementation-dependent parameter.
     * @param {Integer} Param3 Specifies the third implementation-dependent parameter.
     * @param {Integer} Param4 Specifies the fourth implementation-dependent parameter.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferv2sourceevent-broadcasteventex
     */
    BroadcastEventEx(Guid, Param1, Param2, Param3, Param4) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(15, this, "ptr", Guid, "uint", Param1, "uint", Param2, "uint", Param3, "uint", Param4, "HRESULT")
        return result
    }

    /**
     * Fired when an SBE2 source filter receives a STREAMBUFFER_EC_PRIMARY_AUDIO event, which is fired through the IMSVidStreamBufferSourceEvent3 interface, and indicates that SBE is processing primarily audio data.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferv2sourceevent-contentprimarilyaudio
     */
    ContentPrimarilyAudio() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
