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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UseArchive", "put_UseArchive", "get_ArchiveLocation", "put_ArchiveLocation", "get_SizeQuotaWarning", "put_SizeQuotaWarning", "get_HighQuotaWaterMark", "put_HighQuotaWaterMark", "get_LowQuotaWaterMark", "put_LowQuotaWaterMark", "get_ArchiveAgeLimit", "put_ArchiveAgeLimit", "get_ArchiveSizeLow", "get_ArchiveSizeHigh", "get_OutgoingQueueBlocked", "put_OutgoingQueueBlocked", "get_OutgoingQueuePaused", "put_OutgoingQueuePaused", "get_AllowPersonalCoverPages", "put_AllowPersonalCoverPages", "get_UseDeviceTSID", "put_UseDeviceTSID", "get_Retries", "put_Retries", "get_RetryDelay", "put_RetryDelay", "get_DiscountRateStart", "put_DiscountRateStart", "get_DiscountRateEnd", "put_DiscountRateEnd", "get_OutgoingQueueAgeLimit", "put_OutgoingQueueAgeLimit", "get_Branding", "put_Branding", "get_IncomingQueueBlocked", "put_IncomingQueueBlocked", "get_AutoCreateAccountOnConnect", "put_AutoCreateAccountOnConnect", "get_IncomingFaxesArePublic", "put_IncomingFaxesArePublic", "Refresh", "Save"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbUseArchive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_usearchive
     */
    get_UseArchive(pbUseArchive) {
        result := ComCall(7, this, "ptr", pbUseArchive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseArchive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_usearchive
     */
    put_UseArchive(bUseArchive) {
        result := ComCall(8, this, "short", bUseArchive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrArchiveLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivelocation
     */
    get_ArchiveLocation(pbstrArchiveLocation) {
        result := ComCall(9, this, "ptr", pbstrArchiveLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrArchiveLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_archivelocation
     */
    put_ArchiveLocation(bstrArchiveLocation) {
        bstrArchiveLocation := bstrArchiveLocation is String ? BSTR.Alloc(bstrArchiveLocation).Value : bstrArchiveLocation

        result := ComCall(10, this, "ptr", bstrArchiveLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbSizeQuotaWarning 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_sizequotawarning
     */
    get_SizeQuotaWarning(pbSizeQuotaWarning) {
        result := ComCall(11, this, "ptr", pbSizeQuotaWarning, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSizeQuotaWarning 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_sizequotawarning
     */
    put_SizeQuotaWarning(bSizeQuotaWarning) {
        result := ComCall(12, this, "short", bSizeQuotaWarning, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plHighQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_highquotawatermark
     */
    get_HighQuotaWaterMark(plHighQuotaWaterMark) {
        result := ComCall(13, this, "int*", plHighQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lHighQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_highquotawatermark
     */
    put_HighQuotaWaterMark(lHighQuotaWaterMark) {
        result := ComCall(14, this, "int", lHighQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plLowQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_lowquotawatermark
     */
    get_LowQuotaWaterMark(plLowQuotaWaterMark) {
        result := ComCall(15, this, "int*", plLowQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLowQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_lowquotawatermark
     */
    put_LowQuotaWaterMark(lLowQuotaWaterMark) {
        result := ComCall(16, this, "int", lLowQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plArchiveAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archiveagelimit
     */
    get_ArchiveAgeLimit(plArchiveAgeLimit) {
        result := ComCall(17, this, "int*", plArchiveAgeLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lArchiveAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_archiveagelimit
     */
    put_ArchiveAgeLimit(lArchiveAgeLimit) {
        result := ComCall(18, this, "int", lArchiveAgeLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSizeLow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizelow
     */
    get_ArchiveSizeLow(plSizeLow) {
        result := ComCall(19, this, "int*", plSizeLow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSizeHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizehigh
     */
    get_ArchiveSizeHigh(plSizeHigh) {
        result := ComCall(20, this, "int*", plSizeHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbOutgoingBlocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_outgoingqueueblocked
     */
    get_OutgoingQueueBlocked(pbOutgoingBlocked) {
        result := ComCall(21, this, "ptr", pbOutgoingBlocked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bOutgoingBlocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_outgoingqueueblocked
     */
    put_OutgoingQueueBlocked(bOutgoingBlocked) {
        result := ComCall(22, this, "short", bOutgoingBlocked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbOutgoingPaused 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_outgoingqueuepaused
     */
    get_OutgoingQueuePaused(pbOutgoingPaused) {
        result := ComCall(23, this, "ptr", pbOutgoingPaused, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bOutgoingPaused 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_outgoingqueuepaused
     */
    put_OutgoingQueuePaused(bOutgoingPaused) {
        result := ComCall(24, this, "short", bOutgoingPaused, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbAllowPersonalCoverPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_allowpersonalcoverpages
     */
    get_AllowPersonalCoverPages(pbAllowPersonalCoverPages) {
        result := ComCall(25, this, "ptr", pbAllowPersonalCoverPages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bAllowPersonalCoverPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_allowpersonalcoverpages
     */
    put_AllowPersonalCoverPages(bAllowPersonalCoverPages) {
        result := ComCall(26, this, "short", bAllowPersonalCoverPages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbUseDeviceTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_usedevicetsid
     */
    get_UseDeviceTSID(pbUseDeviceTSID) {
        result := ComCall(27, this, "ptr", pbUseDeviceTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseDeviceTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_usedevicetsid
     */
    put_UseDeviceTSID(bUseDeviceTSID) {
        result := ComCall(28, this, "short", bUseDeviceTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRetries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_retries
     */
    get_Retries(plRetries) {
        result := ComCall(29, this, "int*", plRetries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRetries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_retries
     */
    put_Retries(lRetries) {
        result := ComCall(30, this, "int", lRetries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRetryDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_retrydelay
     */
    get_RetryDelay(plRetryDelay) {
        result := ComCall(31, this, "int*", plRetryDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRetryDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_retrydelay
     */
    put_RetryDelay(lRetryDelay) {
        result := ComCall(32, this, "int", lRetryDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateDiscountRateStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_discountratestart
     */
    get_DiscountRateStart(pdateDiscountRateStart) {
        result := ComCall(33, this, "double*", pdateDiscountRateStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dateDiscountRateStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_discountratestart
     */
    put_DiscountRateStart(dateDiscountRateStart) {
        result := ComCall(34, this, "double", dateDiscountRateStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateDiscountRateEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_discountrateend
     */
    get_DiscountRateEnd(pdateDiscountRateEnd) {
        result := ComCall(35, this, "double*", pdateDiscountRateEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dateDiscountRateEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_discountrateend
     */
    put_DiscountRateEnd(dateDiscountRateEnd) {
        result := ComCall(36, this, "double", dateDiscountRateEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plOutgoingQueueAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_outgoingqueueagelimit
     */
    get_OutgoingQueueAgeLimit(plOutgoingQueueAgeLimit) {
        result := ComCall(37, this, "int*", plOutgoingQueueAgeLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lOutgoingQueueAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_outgoingqueueagelimit
     */
    put_OutgoingQueueAgeLimit(lOutgoingQueueAgeLimit) {
        result := ComCall(38, this, "int", lOutgoingQueueAgeLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbBranding 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_branding
     */
    get_Branding(pbBranding) {
        result := ComCall(39, this, "ptr", pbBranding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bBranding 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_branding
     */
    put_Branding(bBranding) {
        result := ComCall(40, this, "short", bBranding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIncomingBlocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_incomingqueueblocked
     */
    get_IncomingQueueBlocked(pbIncomingBlocked) {
        result := ComCall(41, this, "ptr", pbIncomingBlocked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIncomingBlocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_incomingqueueblocked
     */
    put_IncomingQueueBlocked(bIncomingBlocked) {
        result := ComCall(42, this, "short", bIncomingBlocked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbAutoCreateAccountOnConnect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_autocreateaccountonconnect
     */
    get_AutoCreateAccountOnConnect(pbAutoCreateAccountOnConnect) {
        result := ComCall(43, this, "ptr", pbAutoCreateAccountOnConnect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bAutoCreateAccountOnConnect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_autocreateaccountonconnect
     */
    put_AutoCreateAccountOnConnect(bAutoCreateAccountOnConnect) {
        result := ComCall(44, this, "short", bAutoCreateAccountOnConnect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIncomingFaxesArePublic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_incomingfaxesarepublic
     */
    get_IncomingFaxesArePublic(pbIncomingFaxesArePublic) {
        result := ComCall(45, this, "ptr", pbIncomingFaxesArePublic, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIncomingFaxesArePublic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_incomingfaxesarepublic
     */
    put_IncomingFaxesArePublic(bIncomingFaxesArePublic) {
        result := ComCall(46, this, "short", bIncomingFaxesArePublic, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-refresh
     */
    Refresh() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-save
     */
    Save() {
        result := ComCall(48, this, "HRESULT")
        return result
    }
}
