#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidFilePlaybackEvent.ahk" { IMSVidFilePlaybackEvent }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * This topic applies to Windows XP Service Pack 1 or later.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSourceEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidstreambuffersourceevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidStreamBufferSourceEvent extends IMSVidFilePlaybackEvent {
    /**
     * The interface identifier for IMSVidStreamBufferSourceEvent
     * @type {Guid}
     */
    static IID := Guid("{50ce8a7d-9c28-4da8-9042-cdfa7116f979}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidStreamBufferSourceEvent interfaces
    */
    struct Vtbl extends IMSVidFilePlaybackEvent.Vtbl {
        CertificateFailure   : IntPtr
        CertificateSuccess   : IntPtr
        RatingsBlocked       : IntPtr
        RatingsUnblocked     : IntPtr
        RatingsChanged       : IntPtr
        TimeHole             : IntPtr
        StaleDataRead        : IntPtr
        ContentBecomingStale : IntPtr
        StaleFileDeleted     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidStreamBufferSourceEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-certificatefailure
     */
    CertificateFailure() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-certificatesuccess
     */
    CertificateSuccess() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-ratingsblocked
     */
    RatingsBlocked() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-ratingsunblocked
     */
    RatingsUnblocked() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-ratingschanged
     */
    RatingsChanged() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @remarks
     * This event corresponds to the STREAMBUFFER_EC_TIMEHOLE event in the Stream Buffer Engine. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/stream-buffer-engine-codes">Stream Buffer Engine Event Codes</a>.
     * @param {Integer} StreamOffsetMS Specifies the start of the gap, in milliseconds, relative to the content start.
     * @param {Integer} SizeMS Specifies the length of the gap, in milliseconds.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-timehole
     */
    TimeHole(StreamOffsetMS, SizeMS) {
        result := ComCall(13, this, "int", StreamOffsetMS, "int", SizeMS, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @remarks
     * This event corresponds to the STREAMBUFFER_EC_STALE_DATA_READ event in the Stream Buffer Engine. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/stream-buffer-engine-codes">Stream Buffer Engine Event Codes</a>.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-staledataread
     */
    StaleDataRead() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @remarks
     * This event corresponds to the STREAMBUFFER_EC_CONTENT_BECOMING_STALE event in the Stream Buffer Engine. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/stream-buffer-engine-codes">Stream Buffer Engine Event Codes</a>.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-contentbecomingstale
     */
    ContentBecomingStale() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @remarks
     * This event corresponds to the STREAMBUFFER_EC_STALE_FILE_DELETED event in the Stream Buffer Engine. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/stream-buffer-engine-codes">Stream Buffer Engine Event Codes</a>.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent-stalefiledeleted
     */
    StaleFileDeleted() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidStreamBufferSourceEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CertificateFailure := CallbackCreate(GetMethod(implObj, "CertificateFailure"), flags, 1)
        this.vtbl.CertificateSuccess := CallbackCreate(GetMethod(implObj, "CertificateSuccess"), flags, 1)
        this.vtbl.RatingsBlocked := CallbackCreate(GetMethod(implObj, "RatingsBlocked"), flags, 1)
        this.vtbl.RatingsUnblocked := CallbackCreate(GetMethod(implObj, "RatingsUnblocked"), flags, 1)
        this.vtbl.RatingsChanged := CallbackCreate(GetMethod(implObj, "RatingsChanged"), flags, 1)
        this.vtbl.TimeHole := CallbackCreate(GetMethod(implObj, "TimeHole"), flags, 3)
        this.vtbl.StaleDataRead := CallbackCreate(GetMethod(implObj, "StaleDataRead"), flags, 1)
        this.vtbl.ContentBecomingStale := CallbackCreate(GetMethod(implObj, "ContentBecomingStale"), flags, 1)
        this.vtbl.StaleFileDeleted := CallbackCreate(GetMethod(implObj, "StaleFileDeleted"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CertificateFailure)
        CallbackFree(this.vtbl.CertificateSuccess)
        CallbackFree(this.vtbl.RatingsBlocked)
        CallbackFree(this.vtbl.RatingsUnblocked)
        CallbackFree(this.vtbl.RatingsChanged)
        CallbackFree(this.vtbl.TimeHole)
        CallbackFree(this.vtbl.StaleDataRead)
        CallbackFree(this.vtbl.ContentBecomingStale)
        CallbackFree(this.vtbl.StaleFileDeleted)
    }
}
