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
     * @type {VARIANT_BOOL} 
     */
    UseArchive {
        get => this.get_UseArchive()
        set => this.put_UseArchive(value)
    }

    /**
     * @type {BSTR} 
     */
    ArchiveLocation {
        get => this.get_ArchiveLocation()
        set => this.put_ArchiveLocation(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SizeQuotaWarning {
        get => this.get_SizeQuotaWarning()
        set => this.put_SizeQuotaWarning(value)
    }

    /**
     * @type {Integer} 
     */
    HighQuotaWaterMark {
        get => this.get_HighQuotaWaterMark()
        set => this.put_HighQuotaWaterMark(value)
    }

    /**
     * @type {Integer} 
     */
    LowQuotaWaterMark {
        get => this.get_LowQuotaWaterMark()
        set => this.put_LowQuotaWaterMark(value)
    }

    /**
     * @type {Integer} 
     */
    ArchiveAgeLimit {
        get => this.get_ArchiveAgeLimit()
        set => this.put_ArchiveAgeLimit(value)
    }

    /**
     * @type {Integer} 
     */
    ArchiveSizeLow {
        get => this.get_ArchiveSizeLow()
    }

    /**
     * @type {Integer} 
     */
    ArchiveSizeHigh {
        get => this.get_ArchiveSizeHigh()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    OutgoingQueueBlocked {
        get => this.get_OutgoingQueueBlocked()
        set => this.put_OutgoingQueueBlocked(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    OutgoingQueuePaused {
        get => this.get_OutgoingQueuePaused()
        set => this.put_OutgoingQueuePaused(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowPersonalCoverPages {
        get => this.get_AllowPersonalCoverPages()
        set => this.put_AllowPersonalCoverPages(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UseDeviceTSID {
        get => this.get_UseDeviceTSID()
        set => this.put_UseDeviceTSID(value)
    }

    /**
     * @type {Integer} 
     */
    Retries {
        get => this.get_Retries()
        set => this.put_Retries(value)
    }

    /**
     * @type {Integer} 
     */
    RetryDelay {
        get => this.get_RetryDelay()
        set => this.put_RetryDelay(value)
    }

    /**
     * @type {Float} 
     */
    DiscountRateStart {
        get => this.get_DiscountRateStart()
        set => this.put_DiscountRateStart(value)
    }

    /**
     * @type {Float} 
     */
    DiscountRateEnd {
        get => this.get_DiscountRateEnd()
        set => this.put_DiscountRateEnd(value)
    }

    /**
     * @type {Integer} 
     */
    OutgoingQueueAgeLimit {
        get => this.get_OutgoingQueueAgeLimit()
        set => this.put_OutgoingQueueAgeLimit(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Branding {
        get => this.get_Branding()
        set => this.put_Branding(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IncomingQueueBlocked {
        get => this.get_IncomingQueueBlocked()
        set => this.put_IncomingQueueBlocked(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AutoCreateAccountOnConnect {
        get => this.get_AutoCreateAccountOnConnect()
        set => this.put_AutoCreateAccountOnConnect(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IncomingFaxesArePublic {
        get => this.get_IncomingFaxesArePublic()
        set => this.put_IncomingFaxesArePublic(value)
    }

    /**
     * Sets or retrieves a value that indicates whether faxes should be archived.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_usearchive
     */
    get_UseArchive() {
        result := ComCall(7, this, "short*", &pbUseArchive := 0, "HRESULT")
        return pbUseArchive
    }

    /**
     * Sets or retrieves a value that indicates whether faxes should be archived.
     * @param {VARIANT_BOOL} bUseArchive 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_usearchive
     */
    put_UseArchive(bUseArchive) {
        result := ComCall(8, this, "short", bUseArchive, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the location of the archive on the server.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_archivelocation
     */
    get_ArchiveLocation() {
        pbstrArchiveLocation := BSTR()
        result := ComCall(9, this, "ptr", pbstrArchiveLocation, "HRESULT")
        return pbstrArchiveLocation
    }

    /**
     * Sets or retrieves a value that indicates the location of the archive on the server.
     * @param {BSTR} bstrArchiveLocation 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_archivelocation
     */
    put_ArchiveLocation(bstrArchiveLocation) {
        bstrArchiveLocation := bstrArchiveLocation is String ? BSTR.Alloc(bstrArchiveLocation).Value : bstrArchiveLocation

        result := ComCall(10, this, "ptr", bstrArchiveLocation, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the size quota warning is turned on.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_sizequotawarning
     */
    get_SizeQuotaWarning() {
        result := ComCall(11, this, "short*", &pbSizeQuotaWarning := 0, "HRESULT")
        return pbSizeQuotaWarning
    }

    /**
     * Sets or retrieves a value that indicates whether the size quota warning is turned on.
     * @param {VARIANT_BOOL} bSizeQuotaWarning 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_sizequotawarning
     */
    put_SizeQuotaWarning(bSizeQuotaWarning) {
        result := ComCall(12, this, "short", bSizeQuotaWarning, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the maximum allotted size of a watermark.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_highquotawatermark
     */
    get_HighQuotaWaterMark() {
        result := ComCall(13, this, "int*", &plHighQuotaWaterMark := 0, "HRESULT")
        return plHighQuotaWaterMark
    }

    /**
     * Sets or retrieves a value that indicates the maximum allotted size of a watermark.
     * @param {Integer} lHighQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_highquotawatermark
     */
    put_HighQuotaWaterMark(lHighQuotaWaterMark) {
        result := ComCall(14, this, "int", lHighQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the minimum size of a watermark.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_lowquotawatermark
     */
    get_LowQuotaWaterMark() {
        result := ComCall(15, this, "int*", &plLowQuotaWaterMark := 0, "HRESULT")
        return plLowQuotaWaterMark
    }

    /**
     * Sets or retrieves a value that indicates the minimum size of a watermark.
     * @param {Integer} lLowQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_lowquotawatermark
     */
    put_LowQuotaWaterMark(lLowQuotaWaterMark) {
        result := ComCall(16, this, "int", lLowQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates how long a fax message is kept on the server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_archiveagelimit
     */
    get_ArchiveAgeLimit() {
        result := ComCall(17, this, "int*", &plArchiveAgeLimit := 0, "HRESULT")
        return plArchiveAgeLimit
    }

    /**
     * Sets or retrieves a value that indicates how long a fax message is kept on the server.
     * @param {Integer} lArchiveAgeLimit 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_archiveagelimit
     */
    put_ArchiveAgeLimit(lArchiveAgeLimit) {
        result := ComCall(18, this, "int", lArchiveAgeLimit, "HRESULT")
        return result
    }

    /**
     * The value that specifies the low-order 32-bit value (in bytes) for the size of the fax message archive.
     * @remarks
     * 
     * Because the archive may exceed 4 gigabytes (GB) in size, the archive size is described using two long values. <b>ArchiveSizeLow</b> is the low 32-bit value of the archive size. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizehigh">ArchiveSizeHigh</a> is the high 32-bit value of the archive size. The size of the archive is: <b>ArchiveSizeLow</b> + 4 GB * <b>ArchiveSizeHigh</b>. 
     * 
     * If both the <b>ArchiveSizeLow</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizehigh">ArchiveSizeHigh</a> properties have the value 0xffffffff, they specify an invalid archive size, and you should ignore both property values.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizelow
     */
    get_ArchiveSizeLow() {
        result := ComCall(19, this, "int*", &plSizeLow := 0, "HRESULT")
        return plSizeLow
    }

    /**
     * The value that specifies the high-order 32-bit value (in bytes) for the size of the fax message archive.
     * @remarks
     * 
     * Because the archive may exceed 4 gigabytes (GB) in size, the archive size is described using two long values. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizelow">ArchiveSizeLow</a> is the low 32-bit value of the archive size. <b>ArchiveSizeHigh</b> is the high 32-bit value of the archive size. The size of the archive is: <b>ArchiveSizeLow</b> + 4 GB * <b>ArchiveSizeHigh</b>. 
     * 
     * If both the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizelow">ArchiveSizeLow</a> and <b>ArchiveSizeHigh</b> properties have the value 0xffffffff, they specify an invalid archive size, and you should ignore both property values.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizehigh
     */
    get_ArchiveSizeHigh() {
        result := ComCall(20, this, "int*", &plSizeHigh := 0, "HRESULT")
        return plSizeHigh
    }

    /**
     * Sets or retrieves a value that indicates whether the fax server queue for outgoing faxes has been blocked.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_outgoingqueueblocked
     */
    get_OutgoingQueueBlocked() {
        result := ComCall(21, this, "short*", &pbOutgoingBlocked := 0, "HRESULT")
        return pbOutgoingBlocked
    }

    /**
     * Sets or retrieves a value that indicates whether the fax server queue for outgoing faxes has been blocked.
     * @param {VARIANT_BOOL} bOutgoingBlocked 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_outgoingqueueblocked
     */
    put_OutgoingQueueBlocked(bOutgoingBlocked) {
        result := ComCall(22, this, "short", bOutgoingBlocked, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the outgoing queue has been paused.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_outgoingqueuepaused
     */
    get_OutgoingQueuePaused() {
        result := ComCall(23, this, "short*", &pbOutgoingPaused := 0, "HRESULT")
        return pbOutgoingPaused
    }

    /**
     * Sets or retrieves a value that indicates whether the outgoing queue has been paused.
     * @param {VARIANT_BOOL} bOutgoingPaused 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_outgoingqueuepaused
     */
    put_OutgoingQueuePaused(bOutgoingPaused) {
        result := ComCall(24, this, "short", bOutgoingPaused, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether personal cover pages are allowed.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_allowpersonalcoverpages
     */
    get_AllowPersonalCoverPages() {
        result := ComCall(25, this, "short*", &pbAllowPersonalCoverPages := 0, "HRESULT")
        return pbAllowPersonalCoverPages
    }

    /**
     * Sets or retrieves a value that indicates whether personal cover pages are allowed.
     * @param {VARIANT_BOOL} bAllowPersonalCoverPages 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_allowpersonalcoverpages
     */
    put_AllowPersonalCoverPages(bAllowPersonalCoverPages) {
        result := ComCall(26, this, "short", bAllowPersonalCoverPages, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the transmitting station identifier (TSID) is used.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_usedevicetsid
     */
    get_UseDeviceTSID() {
        result := ComCall(27, this, "short*", &pbUseDeviceTSID := 0, "HRESULT")
        return pbUseDeviceTSID
    }

    /**
     * Sets or retrieves a value that indicates whether the transmitting station identifier (TSID) is used.
     * @param {VARIANT_BOOL} bUseDeviceTSID 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_usedevicetsid
     */
    put_UseDeviceTSID(bUseDeviceTSID) {
        result := ComCall(28, this, "short", bUseDeviceTSID, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the number of redial attempts for a given fax job.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_retries
     */
    get_Retries() {
        result := ComCall(29, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * Sets or retrieves a value that indicates the number of redial attempts for a given fax job.
     * @param {Integer} lRetries 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_retries
     */
    put_Retries(lRetries) {
        result := ComCall(30, this, "int", lRetries, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the length of time the fax service should wait before retrying a failed fax transmission.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_retrydelay
     */
    get_RetryDelay() {
        result := ComCall(31, this, "int*", &plRetryDelay := 0, "HRESULT")
        return plRetryDelay
    }

    /**
     * Sets or retrieves a value that indicates the length of time the fax service should wait before retrying a failed fax transmission.
     * @param {Integer} lRetryDelay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_retrydelay
     */
    put_RetryDelay(lRetryDelay) {
        result := ComCall(32, this, "int", lRetryDelay, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the time at which the discount rate period begins.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_discountratestart
     */
    get_DiscountRateStart() {
        result := ComCall(33, this, "double*", &pdateDiscountRateStart := 0, "HRESULT")
        return pdateDiscountRateStart
    }

    /**
     * Sets or retrieves a value that indicates the time at which the discount rate period begins.
     * @param {Float} dateDiscountRateStart 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_discountratestart
     */
    put_DiscountRateStart(dateDiscountRateStart) {
        result := ComCall(34, this, "double", dateDiscountRateStart, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the time at which the discount rate period ends.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_discountrateend
     */
    get_DiscountRateEnd() {
        result := ComCall(35, this, "double*", &pdateDiscountRateEnd := 0, "HRESULT")
        return pdateDiscountRateEnd
    }

    /**
     * Sets or retrieves a value that indicates the time at which the discount rate period ends.
     * @param {Float} dateDiscountRateEnd 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_discountrateend
     */
    put_DiscountRateEnd(dateDiscountRateEnd) {
        result := ComCall(36, this, "double", dateDiscountRateEnd, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the length of time that an undeliverable fax message is kept on the fax server before it is deleted.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_outgoingqueueagelimit
     */
    get_OutgoingQueueAgeLimit() {
        result := ComCall(37, this, "int*", &plOutgoingQueueAgeLimit := 0, "HRESULT")
        return plOutgoingQueueAgeLimit
    }

    /**
     * Sets or retrieves a value that indicates the length of time that an undeliverable fax message is kept on the fax server before it is deleted.
     * @param {Integer} lOutgoingQueueAgeLimit 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_outgoingqueueagelimit
     */
    put_OutgoingQueueAgeLimit(lOutgoingQueueAgeLimit) {
        result := ComCall(38, this, "int", lOutgoingQueueAgeLimit, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the fax server generates a branding mark on outgoing faxes.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_branding
     */
    get_Branding() {
        result := ComCall(39, this, "short*", &pbBranding := 0, "HRESULT")
        return pbBranding
    }

    /**
     * Sets or retrieves a value that indicates whether the fax server generates a branding mark on outgoing faxes.
     * @param {VARIANT_BOOL} bBranding 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_branding
     */
    put_Branding(bBranding) {
        result := ComCall(40, this, "short", bBranding, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the fax server queue for incoming faxes has been blocked.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_incomingqueueblocked
     */
    get_IncomingQueueBlocked() {
        result := ComCall(41, this, "short*", &pbIncomingBlocked := 0, "HRESULT")
        return pbIncomingBlocked
    }

    /**
     * Sets or retrieves a value that indicates whether the fax server queue for incoming faxes has been blocked.
     * @param {VARIANT_BOOL} bIncomingBlocked 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_incomingqueueblocked
     */
    put_IncomingQueueBlocked(bIncomingBlocked) {
        result := ComCall(42, this, "short", bIncomingBlocked, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the server automatically creates a fax account once a connection is initiated.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_autocreateaccountonconnect
     */
    get_AutoCreateAccountOnConnect() {
        result := ComCall(43, this, "short*", &pbAutoCreateAccountOnConnect := 0, "HRESULT")
        return pbAutoCreateAccountOnConnect
    }

    /**
     * Sets or retrieves a value that indicates whether the server automatically creates a fax account once a connection is initiated.
     * @param {VARIANT_BOOL} bAutoCreateAccountOnConnect 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_autocreateaccountonconnect
     */
    put_AutoCreateAccountOnConnect(bAutoCreateAccountOnConnect) {
        result := ComCall(44, this, "short", bAutoCreateAccountOnConnect, "HRESULT")
        return result
    }

    /**
     * Indicates whether incoming faxes are either viewable by everyone or private.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-get_incomingfaxesarepublic
     */
    get_IncomingFaxesArePublic() {
        result := ComCall(45, this, "short*", &pbIncomingFaxesArePublic := 0, "HRESULT")
        return pbIncomingFaxesArePublic
    }

    /**
     * Indicates whether incoming faxes are either viewable by everyone or private.
     * @param {VARIANT_BOOL} bIncomingFaxesArePublic 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-put_incomingfaxesarepublic
     */
    put_IncomingFaxesArePublic(bIncomingFaxesArePublic) {
        result := ComCall(46, this, "short", bIncomingFaxesArePublic, "HRESULT")
        return result
    }

    /**
     * Refreshes the object.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-refresh
     */
    Refresh() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * Saves the object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxconfiguration-save
     */
    Save() {
        result := ComCall(48, this, "HRESULT")
        return result
    }
}
