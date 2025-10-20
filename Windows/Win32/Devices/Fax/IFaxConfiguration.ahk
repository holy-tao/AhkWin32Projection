#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines various methods that provide configuration options for the fax service.
 * @remarks
 * 
  * A default implementation of this interface is provided by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration">FaxConfiguration</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxconfiguration
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxConfiguration extends IDispatch{
    /**
     * The interface identifier for IFaxConfiguration
     * @type {Guid}
     */
    static IID => Guid("{10f4d0f7-0994-4543-ab6e-506949128c40}")

    /**
     * The class identifier for FaxConfiguration
     * @type {Guid}
     */
    static CLSID => Guid("{5857326f-e7b3-41a7-9c19-a91b463e2d56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbUseArchive 
     * @returns {HRESULT} 
     */
    get_UseArchive(pbUseArchive) {
        result := ComCall(7, this, "ptr", pbUseArchive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseArchive 
     * @returns {HRESULT} 
     */
    put_UseArchive(bUseArchive) {
        result := ComCall(8, this, "short", bUseArchive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrArchiveLocation 
     * @returns {HRESULT} 
     */
    get_ArchiveLocation(pbstrArchiveLocation) {
        result := ComCall(9, this, "ptr", pbstrArchiveLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrArchiveLocation 
     * @returns {HRESULT} 
     */
    put_ArchiveLocation(bstrArchiveLocation) {
        bstrArchiveLocation := bstrArchiveLocation is String ? BSTR.Alloc(bstrArchiveLocation).Value : bstrArchiveLocation

        result := ComCall(10, this, "ptr", bstrArchiveLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbSizeQuotaWarning 
     * @returns {HRESULT} 
     */
    get_SizeQuotaWarning(pbSizeQuotaWarning) {
        result := ComCall(11, this, "ptr", pbSizeQuotaWarning, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSizeQuotaWarning 
     * @returns {HRESULT} 
     */
    put_SizeQuotaWarning(bSizeQuotaWarning) {
        result := ComCall(12, this, "short", bSizeQuotaWarning, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plHighQuotaWaterMark 
     * @returns {HRESULT} 
     */
    get_HighQuotaWaterMark(plHighQuotaWaterMark) {
        result := ComCall(13, this, "int*", plHighQuotaWaterMark, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lHighQuotaWaterMark 
     * @returns {HRESULT} 
     */
    put_HighQuotaWaterMark(lHighQuotaWaterMark) {
        result := ComCall(14, this, "int", lHighQuotaWaterMark, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plLowQuotaWaterMark 
     * @returns {HRESULT} 
     */
    get_LowQuotaWaterMark(plLowQuotaWaterMark) {
        result := ComCall(15, this, "int*", plLowQuotaWaterMark, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLowQuotaWaterMark 
     * @returns {HRESULT} 
     */
    put_LowQuotaWaterMark(lLowQuotaWaterMark) {
        result := ComCall(16, this, "int", lLowQuotaWaterMark, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plArchiveAgeLimit 
     * @returns {HRESULT} 
     */
    get_ArchiveAgeLimit(plArchiveAgeLimit) {
        result := ComCall(17, this, "int*", plArchiveAgeLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lArchiveAgeLimit 
     * @returns {HRESULT} 
     */
    put_ArchiveAgeLimit(lArchiveAgeLimit) {
        result := ComCall(18, this, "int", lArchiveAgeLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSizeLow 
     * @returns {HRESULT} 
     */
    get_ArchiveSizeLow(plSizeLow) {
        result := ComCall(19, this, "int*", plSizeLow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSizeHigh 
     * @returns {HRESULT} 
     */
    get_ArchiveSizeHigh(plSizeHigh) {
        result := ComCall(20, this, "int*", plSizeHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbOutgoingBlocked 
     * @returns {HRESULT} 
     */
    get_OutgoingQueueBlocked(pbOutgoingBlocked) {
        result := ComCall(21, this, "ptr", pbOutgoingBlocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bOutgoingBlocked 
     * @returns {HRESULT} 
     */
    put_OutgoingQueueBlocked(bOutgoingBlocked) {
        result := ComCall(22, this, "short", bOutgoingBlocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbOutgoingPaused 
     * @returns {HRESULT} 
     */
    get_OutgoingQueuePaused(pbOutgoingPaused) {
        result := ComCall(23, this, "ptr", pbOutgoingPaused, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bOutgoingPaused 
     * @returns {HRESULT} 
     */
    put_OutgoingQueuePaused(bOutgoingPaused) {
        result := ComCall(24, this, "short", bOutgoingPaused, "int")
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
        result := ComCall(25, this, "ptr", pbAllowPersonalCoverPages, "int")
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
        result := ComCall(26, this, "short", bAllowPersonalCoverPages, "int")
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
        result := ComCall(27, this, "ptr", pbUseDeviceTSID, "int")
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
        result := ComCall(28, this, "short", bUseDeviceTSID, "int")
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
        result := ComCall(29, this, "int*", plRetries, "int")
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
        result := ComCall(30, this, "int", lRetries, "int")
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
        result := ComCall(31, this, "int*", plRetryDelay, "int")
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
        result := ComCall(32, this, "int", lRetryDelay, "int")
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
        result := ComCall(33, this, "double*", pdateDiscountRateStart, "int")
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
        result := ComCall(34, this, "double", dateDiscountRateStart, "int")
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
        result := ComCall(35, this, "double*", pdateDiscountRateEnd, "int")
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
        result := ComCall(36, this, "double", dateDiscountRateEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plOutgoingQueueAgeLimit 
     * @returns {HRESULT} 
     */
    get_OutgoingQueueAgeLimit(plOutgoingQueueAgeLimit) {
        result := ComCall(37, this, "int*", plOutgoingQueueAgeLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lOutgoingQueueAgeLimit 
     * @returns {HRESULT} 
     */
    put_OutgoingQueueAgeLimit(lOutgoingQueueAgeLimit) {
        result := ComCall(38, this, "int", lOutgoingQueueAgeLimit, "int")
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
        result := ComCall(39, this, "ptr", pbBranding, "int")
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
        result := ComCall(40, this, "short", bBranding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIncomingBlocked 
     * @returns {HRESULT} 
     */
    get_IncomingQueueBlocked(pbIncomingBlocked) {
        result := ComCall(41, this, "ptr", pbIncomingBlocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIncomingBlocked 
     * @returns {HRESULT} 
     */
    put_IncomingQueueBlocked(bIncomingBlocked) {
        result := ComCall(42, this, "short", bIncomingBlocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbAutoCreateAccountOnConnect 
     * @returns {HRESULT} 
     */
    get_AutoCreateAccountOnConnect(pbAutoCreateAccountOnConnect) {
        result := ComCall(43, this, "ptr", pbAutoCreateAccountOnConnect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bAutoCreateAccountOnConnect 
     * @returns {HRESULT} 
     */
    put_AutoCreateAccountOnConnect(bAutoCreateAccountOnConnect) {
        result := ComCall(44, this, "short", bAutoCreateAccountOnConnect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIncomingFaxesArePublic 
     * @returns {HRESULT} 
     */
    get_IncomingFaxesArePublic(pbIncomingFaxesArePublic) {
        result := ComCall(45, this, "ptr", pbIncomingFaxesArePublic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIncomingFaxesArePublic 
     * @returns {HRESULT} 
     */
    put_IncomingFaxesArePublic(bIncomingFaxesArePublic) {
        result := ComCall(46, this, "short", bIncomingFaxesArePublic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(47, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(48, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
