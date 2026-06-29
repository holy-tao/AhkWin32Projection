#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxOutgoingJobs.ahk" { IFaxOutgoingJobs }
#Import ".\IFaxOutgoingJob.ahk" { IFaxOutgoingJob }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IFaxOutgoingQueue interface defines a FaxOutgoingQueue configuration object used by a fax client application to set and retrieve the configuration parameters on the outbound fax queue on a fax server.
 * @remarks
 * A default implementation of <b>IFaxOutgoingQueue</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingqueue">FaxOutgoingQueue</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxoutgoingqueue
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxOutgoingQueue extends IDispatch {
    /**
     * The interface identifier for IFaxOutgoingQueue
     * @type {Guid}
     */
    static IID := Guid("{80b1df24-d9ac-4333-b373-487cedc80ce5}")

    /**
     * The class identifier for FaxOutgoingQueue
     * @type {Guid}
     */
    static CLSID := Guid("{7421169e-8c43-4b0d-bb16-645c8fa40357}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxOutgoingQueue interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Blocked                 : IntPtr
        put_Blocked                 : IntPtr
        get_Paused                  : IntPtr
        put_Paused                  : IntPtr
        get_AllowPersonalCoverPages : IntPtr
        put_AllowPersonalCoverPages : IntPtr
        get_UseDeviceTSID           : IntPtr
        put_UseDeviceTSID           : IntPtr
        get_Retries                 : IntPtr
        put_Retries                 : IntPtr
        get_RetryDelay              : IntPtr
        put_RetryDelay              : IntPtr
        get_DiscountRateStart       : IntPtr
        put_DiscountRateStart       : IntPtr
        get_DiscountRateEnd         : IntPtr
        put_DiscountRateEnd         : IntPtr
        get_AgeLimit                : IntPtr
        put_AgeLimit                : IntPtr
        get_Branding                : IntPtr
        put_Branding                : IntPtr
        Refresh                     : IntPtr
        Save                        : IntPtr
        GetJobs                     : IntPtr
        GetJob                      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxOutgoingQueue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Blocked {
        get => this.get_Blocked()
        set => this.put_Blocked(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Paused {
        get => this.get_Paused()
        set => this.put_Paused(value)
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
    AgeLimit {
        get => this.get_AgeLimit()
        set => this.put_AgeLimit(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Branding {
        get => this.get_Branding()
        set => this.put_Branding(value)
    }

    /**
     * The IFaxOutgoingQueue::get_Blocked property is a Boolean value that indicates whether the job queue for outgoing faxes is blocked. (Get)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the outbound job queue is blocked and the fax service is not accepting outbound fax submissions. If this property is equal to <b>FALSE</b>, the queue is not blocked.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_blocked
     */
    get_Blocked() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pbBlocked := 0, "HRESULT")
        return pbBlocked
    }

    /**
     * The IFaxOutgoingQueue::get_Blocked property is a Boolean value that indicates whether the job queue for outgoing faxes is blocked. (Put)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the outbound job queue is blocked and the fax service is not accepting outbound fax submissions. If this property is equal to <b>FALSE</b>, the queue is not blocked.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {VARIANT_BOOL} bBlocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_blocked
     */
    put_Blocked(bBlocked) {
        result := ComCall(8, this, VARIANT_BOOL, bBlocked, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingQueue::get_Paused property is a Boolean value that indicates whether the job queue for outgoing faxes is paused. (Get)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the job queue is paused and the fax service is not processing jobs in the queue. If this property is equal to <b>FALSE</b>, the outgoing queue is not paused.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_paused
     */
    get_Paused() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &pbPaused := 0, "HRESULT")
        return pbPaused
    }

    /**
     * The IFaxOutgoingQueue::get_Paused property is a Boolean value that indicates whether the job queue for outgoing faxes is paused. (Put)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the job queue is paused and the fax service is not processing jobs in the queue. If this property is equal to <b>FALSE</b>, the outgoing queue is not paused.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {VARIANT_BOOL} bPaused 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_paused
     */
    put_Paused(bPaused) {
        result := ComCall(10, this, VARIANT_BOOL, bPaused, "HRESULT")
        return result
    }

    /**
     * The AllowPersonalCoverPages property is a Boolean value that indicates whether fax client applications can include a user-designed cover page with fax transmissions. (Get)
     * @remarks
     * If this property is equal to <b>TRUE</b>, clients can include personal cover page files with fax transmissions. If this property is equal to <b>FALSE</b>, clients must use a common cover page file stored on the fax server. 
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_allowpersonalcoverpages
     */
    get_AllowPersonalCoverPages() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &pbAllowPersonalCoverPages := 0, "HRESULT")
        return pbAllowPersonalCoverPages
    }

    /**
     * The AllowPersonalCoverPages property is a Boolean value that indicates whether fax client applications can include a user-designed cover page with fax transmissions. (Put)
     * @remarks
     * If this property is equal to <b>TRUE</b>, clients can include personal cover page files with fax transmissions. If this property is equal to <b>FALSE</b>, clients must use a common cover page file stored on the fax server. 
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {VARIANT_BOOL} bAllowPersonalCoverPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_allowpersonalcoverpages
     */
    put_AllowPersonalCoverPages(bAllowPersonalCoverPages) {
        result := ComCall(12, this, VARIANT_BOOL, bAllowPersonalCoverPages, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingQueue::get_UseDeviceTSID property is a Boolean value that indicates whether the fax service uses the device transmitting station identifier (TSID) instead of a sender TSID. (Get)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax service uses the device TSID rather than a user-specified TSID. If this property is equal to <b>FALSE</b>, the fax service uses a user-specified TSID.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_usedevicetsid
     */
    get_UseDeviceTSID() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &pbUseDeviceTSID := 0, "HRESULT")
        return pbUseDeviceTSID
    }

    /**
     * The IFaxOutgoingQueue::get_UseDeviceTSID property is a Boolean value that indicates whether the fax service uses the device transmitting station identifier (TSID) instead of a sender TSID. (Put)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax service uses the device TSID rather than a user-specified TSID. If this property is equal to <b>FALSE</b>, the fax service uses a user-specified TSID.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {VARIANT_BOOL} bUseDeviceTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_usedevicetsid
     */
    put_UseDeviceTSID(bUseDeviceTSID) {
        result := ComCall(14, this, VARIANT_BOOL, bUseDeviceTSID, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingQueue::get_Retries property is a value that indicates the number of times that the fax service attempts to retransmit an outgoing fax when the initial transmission fails. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_retries
     */
    get_Retries() {
        result := ComCall(15, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * The IFaxOutgoingQueue::get_Retries property is a value that indicates the number of times that the fax service attempts to retransmit an outgoing fax when the initial transmission fails. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Integer} lRetries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_retries
     */
    put_Retries(lRetries) {
        result := ComCall(16, this, "int", lRetries, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingQueue::get_RetryDelay property is a value that indicates the time interval, in minutes, that the fax service waits before attempting to retransmit an outbound fax job. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_retrydelay
     */
    get_RetryDelay() {
        result := ComCall(17, this, "int*", &plRetryDelay := 0, "HRESULT")
        return plRetryDelay
    }

    /**
     * The IFaxOutgoingQueue::get_RetryDelay property is a value that indicates the time interval, in minutes, that the fax service waits before attempting to retransmit an outbound fax job. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Integer} lRetryDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_retrydelay
     */
    put_RetryDelay(lRetryDelay) {
        result := ComCall(18, this, "int", lRetryDelay, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingQueue::get_DiscountRateStart property is a value that indicates the time at which the discount period for transmitting faxes begins. The discount period applies to outgoing faxes. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_discountratestart
     */
    get_DiscountRateStart() {
        result := ComCall(19, this, "double*", &pdateDiscountRateStart := 0, "HRESULT")
        return pdateDiscountRateStart
    }

    /**
     * The IFaxOutgoingQueue::get_DiscountRateStart property is a value that indicates the time at which the discount period for transmitting faxes begins. The discount period applies to outgoing faxes. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Float} dateDiscountRateStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_discountratestart
     */
    put_DiscountRateStart(dateDiscountRateStart) {
        result := ComCall(20, this, "double", dateDiscountRateStart, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingQueue::get_DiscountRateEnd property is a value that indicates the time at which the discount period for transmitting faxes ends. The discount period applies to outgoing faxes. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_discountrateend
     */
    get_DiscountRateEnd() {
        result := ComCall(21, this, "double*", &pdateDiscountRateEnd := 0, "HRESULT")
        return pdateDiscountRateEnd
    }

    /**
     * The IFaxOutgoingQueue::get_DiscountRateEnd property is a value that indicates the time at which the discount period for transmitting faxes ends. The discount period applies to outgoing faxes. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Float} dateDiscountRateEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_discountrateend
     */
    put_DiscountRateEnd(dateDiscountRateEnd) {
        result := ComCall(22, this, "double", dateDiscountRateEnd, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingQueue::get_AgeLimit property is a value that indicates the number of days that the fax service retains an unsent job in the fax job queue. (Get)
     * @remarks
     * If the fax job remains in the outbound job queue longer than the value specified, the fax service deletes the job. If the value of this property is zero, the fax service does not enforce an age limit.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_agelimit
     */
    get_AgeLimit() {
        result := ComCall(23, this, "int*", &plAgeLimit := 0, "HRESULT")
        return plAgeLimit
    }

    /**
     * The IFaxOutgoingQueue::get_AgeLimit property is a value that indicates the number of days that the fax service retains an unsent job in the fax job queue. (Put)
     * @remarks
     * If the fax job remains in the outbound job queue longer than the value specified, the fax service deletes the job. If the value of this property is zero, the fax service does not enforce an age limit.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Integer} lAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_agelimit
     */
    put_AgeLimit(lAgeLimit) {
        result := ComCall(24, this, "int", lAgeLimit, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingQueue::get_Branding property is a Boolean value that indicates whether the fax service generates a brand (banner) at the top of outgoing fax transmissions. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-get_branding
     */
    get_Branding() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &pbBranding := 0, "HRESULT")
        return pbBranding
    }

    /**
     * The IFaxOutgoingQueue::get_Branding property is a Boolean value that indicates whether the fax service generates a brand (banner) at the top of outgoing fax transmissions. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {VARIANT_BOOL} bBranding 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-put_branding
     */
    put_Branding(bBranding) {
        result := ComCall(26, this, VARIANT_BOOL, bBranding, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingQueue::Refresh method refreshes FaxOutgoingQueue object information from the fax server. When the IFaxOutgoingQueue::Refresh method is called, any configuration changes made after the last IFaxOutgoingQueue::Save method call are lost.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-refresh
     */
    Refresh() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingQueue::Save method saves the FaxOutgoingQueue object data.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-save
     */
    Save() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingQueue::GetJobs method returns a collection of the outbound fax jobs in the job queue.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_JOBS</a> access right.
     * 
     * With the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> access right, users can use this method only for their own faxes. With the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_JOBS</a> access right, users can use this method for all faxes on the server.
     * @returns {IFaxOutgoingJobs} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjobs">FaxOutgoingJobs</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjobs">FaxOutgoingJobs</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-getjobs
     */
    GetJobs() {
        result := ComCall(29, this, "ptr*", &pFaxOutgoingJobs := 0, "HRESULT")
        return IFaxOutgoingJobs(pFaxOutgoingJobs)
    }

    /**
     * The IFaxOutgoingQueue::GetJob method returns an outbound fax job in the job queue according to its ID.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_JOBS</a> access right.
     * 
     * With the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> access right, users can use this method only for their own faxes. With the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_JOBS</a> access right, users can use this method for all faxes on the server.
     * @param {BSTR} bstrJobId Type: <b>BSTR</b>
     * 
     * Specifies the job ID.
     * @returns {IFaxOutgoingJob} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutgoingjob">IFaxOutgoingJob</a>**</b>
     * 
     * The address of a pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjob">FaxOutgoingJob</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingqueue-getjob
     */
    GetJob(bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(30, this, BSTR, bstrJobId, "ptr*", &pFaxOutgoingJob := 0, "HRESULT")
        return IFaxOutgoingJob(pFaxOutgoingJob)
    }

    Query(iid) {
        if (IFaxOutgoingQueue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Blocked := CallbackCreate(GetMethod(implObj, "get_Blocked"), flags, 2)
        this.vtbl.put_Blocked := CallbackCreate(GetMethod(implObj, "put_Blocked"), flags, 2)
        this.vtbl.get_Paused := CallbackCreate(GetMethod(implObj, "get_Paused"), flags, 2)
        this.vtbl.put_Paused := CallbackCreate(GetMethod(implObj, "put_Paused"), flags, 2)
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
        this.vtbl.get_AgeLimit := CallbackCreate(GetMethod(implObj, "get_AgeLimit"), flags, 2)
        this.vtbl.put_AgeLimit := CallbackCreate(GetMethod(implObj, "put_AgeLimit"), flags, 2)
        this.vtbl.get_Branding := CallbackCreate(GetMethod(implObj, "get_Branding"), flags, 2)
        this.vtbl.put_Branding := CallbackCreate(GetMethod(implObj, "put_Branding"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
        this.vtbl.GetJobs := CallbackCreate(GetMethod(implObj, "GetJobs"), flags, 2)
        this.vtbl.GetJob := CallbackCreate(GetMethod(implObj, "GetJob"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Blocked)
        CallbackFree(this.vtbl.put_Blocked)
        CallbackFree(this.vtbl.get_Paused)
        CallbackFree(this.vtbl.put_Paused)
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
        CallbackFree(this.vtbl.get_AgeLimit)
        CallbackFree(this.vtbl.put_AgeLimit)
        CallbackFree(this.vtbl.get_Branding)
        CallbackFree(this.vtbl.put_Branding)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.GetJobs)
        CallbackFree(this.vtbl.GetJob)
    }
}
