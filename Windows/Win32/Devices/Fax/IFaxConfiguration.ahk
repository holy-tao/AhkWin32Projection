#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Defines various methods that provide configuration options for the fax service.
 * @remarks
 * A default implementation of this interface is provided by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration">FaxConfiguration</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxconfiguration
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxConfiguration extends IDispatch {
    /**
     * The interface identifier for IFaxConfiguration
     * @type {Guid}
     */
    static IID := Guid("{10f4d0f7-0994-4543-ab6e-506949128c40}")

    /**
     * The class identifier for FaxConfiguration
     * @type {Guid}
     */
    static CLSID := Guid("{5857326f-e7b3-41a7-9c19-a91b463e2d56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxConfiguration interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_UseArchive                 : IntPtr
        put_UseArchive                 : IntPtr
        get_ArchiveLocation            : IntPtr
        put_ArchiveLocation            : IntPtr
        get_SizeQuotaWarning           : IntPtr
        put_SizeQuotaWarning           : IntPtr
        get_HighQuotaWaterMark         : IntPtr
        put_HighQuotaWaterMark         : IntPtr
        get_LowQuotaWaterMark          : IntPtr
        put_LowQuotaWaterMark          : IntPtr
        get_ArchiveAgeLimit            : IntPtr
        put_ArchiveAgeLimit            : IntPtr
        get_ArchiveSizeLow             : IntPtr
        get_ArchiveSizeHigh            : IntPtr
        get_OutgoingQueueBlocked       : IntPtr
        put_OutgoingQueueBlocked       : IntPtr
        get_OutgoingQueuePaused        : IntPtr
        put_OutgoingQueuePaused        : IntPtr
        get_AllowPersonalCoverPages    : IntPtr
        put_AllowPersonalCoverPages    : IntPtr
        get_UseDeviceTSID              : IntPtr
        put_UseDeviceTSID              : IntPtr
        get_Retries                    : IntPtr
        put_Retries                    : IntPtr
        get_RetryDelay                 : IntPtr
        put_RetryDelay                 : IntPtr
        get_DiscountRateStart          : IntPtr
        put_DiscountRateStart          : IntPtr
        get_DiscountRateEnd            : IntPtr
        put_DiscountRateEnd            : IntPtr
        get_OutgoingQueueAgeLimit      : IntPtr
        put_OutgoingQueueAgeLimit      : IntPtr
        get_Branding                   : IntPtr
        put_Branding                   : IntPtr
        get_IncomingQueueBlocked       : IntPtr
        put_IncomingQueueBlocked       : IntPtr
        get_AutoCreateAccountOnConnect : IntPtr
        put_AutoCreateAccountOnConnect : IntPtr
        get_IncomingFaxesArePublic     : IntPtr
        put_IncomingFaxesArePublic     : IntPtr
        Refresh                        : IntPtr
        Save                           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxConfiguration.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Sets or retrieves a value that indicates whether faxes should be archived. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_usearchive
     */
    get_UseArchive() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pbUseArchive := 0, "HRESULT")
        return pbUseArchive
    }

    /**
     * Sets or retrieves a value that indicates whether faxes should be archived. (Put)
     * @param {VARIANT_BOOL} bUseArchive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_usearchive
     */
    put_UseArchive(bUseArchive) {
        result := ComCall(8, this, VARIANT_BOOL, bUseArchive, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the location of the archive on the server. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivelocation
     */
    get_ArchiveLocation() {
        pbstrArchiveLocation := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrArchiveLocation, "HRESULT")
        return pbstrArchiveLocation
    }

    /**
     * Sets or retrieves a value that indicates the location of the archive on the server. (Put)
     * @param {BSTR} bstrArchiveLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_archivelocation
     */
    put_ArchiveLocation(bstrArchiveLocation) {
        bstrArchiveLocation := bstrArchiveLocation is String ? BSTR.Alloc(bstrArchiveLocation).Value : bstrArchiveLocation

        result := ComCall(10, this, BSTR, bstrArchiveLocation, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the size quota warning is turned on. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_sizequotawarning
     */
    get_SizeQuotaWarning() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &pbSizeQuotaWarning := 0, "HRESULT")
        return pbSizeQuotaWarning
    }

    /**
     * Sets or retrieves a value that indicates whether the size quota warning is turned on. (Put)
     * @param {VARIANT_BOOL} bSizeQuotaWarning 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_sizequotawarning
     */
    put_SizeQuotaWarning(bSizeQuotaWarning) {
        result := ComCall(12, this, VARIANT_BOOL, bSizeQuotaWarning, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the maximum allotted size of a watermark. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_highquotawatermark
     */
    get_HighQuotaWaterMark() {
        result := ComCall(13, this, "int*", &plHighQuotaWaterMark := 0, "HRESULT")
        return plHighQuotaWaterMark
    }

    /**
     * Sets or retrieves a value that indicates the maximum allotted size of a watermark. (Put)
     * @param {Integer} lHighQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_highquotawatermark
     */
    put_HighQuotaWaterMark(lHighQuotaWaterMark) {
        result := ComCall(14, this, "int", lHighQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the minimum size of a watermark. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_lowquotawatermark
     */
    get_LowQuotaWaterMark() {
        result := ComCall(15, this, "int*", &plLowQuotaWaterMark := 0, "HRESULT")
        return plLowQuotaWaterMark
    }

    /**
     * Sets or retrieves a value that indicates the minimum size of a watermark. (Put)
     * @param {Integer} lLowQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_lowquotawatermark
     */
    put_LowQuotaWaterMark(lLowQuotaWaterMark) {
        result := ComCall(16, this, "int", lLowQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates how long a fax message is kept on the server. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archiveagelimit
     */
    get_ArchiveAgeLimit() {
        result := ComCall(17, this, "int*", &plArchiveAgeLimit := 0, "HRESULT")
        return plArchiveAgeLimit
    }

    /**
     * Sets or retrieves a value that indicates how long a fax message is kept on the server. (Put)
     * @param {Integer} lArchiveAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_archiveagelimit
     */
    put_ArchiveAgeLimit(lArchiveAgeLimit) {
        result := ComCall(18, this, "int", lArchiveAgeLimit, "HRESULT")
        return result
    }

    /**
     * The value that specifies the low-order 32-bit value (in bytes) for the size of the fax message archive.
     * @remarks
     * Because the archive may exceed 4 gigabytes (GB) in size, the archive size is described using two long values. <b>ArchiveSizeLow</b> is the low 32-bit value of the archive size. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizehigh">ArchiveSizeHigh</a> is the high 32-bit value of the archive size. The size of the archive is: <b>ArchiveSizeLow</b> + 4 GB * <b>ArchiveSizeHigh</b>. 
     * 
     * If both the <b>ArchiveSizeLow</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizehigh">ArchiveSizeHigh</a> properties have the value 0xffffffff, they specify an invalid archive size, and you should ignore both property values.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizelow
     */
    get_ArchiveSizeLow() {
        result := ComCall(19, this, "int*", &plSizeLow := 0, "HRESULT")
        return plSizeLow
    }

    /**
     * The value that specifies the high-order 32-bit value (in bytes) for the size of the fax message archive.
     * @remarks
     * Because the archive may exceed 4 gigabytes (GB) in size, the archive size is described using two long values. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizelow">ArchiveSizeLow</a> is the low 32-bit value of the archive size. <b>ArchiveSizeHigh</b> is the high 32-bit value of the archive size. The size of the archive is: <b>ArchiveSizeLow</b> + 4 GB * <b>ArchiveSizeHigh</b>. 
     * 
     * If both the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizelow">ArchiveSizeLow</a> and <b>ArchiveSizeHigh</b> properties have the value 0xffffffff, they specify an invalid archive size, and you should ignore both property values.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_archivesizehigh
     */
    get_ArchiveSizeHigh() {
        result := ComCall(20, this, "int*", &plSizeHigh := 0, "HRESULT")
        return plSizeHigh
    }

    /**
     * Sets or retrieves a value that indicates whether the fax server queue for outgoing faxes has been blocked. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_outgoingqueueblocked
     */
    get_OutgoingQueueBlocked() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &pbOutgoingBlocked := 0, "HRESULT")
        return pbOutgoingBlocked
    }

    /**
     * Sets or retrieves a value that indicates whether the fax server queue for outgoing faxes has been blocked. (Put)
     * @param {VARIANT_BOOL} bOutgoingBlocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_outgoingqueueblocked
     */
    put_OutgoingQueueBlocked(bOutgoingBlocked) {
        result := ComCall(22, this, VARIANT_BOOL, bOutgoingBlocked, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the outgoing queue has been paused. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_outgoingqueuepaused
     */
    get_OutgoingQueuePaused() {
        result := ComCall(23, this, VARIANT_BOOL.Ptr, &pbOutgoingPaused := 0, "HRESULT")
        return pbOutgoingPaused
    }

    /**
     * Sets or retrieves a value that indicates whether the outgoing queue has been paused. (Put)
     * @param {VARIANT_BOOL} bOutgoingPaused 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_outgoingqueuepaused
     */
    put_OutgoingQueuePaused(bOutgoingPaused) {
        result := ComCall(24, this, VARIANT_BOOL, bOutgoingPaused, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether personal cover pages are allowed. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_allowpersonalcoverpages
     */
    get_AllowPersonalCoverPages() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &pbAllowPersonalCoverPages := 0, "HRESULT")
        return pbAllowPersonalCoverPages
    }

    /**
     * Sets or retrieves a value that indicates whether personal cover pages are allowed. (Put)
     * @param {VARIANT_BOOL} bAllowPersonalCoverPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_allowpersonalcoverpages
     */
    put_AllowPersonalCoverPages(bAllowPersonalCoverPages) {
        result := ComCall(26, this, VARIANT_BOOL, bAllowPersonalCoverPages, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the transmitting station identifier (TSID) is used. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_usedevicetsid
     */
    get_UseDeviceTSID() {
        result := ComCall(27, this, VARIANT_BOOL.Ptr, &pbUseDeviceTSID := 0, "HRESULT")
        return pbUseDeviceTSID
    }

    /**
     * Sets or retrieves a value that indicates whether the transmitting station identifier (TSID) is used. (Put)
     * @param {VARIANT_BOOL} bUseDeviceTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_usedevicetsid
     */
    put_UseDeviceTSID(bUseDeviceTSID) {
        result := ComCall(28, this, VARIANT_BOOL, bUseDeviceTSID, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the number of redial attempts for a given fax job. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_retries
     */
    get_Retries() {
        result := ComCall(29, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * Sets or retrieves a value that indicates the number of redial attempts for a given fax job. (Put)
     * @param {Integer} lRetries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_retries
     */
    put_Retries(lRetries) {
        result := ComCall(30, this, "int", lRetries, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the length of time the fax service should wait before retrying a failed fax transmission. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_retrydelay
     */
    get_RetryDelay() {
        result := ComCall(31, this, "int*", &plRetryDelay := 0, "HRESULT")
        return plRetryDelay
    }

    /**
     * Sets or retrieves a value that indicates the length of time the fax service should wait before retrying a failed fax transmission. (Put)
     * @param {Integer} lRetryDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_retrydelay
     */
    put_RetryDelay(lRetryDelay) {
        result := ComCall(32, this, "int", lRetryDelay, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the time at which the discount rate period begins. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_discountratestart
     */
    get_DiscountRateStart() {
        result := ComCall(33, this, "double*", &pdateDiscountRateStart := 0, "HRESULT")
        return pdateDiscountRateStart
    }

    /**
     * Sets or retrieves a value that indicates the time at which the discount rate period begins. (Put)
     * @param {Float} dateDiscountRateStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_discountratestart
     */
    put_DiscountRateStart(dateDiscountRateStart) {
        result := ComCall(34, this, "double", dateDiscountRateStart, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the time at which the discount rate period ends. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_discountrateend
     */
    get_DiscountRateEnd() {
        result := ComCall(35, this, "double*", &pdateDiscountRateEnd := 0, "HRESULT")
        return pdateDiscountRateEnd
    }

    /**
     * Sets or retrieves a value that indicates the time at which the discount rate period ends. (Put)
     * @param {Float} dateDiscountRateEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_discountrateend
     */
    put_DiscountRateEnd(dateDiscountRateEnd) {
        result := ComCall(36, this, "double", dateDiscountRateEnd, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates the length of time that an undeliverable fax message is kept on the fax server before it is deleted. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_outgoingqueueagelimit
     */
    get_OutgoingQueueAgeLimit() {
        result := ComCall(37, this, "int*", &plOutgoingQueueAgeLimit := 0, "HRESULT")
        return plOutgoingQueueAgeLimit
    }

    /**
     * Sets or retrieves a value that indicates the length of time that an undeliverable fax message is kept on the fax server before it is deleted. (Put)
     * @param {Integer} lOutgoingQueueAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_outgoingqueueagelimit
     */
    put_OutgoingQueueAgeLimit(lOutgoingQueueAgeLimit) {
        result := ComCall(38, this, "int", lOutgoingQueueAgeLimit, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the fax server generates a branding mark on outgoing faxes. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_branding
     */
    get_Branding() {
        result := ComCall(39, this, VARIANT_BOOL.Ptr, &pbBranding := 0, "HRESULT")
        return pbBranding
    }

    /**
     * Sets or retrieves a value that indicates whether the fax server generates a branding mark on outgoing faxes. (Put)
     * @param {VARIANT_BOOL} bBranding 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_branding
     */
    put_Branding(bBranding) {
        result := ComCall(40, this, VARIANT_BOOL, bBranding, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the fax server queue for incoming faxes has been blocked. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_incomingqueueblocked
     */
    get_IncomingQueueBlocked() {
        result := ComCall(41, this, VARIANT_BOOL.Ptr, &pbIncomingBlocked := 0, "HRESULT")
        return pbIncomingBlocked
    }

    /**
     * Sets or retrieves a value that indicates whether the fax server queue for incoming faxes has been blocked. (Put)
     * @param {VARIANT_BOOL} bIncomingBlocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_incomingqueueblocked
     */
    put_IncomingQueueBlocked(bIncomingBlocked) {
        result := ComCall(42, this, VARIANT_BOOL, bIncomingBlocked, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether the server automatically creates a fax account once a connection is initiated. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_autocreateaccountonconnect
     */
    get_AutoCreateAccountOnConnect() {
        result := ComCall(43, this, VARIANT_BOOL.Ptr, &pbAutoCreateAccountOnConnect := 0, "HRESULT")
        return pbAutoCreateAccountOnConnect
    }

    /**
     * Sets or retrieves a value that indicates whether the server automatically creates a fax account once a connection is initiated. (Put)
     * @param {VARIANT_BOOL} bAutoCreateAccountOnConnect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_autocreateaccountonconnect
     */
    put_AutoCreateAccountOnConnect(bAutoCreateAccountOnConnect) {
        result := ComCall(44, this, VARIANT_BOOL, bAutoCreateAccountOnConnect, "HRESULT")
        return result
    }

    /**
     * Indicates whether incoming faxes are either viewable by everyone or private. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-get_incomingfaxesarepublic
     */
    get_IncomingFaxesArePublic() {
        result := ComCall(45, this, VARIANT_BOOL.Ptr, &pbIncomingFaxesArePublic := 0, "HRESULT")
        return pbIncomingFaxesArePublic
    }

    /**
     * Indicates whether incoming faxes are either viewable by everyone or private. (Put)
     * @param {VARIANT_BOOL} bIncomingFaxesArePublic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-put_incomingfaxesarepublic
     */
    put_IncomingFaxesArePublic(bIncomingFaxesArePublic) {
        result := ComCall(46, this, VARIANT_BOOL, bIncomingFaxesArePublic, "HRESULT")
        return result
    }

    /**
     * Refreshes the object.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-refresh
     */
    Refresh() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * Saves the object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxconfiguration-save
     */
    Save() {
        result := ComCall(48, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxConfiguration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_UseArchive := CallbackCreate(GetMethod(implObj, "get_UseArchive"), flags, 2)
        this.vtbl.put_UseArchive := CallbackCreate(GetMethod(implObj, "put_UseArchive"), flags, 2)
        this.vtbl.get_ArchiveLocation := CallbackCreate(GetMethod(implObj, "get_ArchiveLocation"), flags, 2)
        this.vtbl.put_ArchiveLocation := CallbackCreate(GetMethod(implObj, "put_ArchiveLocation"), flags, 2)
        this.vtbl.get_SizeQuotaWarning := CallbackCreate(GetMethod(implObj, "get_SizeQuotaWarning"), flags, 2)
        this.vtbl.put_SizeQuotaWarning := CallbackCreate(GetMethod(implObj, "put_SizeQuotaWarning"), flags, 2)
        this.vtbl.get_HighQuotaWaterMark := CallbackCreate(GetMethod(implObj, "get_HighQuotaWaterMark"), flags, 2)
        this.vtbl.put_HighQuotaWaterMark := CallbackCreate(GetMethod(implObj, "put_HighQuotaWaterMark"), flags, 2)
        this.vtbl.get_LowQuotaWaterMark := CallbackCreate(GetMethod(implObj, "get_LowQuotaWaterMark"), flags, 2)
        this.vtbl.put_LowQuotaWaterMark := CallbackCreate(GetMethod(implObj, "put_LowQuotaWaterMark"), flags, 2)
        this.vtbl.get_ArchiveAgeLimit := CallbackCreate(GetMethod(implObj, "get_ArchiveAgeLimit"), flags, 2)
        this.vtbl.put_ArchiveAgeLimit := CallbackCreate(GetMethod(implObj, "put_ArchiveAgeLimit"), flags, 2)
        this.vtbl.get_ArchiveSizeLow := CallbackCreate(GetMethod(implObj, "get_ArchiveSizeLow"), flags, 2)
        this.vtbl.get_ArchiveSizeHigh := CallbackCreate(GetMethod(implObj, "get_ArchiveSizeHigh"), flags, 2)
        this.vtbl.get_OutgoingQueueBlocked := CallbackCreate(GetMethod(implObj, "get_OutgoingQueueBlocked"), flags, 2)
        this.vtbl.put_OutgoingQueueBlocked := CallbackCreate(GetMethod(implObj, "put_OutgoingQueueBlocked"), flags, 2)
        this.vtbl.get_OutgoingQueuePaused := CallbackCreate(GetMethod(implObj, "get_OutgoingQueuePaused"), flags, 2)
        this.vtbl.put_OutgoingQueuePaused := CallbackCreate(GetMethod(implObj, "put_OutgoingQueuePaused"), flags, 2)
        this.vtbl.get_AllowPersonalCoverPages := CallbackCreate(GetMethod(implObj, "get_AllowPersonalCoverPages"), flags, 2)
        this.vtbl.put_AllowPersonalCoverPages := CallbackCreate(GetMethod(implObj, "put_AllowPersonalCoverPages"), flags, 2)
        this.vtbl.get_UseDeviceTSID := CallbackCreate(GetMethod(implObj, "get_UseDeviceTSID"), flags, 2)
        this.vtbl.put_UseDeviceTSID := CallbackCreate(GetMethod(implObj, "put_UseDeviceTSID"), flags, 2)
        this.vtbl.get_Retries := CallbackCreate(GetMethod(implObj, "get_Retries"), flags, 2)
        this.vtbl.put_Retries := CallbackCreate(GetMethod(implObj, "put_Retries"), flags, 2)
        this.vtbl.get_RetryDelay := CallbackCreate(GetMethod(implObj, "get_RetryDelay"), flags, 2)
        this.vtbl.put_RetryDelay := CallbackCreate(GetMethod(implObj, "put_RetryDelay"), flags, 2)
        this.vtbl.get_DiscountRateStart := CallbackCreate(GetMethod(implObj, "get_DiscountRateStart"), flags, 2)
        this.vtbl.put_DiscountRateStart := CallbackCreate(GetMethod(implObj, "put_DiscountRateStart"), flags, 2)
        this.vtbl.get_DiscountRateEnd := CallbackCreate(GetMethod(implObj, "get_DiscountRateEnd"), flags, 2)
        this.vtbl.put_DiscountRateEnd := CallbackCreate(GetMethod(implObj, "put_DiscountRateEnd"), flags, 2)
        this.vtbl.get_OutgoingQueueAgeLimit := CallbackCreate(GetMethod(implObj, "get_OutgoingQueueAgeLimit"), flags, 2)
        this.vtbl.put_OutgoingQueueAgeLimit := CallbackCreate(GetMethod(implObj, "put_OutgoingQueueAgeLimit"), flags, 2)
        this.vtbl.get_Branding := CallbackCreate(GetMethod(implObj, "get_Branding"), flags, 2)
        this.vtbl.put_Branding := CallbackCreate(GetMethod(implObj, "put_Branding"), flags, 2)
        this.vtbl.get_IncomingQueueBlocked := CallbackCreate(GetMethod(implObj, "get_IncomingQueueBlocked"), flags, 2)
        this.vtbl.put_IncomingQueueBlocked := CallbackCreate(GetMethod(implObj, "put_IncomingQueueBlocked"), flags, 2)
        this.vtbl.get_AutoCreateAccountOnConnect := CallbackCreate(GetMethod(implObj, "get_AutoCreateAccountOnConnect"), flags, 2)
        this.vtbl.put_AutoCreateAccountOnConnect := CallbackCreate(GetMethod(implObj, "put_AutoCreateAccountOnConnect"), flags, 2)
        this.vtbl.get_IncomingFaxesArePublic := CallbackCreate(GetMethod(implObj, "get_IncomingFaxesArePublic"), flags, 2)
        this.vtbl.put_IncomingFaxesArePublic := CallbackCreate(GetMethod(implObj, "put_IncomingFaxesArePublic"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_UseArchive)
        CallbackFree(this.vtbl.put_UseArchive)
        CallbackFree(this.vtbl.get_ArchiveLocation)
        CallbackFree(this.vtbl.put_ArchiveLocation)
        CallbackFree(this.vtbl.get_SizeQuotaWarning)
        CallbackFree(this.vtbl.put_SizeQuotaWarning)
        CallbackFree(this.vtbl.get_HighQuotaWaterMark)
        CallbackFree(this.vtbl.put_HighQuotaWaterMark)
        CallbackFree(this.vtbl.get_LowQuotaWaterMark)
        CallbackFree(this.vtbl.put_LowQuotaWaterMark)
        CallbackFree(this.vtbl.get_ArchiveAgeLimit)
        CallbackFree(this.vtbl.put_ArchiveAgeLimit)
        CallbackFree(this.vtbl.get_ArchiveSizeLow)
        CallbackFree(this.vtbl.get_ArchiveSizeHigh)
        CallbackFree(this.vtbl.get_OutgoingQueueBlocked)
        CallbackFree(this.vtbl.put_OutgoingQueueBlocked)
        CallbackFree(this.vtbl.get_OutgoingQueuePaused)
        CallbackFree(this.vtbl.put_OutgoingQueuePaused)
        CallbackFree(this.vtbl.get_AllowPersonalCoverPages)
        CallbackFree(this.vtbl.put_AllowPersonalCoverPages)
        CallbackFree(this.vtbl.get_UseDeviceTSID)
        CallbackFree(this.vtbl.put_UseDeviceTSID)
        CallbackFree(this.vtbl.get_Retries)
        CallbackFree(this.vtbl.put_Retries)
        CallbackFree(this.vtbl.get_RetryDelay)
        CallbackFree(this.vtbl.put_RetryDelay)
        CallbackFree(this.vtbl.get_DiscountRateStart)
        CallbackFree(this.vtbl.put_DiscountRateStart)
        CallbackFree(this.vtbl.get_DiscountRateEnd)
        CallbackFree(this.vtbl.put_DiscountRateEnd)
        CallbackFree(this.vtbl.get_OutgoingQueueAgeLimit)
        CallbackFree(this.vtbl.put_OutgoingQueueAgeLimit)
        CallbackFree(this.vtbl.get_Branding)
        CallbackFree(this.vtbl.put_Branding)
        CallbackFree(this.vtbl.get_IncomingQueueBlocked)
        CallbackFree(this.vtbl.put_IncomingQueueBlocked)
        CallbackFree(this.vtbl.get_AutoCreateAccountOnConnect)
        CallbackFree(this.vtbl.put_AutoCreateAccountOnConnect)
        CallbackFree(this.vtbl.get_IncomingFaxesArePublic)
        CallbackFree(this.vtbl.put_IncomingFaxesArePublic)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Save)
    }
}
