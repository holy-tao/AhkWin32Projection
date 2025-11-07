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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-ratingschanged
     */
    RatingsChanged() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StreamOffsetMS 
     * @param {Integer} SizeMS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-timehole
     */
    TimeHole(StreamOffsetMS, SizeMS) {
        result := ComCall(9, this, "int", StreamOffsetMS, "int", SizeMS, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-staledataread
     */
    StaleDataRead() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-contentbecomingstale
     */
    ContentBecomingStale() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-stalefiledeleted
     */
    StaleFileDeleted() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} qwNewRate 
     * @param {Float} qwOldRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-ratechange
     */
    RateChange(qwNewRate, qwOldRate) {
        result := ComCall(13, this, "double", qwNewRate, "double", qwOldRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-broadcastevent
     */
    BroadcastEvent(Guid) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(14, this, "ptr", Guid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Guid 
     * @param {Integer} Param1 
     * @param {Integer} Param2 
     * @param {Integer} Param3 
     * @param {Integer} Param4 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-broadcasteventex
     */
    BroadcastEventEx(Guid, Param1, Param2, Param3, Param4) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(15, this, "ptr", Guid, "uint", Param1, "uint", Param2, "uint", Param3, "uint", Param4, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferv2sourceevent-contentprimarilyaudio
     */
    ContentPrimarilyAudio() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
