#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidFilePlaybackEvent.ahk

/**
 * This topic applies to Windows XP Service Pack 1 or later.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSourceEvent)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersourceevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSourceEvent extends IMSVidFilePlaybackEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferSourceEvent
     * @type {Guid}
     */
    static IID => Guid("{50ce8a7d-9c28-4da8-9042-cdfa7116f979}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CertificateFailure", "CertificateSuccess", "RatingsBlocked", "RatingsUnblocked", "RatingsChanged", "TimeHole", "StaleDataRead", "ContentBecomingStale", "StaleFileDeleted"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-certificatefailure
     */
    CertificateFailure() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-certificatesuccess
     */
    CertificateSuccess() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-ratingsblocked
     */
    RatingsBlocked() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-ratingsunblocked
     */
    RatingsUnblocked() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-ratingschanged
     */
    RatingsChanged() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StreamOffsetMS 
     * @param {Integer} SizeMS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-timehole
     */
    TimeHole(StreamOffsetMS, SizeMS) {
        result := ComCall(13, this, "int", StreamOffsetMS, "int", SizeMS, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-staledataread
     */
    StaleDataRead() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-contentbecomingstale
     */
    ContentBecomingStale() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-stalefiledeleted
     */
    StaleFileDeleted() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
