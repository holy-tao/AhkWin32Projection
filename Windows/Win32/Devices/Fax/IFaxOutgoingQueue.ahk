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
     * 
     * @param {Pointer<VARIANT_BOOL>} pbBlocked 
     * @returns {HRESULT} 
     */
    get_Blocked(pbBlocked) {
        result := ComCall(7, this, "ptr", pbBlocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bBlocked 
     * @returns {HRESULT} 
     */
    put_Blocked(bBlocked) {
        result := ComCall(8, this, "short", bBlocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbPaused 
     * @returns {HRESULT} 
     */
    get_Paused(pbPaused) {
        result := ComCall(9, this, "ptr", pbPaused, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bPaused 
     * @returns {HRESULT} 
     */
    put_Paused(bPaused) {
        result := ComCall(10, this, "short", bPaused, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbAllowPersonalCoverPages 
     * @returns {HRESULT} 
     */
    get_AllowPersonalCoverPages(pbAllowPersonalCoverPages) {
        result := ComCall(11, this, "ptr", pbAllowPersonalCoverPages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bAllowPersonalCoverPages 
     * @returns {HRESULT} 
     */
    put_AllowPersonalCoverPages(bAllowPersonalCoverPages) {
        result := ComCall(12, this, "short", bAllowPersonalCoverPages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbUseDeviceTSID 
     * @returns {HRESULT} 
     */
    get_UseDeviceTSID(pbUseDeviceTSID) {
        result := ComCall(13, this, "ptr", pbUseDeviceTSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseDeviceTSID 
     * @returns {HRESULT} 
     */
    put_UseDeviceTSID(bUseDeviceTSID) {
        result := ComCall(14, this, "short", bUseDeviceTSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRetries 
     * @returns {HRESULT} 
     */
    get_Retries(plRetries) {
        result := ComCall(15, this, "int*", plRetries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRetries 
     * @returns {HRESULT} 
     */
    put_Retries(lRetries) {
        result := ComCall(16, this, "int", lRetries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRetryDelay 
     * @returns {HRESULT} 
     */
    get_RetryDelay(plRetryDelay) {
        result := ComCall(17, this, "int*", plRetryDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRetryDelay 
     * @returns {HRESULT} 
     */
    put_RetryDelay(lRetryDelay) {
        result := ComCall(18, this, "int", lRetryDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateDiscountRateStart 
     * @returns {HRESULT} 
     */
    get_DiscountRateStart(pdateDiscountRateStart) {
        result := ComCall(19, this, "double*", pdateDiscountRateStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dateDiscountRateStart 
     * @returns {HRESULT} 
     */
    put_DiscountRateStart(dateDiscountRateStart) {
        result := ComCall(20, this, "double", dateDiscountRateStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateDiscountRateEnd 
     * @returns {HRESULT} 
     */
    get_DiscountRateEnd(pdateDiscountRateEnd) {
        result := ComCall(21, this, "double*", pdateDiscountRateEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dateDiscountRateEnd 
     * @returns {HRESULT} 
     */
    put_DiscountRateEnd(dateDiscountRateEnd) {
        result := ComCall(22, this, "double", dateDiscountRateEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAgeLimit 
     * @returns {HRESULT} 
     */
    get_AgeLimit(plAgeLimit) {
        result := ComCall(23, this, "int*", plAgeLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lAgeLimit 
     * @returns {HRESULT} 
     */
    put_AgeLimit(lAgeLimit) {
        result := ComCall(24, this, "int", lAgeLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbBranding 
     * @returns {HRESULT} 
     */
    get_Branding(pbBranding) {
        result := ComCall(25, this, "ptr", pbBranding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bBranding 
     * @returns {HRESULT} 
     */
    put_Branding(bBranding) {
        result := ComCall(26, this, "short", bBranding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(27, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(28, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxOutgoingJobs>} pFaxOutgoingJobs 
     * @returns {HRESULT} 
     */
    GetJobs(pFaxOutgoingJobs) {
        result := ComCall(29, this, "ptr", pFaxOutgoingJobs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrJobId 
     * @param {Pointer<IFaxOutgoingJob>} pFaxOutgoingJob 
     * @returns {HRESULT} 
     */
    GetJob(bstrJobId, pFaxOutgoingJob) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(30, this, "ptr", bstrJobId, "ptr", pFaxOutgoingJob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
