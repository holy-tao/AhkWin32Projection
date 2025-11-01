#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<VARIANT_BOOL>} pbBlocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_blocked
     */
    get_Blocked(pbBlocked) {
        result := ComCall(7, this, "ptr", pbBlocked, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pbPaused 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_paused
     */
    get_Paused(pbPaused) {
        result := ComCall(9, this, "ptr", pbPaused, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pbAllowPersonalCoverPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_allowpersonalcoverpages
     */
    get_AllowPersonalCoverPages(pbAllowPersonalCoverPages) {
        result := ComCall(11, this, "ptr", pbAllowPersonalCoverPages, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pbUseDeviceTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_usedevicetsid
     */
    get_UseDeviceTSID(pbUseDeviceTSID) {
        result := ComCall(13, this, "ptr", pbUseDeviceTSID, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plRetries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_retries
     */
    get_Retries(plRetries) {
        result := ComCall(15, this, "int*", plRetries, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plRetryDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_retrydelay
     */
    get_RetryDelay(plRetryDelay) {
        result := ComCall(17, this, "int*", plRetryDelay, "HRESULT")
        return result
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
     * @param {Pointer<Float>} pdateDiscountRateStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_discountratestart
     */
    get_DiscountRateStart(pdateDiscountRateStart) {
        result := ComCall(19, this, "double*", pdateDiscountRateStart, "HRESULT")
        return result
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
     * @param {Pointer<Float>} pdateDiscountRateEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_discountrateend
     */
    get_DiscountRateEnd(pdateDiscountRateEnd) {
        result := ComCall(21, this, "double*", pdateDiscountRateEnd, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_agelimit
     */
    get_AgeLimit(plAgeLimit) {
        result := ComCall(23, this, "int*", plAgeLimit, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pbBranding 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_branding
     */
    get_Branding(pbBranding) {
        result := ComCall(25, this, "ptr", pbBranding, "HRESULT")
        return result
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
     * @param {Pointer<IFaxOutgoingJobs>} pFaxOutgoingJobs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-getjobs
     */
    GetJobs(pFaxOutgoingJobs) {
        result := ComCall(29, this, "ptr*", pFaxOutgoingJobs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrJobId 
     * @param {Pointer<IFaxOutgoingJob>} pFaxOutgoingJob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-getjob
     */
    GetJob(bstrJobId, pFaxOutgoingJob) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(30, this, "ptr", bstrJobId, "ptr*", pFaxOutgoingJob, "HRESULT")
        return result
    }
}
