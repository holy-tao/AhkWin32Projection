#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxOutgoingJobs.ahk
#Include .\IFaxOutgoingJob.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutgoingQueue interface defines a FaxOutgoingQueue configuration object used by a fax client application to set and retrieve the configuration parameters on the outbound fax queue on a fax server.
 * @remarks
 * 
  * A default implementation of <b>IFaxOutgoingQueue</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingqueue">FaxOutgoingQueue</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutgoingqueue
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutgoingQueue extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxOutgoingQueue
     * @type {Guid}
     */
    static IID => Guid("{80b1df24-d9ac-4333-b373-487cedc80ce5}")

    /**
     * The class identifier for FaxOutgoingQueue
     * @type {Guid}
     */
    static CLSID => Guid("{7421169e-8c43-4b0d-bb16-645c8fa40357}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Blocked", "put_Blocked", "get_Paused", "put_Paused", "get_AllowPersonalCoverPages", "put_AllowPersonalCoverPages", "get_UseDeviceTSID", "put_UseDeviceTSID", "get_Retries", "put_Retries", "get_RetryDelay", "put_RetryDelay", "get_DiscountRateStart", "put_DiscountRateStart", "get_DiscountRateEnd", "put_DiscountRateEnd", "get_AgeLimit", "put_AgeLimit", "get_Branding", "put_Branding", "Refresh", "Save", "GetJobs", "GetJob"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_blocked
     */
    get_Blocked() {
        result := ComCall(7, this, "short*", &pbBlocked := 0, "HRESULT")
        return pbBlocked
    }

    /**
     * 
     * @param {VARIANT_BOOL} bBlocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_blocked
     */
    put_Blocked(bBlocked) {
        result := ComCall(8, this, "short", bBlocked, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_paused
     */
    get_Paused() {
        result := ComCall(9, this, "short*", &pbPaused := 0, "HRESULT")
        return pbPaused
    }

    /**
     * 
     * @param {VARIANT_BOOL} bPaused 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_paused
     */
    put_Paused(bPaused) {
        result := ComCall(10, this, "short", bPaused, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_allowpersonalcoverpages
     */
    get_AllowPersonalCoverPages() {
        result := ComCall(11, this, "short*", &pbAllowPersonalCoverPages := 0, "HRESULT")
        return pbAllowPersonalCoverPages
    }

    /**
     * 
     * @param {VARIANT_BOOL} bAllowPersonalCoverPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_allowpersonalcoverpages
     */
    put_AllowPersonalCoverPages(bAllowPersonalCoverPages) {
        result := ComCall(12, this, "short", bAllowPersonalCoverPages, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_usedevicetsid
     */
    get_UseDeviceTSID() {
        result := ComCall(13, this, "short*", &pbUseDeviceTSID := 0, "HRESULT")
        return pbUseDeviceTSID
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseDeviceTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_usedevicetsid
     */
    put_UseDeviceTSID(bUseDeviceTSID) {
        result := ComCall(14, this, "short", bUseDeviceTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_retries
     */
    get_Retries() {
        result := ComCall(15, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * 
     * @param {Integer} lRetries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_retries
     */
    put_Retries(lRetries) {
        result := ComCall(16, this, "int", lRetries, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_retrydelay
     */
    get_RetryDelay() {
        result := ComCall(17, this, "int*", &plRetryDelay := 0, "HRESULT")
        return plRetryDelay
    }

    /**
     * 
     * @param {Integer} lRetryDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_retrydelay
     */
    put_RetryDelay(lRetryDelay) {
        result := ComCall(18, this, "int", lRetryDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_discountratestart
     */
    get_DiscountRateStart() {
        result := ComCall(19, this, "double*", &pdateDiscountRateStart := 0, "HRESULT")
        return pdateDiscountRateStart
    }

    /**
     * 
     * @param {Float} dateDiscountRateStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_discountratestart
     */
    put_DiscountRateStart(dateDiscountRateStart) {
        result := ComCall(20, this, "double", dateDiscountRateStart, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_discountrateend
     */
    get_DiscountRateEnd() {
        result := ComCall(21, this, "double*", &pdateDiscountRateEnd := 0, "HRESULT")
        return pdateDiscountRateEnd
    }

    /**
     * 
     * @param {Float} dateDiscountRateEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_discountrateend
     */
    put_DiscountRateEnd(dateDiscountRateEnd) {
        result := ComCall(22, this, "double", dateDiscountRateEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_agelimit
     */
    get_AgeLimit() {
        result := ComCall(23, this, "int*", &plAgeLimit := 0, "HRESULT")
        return plAgeLimit
    }

    /**
     * 
     * @param {Integer} lAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_agelimit
     */
    put_AgeLimit(lAgeLimit) {
        result := ComCall(24, this, "int", lAgeLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_branding
     */
    get_Branding() {
        result := ComCall(25, this, "short*", &pbBranding := 0, "HRESULT")
        return pbBranding
    }

    /**
     * 
     * @param {VARIANT_BOOL} bBranding 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_branding
     */
    put_Branding(bBranding) {
        result := ComCall(26, this, "short", bBranding, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-refresh
     */
    Refresh() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-save
     */
    Save() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IFaxOutgoingJobs} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-getjobs
     */
    GetJobs() {
        result := ComCall(29, this, "ptr*", &pFaxOutgoingJobs := 0, "HRESULT")
        return IFaxOutgoingJobs(pFaxOutgoingJobs)
    }

    /**
     * 
     * @param {BSTR} bstrJobId 
     * @returns {IFaxOutgoingJob} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-getjob
     */
    GetJob(bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(30, this, "ptr", bstrJobId, "ptr*", &pFaxOutgoingJob := 0, "HRESULT")
        return IFaxOutgoingJob(pFaxOutgoingJob)
    }
}
