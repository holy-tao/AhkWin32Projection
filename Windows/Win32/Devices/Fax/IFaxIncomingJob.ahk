#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FAX_JOB_TYPE_ENUM.ahk" { FAX_JOB_TYPE_ENUM }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\FAX_JOB_EXTENDED_STATUS_ENUM.ahk" { FAX_JOB_EXTENDED_STATUS_ENUM }
#Import ".\FAX_JOB_OPERATIONS_ENUM.ahk" { FAX_JOB_OPERATIONS_ENUM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FAX_JOB_STATUS_ENUM.ahk" { FAX_JOB_STATUS_ENUM }

/**
 * The IFaxIncomingJob interface is used by a fax client application to retrieve information about an incoming fax job in a fax server's queue.
 * @remarks
 * To create a <b>FaxIncomingJob</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxincomingjobs-get_item">IFaxIncomingJobs::get_Item</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxincomingjob
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxIncomingJob extends IDispatch {
    /**
     * The interface identifier for IFaxIncomingJob
     * @type {Guid}
     */
    static IID := Guid("{207529e6-654a-4916-9f88-4d232ee8a107}")

    /**
     * The class identifier for FaxIncomingJob
     * @type {Guid}
     */
    static CLSID := Guid("{c47311ec-ae32-41b8-ae4b-3eae0629d0c9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxIncomingJob interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Size                : IntPtr
        get_Id                  : IntPtr
        get_CurrentPage         : IntPtr
        get_DeviceId            : IntPtr
        get_Status              : IntPtr
        get_ExtendedStatusCode  : IntPtr
        get_ExtendedStatus      : IntPtr
        get_AvailableOperations : IntPtr
        get_Retries             : IntPtr
        get_TransmissionStart   : IntPtr
        get_TransmissionEnd     : IntPtr
        get_CSID                : IntPtr
        get_TSID                : IntPtr
        get_CallerId            : IntPtr
        get_RoutingInformation  : IntPtr
        get_JobType             : IntPtr
        Cancel                  : IntPtr
        Refresh                 : IntPtr
        CopyTiff                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxIncomingJob.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * @type {BSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    CurrentPage {
        get => this.get_CurrentPage()
    }

    /**
     * @type {Integer} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {FAX_JOB_STATUS_ENUM} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {FAX_JOB_EXTENDED_STATUS_ENUM} 
     */
    ExtendedStatusCode {
        get => this.get_ExtendedStatusCode()
    }

    /**
     * @type {BSTR} 
     */
    ExtendedStatus {
        get => this.get_ExtendedStatus()
    }

    /**
     * @type {FAX_JOB_OPERATIONS_ENUM} 
     */
    AvailableOperations {
        get => this.get_AvailableOperations()
    }

    /**
     * @type {Integer} 
     */
    Retries {
        get => this.get_Retries()
    }

    /**
     * @type {Float} 
     */
    TransmissionStart {
        get => this.get_TransmissionStart()
    }

    /**
     * @type {Float} 
     */
    TransmissionEnd {
        get => this.get_TransmissionEnd()
    }

    /**
     * @type {BSTR} 
     */
    CSID {
        get => this.get_CSID()
    }

    /**
     * @type {BSTR} 
     */
    TSID {
        get => this.get_TSID()
    }

    /**
     * @type {BSTR} 
     */
    CallerId {
        get => this.get_CallerId()
    }

    /**
     * @type {BSTR} 
     */
    RoutingInformation {
        get => this.get_RoutingInformation()
    }

    /**
     * @type {FAX_JOB_TYPE_ENUM} 
     */
    JobType {
        get => this.get_JobType()
    }

    /**
     * The Size property is a value that indicates the size of the Tagged Image File Format Class F (TIFF Class F) file associated with the inbound fax job.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_size
     */
    get_Size() {
        result := ComCall(7, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * The Id property is a null-terminated string that contains a unique ID for the inbound fax job.
     * @remarks
     * You can use the fax job's ID to retrieve the archived fax message after the job completes successfully.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_id
     */
    get_Id() {
        pbstrId := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * The CurrentPage property is a number that identifies the page that the fax service is actively receiving on an inbound fax job.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_currentpage
     */
    get_CurrentPage() {
        result := ComCall(9, this, "int*", &plCurrentPage := 0, "HRESULT")
        return plCurrentPage
    }

    /**
     * The DeviceId property indicates the device ID of the device receiving the inbound fax job.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_deviceid
     */
    get_DeviceId() {
        result := ComCall(10, this, "int*", &plDeviceId := 0, "HRESULT")
        return plDeviceId
    }

    /**
     * Retrieves the Status property of a FaxIncomingJob object. The Status property is a number that indicates the current status of an inbound fax job in the job queue.
     * @returns {FAX_JOB_STATUS_ENUM} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_status_enum">FAX_JOB_STATUS_ENUM</a>*</b>
     * 
     * Pointer to a value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_status_enum">FAX_JOB_STATUS_ENUM</a> enumeration that specifies the current status of an inbound fax job in the job queue.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_status
     */
    get_Status() {
        result := ComCall(11, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * Retrieves the ExtendedStatusCode property of a FaxIncomingJob object. The ExtendedStatusCode property specifies a code describing the job's extended status.
     * @returns {FAX_JOB_EXTENDED_STATUS_ENUM} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_extended_status_enum">FAX_JOB_EXTENDED_STATUS_ENUM</a>*</b>
     * 
     * Pointer to a value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_extended_status_enum">FAX_JOB_EXTENDED_STATUS_ENUM</a> enumeration that specifies the extended job status.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_extendedstatuscode
     */
    get_ExtendedStatusCode() {
        result := ComCall(12, this, "int*", &pExtendedStatusCode := 0, "HRESULT")
        return pExtendedStatusCode
    }

    /**
     * The ExtendedStatus property is a null-terminated string that describes the job's extended status. (IFaxIncomingJob.get_ExtendedStatus)
     * @remarks
     * The <b>ExtendedStatus</b> property can have a value only if the fax service provider (FSP) returns a proprietary status code in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingjob-extendedstatuscode">ExtendedStatusCode</a> property. Otherwise, the <b>ExtendedStatus</b> property will contain an empty string.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_extendedstatus
     */
    get_ExtendedStatus() {
        pbstrExtendedStatus := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrExtendedStatus, "HRESULT")
        return pbstrExtendedStatus
    }

    /**
     * Retrieves the AvailableOperations property of a FaxIncomingJob object. The AvailableOperations property indicates the combination of valid operations that you can perform on the fax job given its current status.
     * @returns {FAX_JOB_OPERATIONS_ENUM} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_operations_enum">FAX_JOB_OPERATIONS_ENUM</a>*</b>
     * 
     * Pointer to a <b>long</b> value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_operations_enum">FAX_JOB_OPERATIONS_ENUM</a> enumeration that specifies a bitwise combination of the operations that you can currently perform on the fax job. Some operations are mutually exclusive. For example, you cannot pause a job that has already been paused.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_availableoperations
     */
    get_AvailableOperations() {
        result := ComCall(14, this, "int*", &pAvailableOperations := 0, "HRESULT")
        return pAvailableOperations
    }

    /**
     * The Retries property is a value that indicates the number of times the fax service attempted to route an incoming fax when the initial routing attempt failed.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_retries
     */
    get_Retries() {
        result := ComCall(15, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * The TransmissionStart property indicates the time that the fax inbound job began transmitting.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_transmissionstart
     */
    get_TransmissionStart() {
        result := ComCall(16, this, "double*", &pdateTransmissionStart := 0, "HRESULT")
        return pdateTransmissionStart
    }

    /**
     * The TransmissionEnd property indicates the time at which the inbound fax job completed transmission.
     * @remarks
     * The <b>TransmissionEnd</b> property is not valid as long as the fax is still being received by the fax device. In the case of a fax that is still in progress, this property will be assigned a value of zero. If you try to retrieve the property for a fax that is still in progress you will receive an error.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_transmissionend
     */
    get_TransmissionEnd() {
        result := ComCall(17, this, "double*", &pdateTransmissionEnd := 0, "HRESULT")
        return pdateTransmissionEnd
    }

    /**
     * The CSID property is a null-terminated string that contains the called station identifier (CSID) for the job. (IFaxIncomingJob.get_CSID)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * The TSID property is a null-terminated string that contains the transmitting station identifier (TSID) associated with the fax inbound job.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * The CallerId property is a string that identifies the calling device that sent the inbound fax job.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_callerid
     */
    get_CallerId() {
        pbstrCallerId := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, pbstrCallerId, "HRESULT")
        return pbstrCallerId
    }

    /**
     * The RoutingInformation property is a null-terminated string that specifies routing information for the inbound fax job.
     * @remarks
     * For more information about routing information, see the <a href="https://docs.microsoft.com/windows/desktop/api/faxdev/ns-faxdev-fax_dev_status">RoutingInfo</a> member of the <a href="https://docs.microsoft.com/windows/desktop/api/faxdev/ns-faxdev-fax_dev_status">FAX_DEV_STATUS</a> structure.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_routinginformation
     */
    get_RoutingInformation() {
        pbstrRoutingInformation := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, pbstrRoutingInformation, "HRESULT")
        return pbstrRoutingInformation
    }

    /**
     * Retrieves the JobType property of a FaxIncomingJob object. The JobType property describes the type of fax job; for example, the job can be a receive job, a send job, or a routing job.
     * @returns {FAX_JOB_TYPE_ENUM} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_type_enum">FAX_JOB_TYPE_ENUM</a>*</b>
     * 
     * Pointer to a value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_type_enum">FAX_JOB_TYPE_ENUM</a> enumeration that specifies the fax job type.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_jobtype
     */
    get_JobType() {
        result := ComCall(22, this, "int*", &pJobType := 0, "HRESULT")
        return pJobType
    }

    /**
     * The Cancel method cancels the incoming fax job.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_JOBS</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-cancel
     */
    Cancel() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * The Refresh method refreshes FaxIncomingJob object information from the fax server.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_QUEUE</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-refresh
     */
    Refresh() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * The CopyTiff method copies the Tagged Image File Format Class F (TIFF Class F) file associated with the inbound fax job to a file on the local computer.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_JOBS</a> access right.
     * @param {BSTR} bstrTiffPath Type: <b>BSTR</b>
     * 
     * Null-terminated string that specifies a fully qualified path and file name on the local computer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-copytiff
     */
    CopyTiff(bstrTiffPath) {
        bstrTiffPath := bstrTiffPath is String ? BSTR.Alloc(bstrTiffPath).Value : bstrTiffPath

        result := ComCall(25, this, BSTR, bstrTiffPath, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxIncomingJob.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Size := CallbackCreate(GetMethod(implObj, "get_Size"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_CurrentPage := CallbackCreate(GetMethod(implObj, "get_CurrentPage"), flags, 2)
        this.vtbl.get_DeviceId := CallbackCreate(GetMethod(implObj, "get_DeviceId"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_ExtendedStatusCode := CallbackCreate(GetMethod(implObj, "get_ExtendedStatusCode"), flags, 2)
        this.vtbl.get_ExtendedStatus := CallbackCreate(GetMethod(implObj, "get_ExtendedStatus"), flags, 2)
        this.vtbl.get_AvailableOperations := CallbackCreate(GetMethod(implObj, "get_AvailableOperations"), flags, 2)
        this.vtbl.get_Retries := CallbackCreate(GetMethod(implObj, "get_Retries"), flags, 2)
        this.vtbl.get_TransmissionStart := CallbackCreate(GetMethod(implObj, "get_TransmissionStart"), flags, 2)
        this.vtbl.get_TransmissionEnd := CallbackCreate(GetMethod(implObj, "get_TransmissionEnd"), flags, 2)
        this.vtbl.get_CSID := CallbackCreate(GetMethod(implObj, "get_CSID"), flags, 2)
        this.vtbl.get_TSID := CallbackCreate(GetMethod(implObj, "get_TSID"), flags, 2)
        this.vtbl.get_CallerId := CallbackCreate(GetMethod(implObj, "get_CallerId"), flags, 2)
        this.vtbl.get_RoutingInformation := CallbackCreate(GetMethod(implObj, "get_RoutingInformation"), flags, 2)
        this.vtbl.get_JobType := CallbackCreate(GetMethod(implObj, "get_JobType"), flags, 2)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.CopyTiff := CallbackCreate(GetMethod(implObj, "CopyTiff"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Size)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_CurrentPage)
        CallbackFree(this.vtbl.get_DeviceId)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_ExtendedStatusCode)
        CallbackFree(this.vtbl.get_ExtendedStatus)
        CallbackFree(this.vtbl.get_AvailableOperations)
        CallbackFree(this.vtbl.get_Retries)
        CallbackFree(this.vtbl.get_TransmissionStart)
        CallbackFree(this.vtbl.get_TransmissionEnd)
        CallbackFree(this.vtbl.get_CSID)
        CallbackFree(this.vtbl.get_TSID)
        CallbackFree(this.vtbl.get_CallerId)
        CallbackFree(this.vtbl.get_RoutingInformation)
        CallbackFree(this.vtbl.get_JobType)
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.CopyTiff)
    }
}
