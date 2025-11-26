#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxIncomingJob interface is used by a fax client application to retrieve information about an incoming fax job in a fax server's queue.
 * @remarks
 * 
 * To create a <b>FaxIncomingJob</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxincomingjobs-get_item">IFaxIncomingJobs::get_Item</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxincomingjob
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxIncomingJob extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxIncomingJob
     * @type {Guid}
     */
    static IID => Guid("{207529e6-654a-4916-9f88-4d232ee8a107}")

    /**
     * The class identifier for FaxIncomingJob
     * @type {Guid}
     */
    static CLSID => Guid("{c47311ec-ae32-41b8-ae4b-3eae0629d0c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Size", "get_Id", "get_CurrentPage", "get_DeviceId", "get_Status", "get_ExtendedStatusCode", "get_ExtendedStatus", "get_AvailableOperations", "get_Retries", "get_TransmissionStart", "get_TransmissionEnd", "get_CSID", "get_TSID", "get_CallerId", "get_RoutingInformation", "get_JobType", "Cancel", "Refresh", "CopyTiff"]

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
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
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
     * @type {Integer} 
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
     * @type {Integer} 
     */
    JobType {
        get => this.get_JobType()
    }

    /**
     * The Size property is a value that indicates the size of the Tagged Image File Format Class F (TIFF Class F) file associated with the inbound fax job.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_size
     */
    get_Size() {
        result := ComCall(7, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * The Id property is a null-terminated string that contains a unique ID for the inbound fax job.
     * @remarks
     * 
     * You can use the fax job's ID to retrieve the archived fax message after the job completes successfully.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_id
     */
    get_Id() {
        pbstrId := BSTR()
        result := ComCall(8, this, "ptr", pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * The CurrentPage property is a number that identifies the page that the fax service is actively receiving on an inbound fax job.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_currentpage
     */
    get_CurrentPage() {
        result := ComCall(9, this, "int*", &plCurrentPage := 0, "HRESULT")
        return plCurrentPage
    }

    /**
     * The DeviceId property indicates the device ID of the device receiving the inbound fax job.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_deviceid
     */
    get_DeviceId() {
        result := ComCall(10, this, "int*", &plDeviceId := 0, "HRESULT")
        return plDeviceId
    }

    /**
     * Retrieves the Status property of a FaxIncomingJob object. The Status property is a number that indicates the current status of an inbound fax job in the job queue.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_status_enum">FAX_JOB_STATUS_ENUM</a>*</b>
     * 
     * Pointer to a value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_status_enum">FAX_JOB_STATUS_ENUM</a> enumeration that specifies the current status of an inbound fax job in the job queue.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_status
     */
    get_Status() {
        result := ComCall(11, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * Retrieves the ExtendedStatusCode property of a FaxIncomingJob object. The ExtendedStatusCode property specifies a code describing the job's extended status.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_extended_status_enum">FAX_JOB_EXTENDED_STATUS_ENUM</a>*</b>
     * 
     * Pointer to a value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_extended_status_enum">FAX_JOB_EXTENDED_STATUS_ENUM</a> enumeration that specifies the extended job status.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_extendedstatuscode
     */
    get_ExtendedStatusCode() {
        result := ComCall(12, this, "int*", &pExtendedStatusCode := 0, "HRESULT")
        return pExtendedStatusCode
    }

    /**
     * The ExtendedStatus property is a null-terminated string that describes the job's extended status.
     * @remarks
     * 
     * The <b>ExtendedStatus</b> property can have a value only if the fax service provider (FSP) returns a proprietary status code in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingjob-extendedstatuscode">ExtendedStatusCode</a> property. Otherwise, the <b>ExtendedStatus</b> property will contain an empty string.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_extendedstatus
     */
    get_ExtendedStatus() {
        pbstrExtendedStatus := BSTR()
        result := ComCall(13, this, "ptr", pbstrExtendedStatus, "HRESULT")
        return pbstrExtendedStatus
    }

    /**
     * Retrieves the AvailableOperations property of a FaxIncomingJob object. The AvailableOperations property indicates the combination of valid operations that you can perform on the fax job given its current status.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_operations_enum">FAX_JOB_OPERATIONS_ENUM</a>*</b>
     * 
     * Pointer to a <b>long</b> value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_operations_enum">FAX_JOB_OPERATIONS_ENUM</a> enumeration that specifies a bitwise combination of the operations that you can currently perform on the fax job. Some operations are mutually exclusive. For example, you cannot pause a job that has already been paused.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_availableoperations
     */
    get_AvailableOperations() {
        result := ComCall(14, this, "int*", &pAvailableOperations := 0, "HRESULT")
        return pAvailableOperations
    }

    /**
     * The Retries property is a value that indicates the number of times the fax service attempted to route an incoming fax when the initial routing attempt failed.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_retries
     */
    get_Retries() {
        result := ComCall(15, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * The TransmissionStart property indicates the time that the fax inbound job began transmitting.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_transmissionstart
     */
    get_TransmissionStart() {
        result := ComCall(16, this, "double*", &pdateTransmissionStart := 0, "HRESULT")
        return pdateTransmissionStart
    }

    /**
     * The TransmissionEnd property indicates the time at which the inbound fax job completed transmission.
     * @remarks
     * 
     * The <b>TransmissionEnd</b> property is not valid as long as the fax is still being received by the fax device. In the case of a fax that is still in progress, this property will be assigned a value of zero. If you try to retrieve the property for a fax that is still in progress you will receive an error.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_transmissionend
     */
    get_TransmissionEnd() {
        result := ComCall(17, this, "double*", &pdateTransmissionEnd := 0, "HRESULT")
        return pdateTransmissionEnd
    }

    /**
     * The CSID property is a null-terminated string that contains the called station identifier (CSID) for the job.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR()
        result := ComCall(18, this, "ptr", pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * The TSID property is a null-terminated string that contains the transmitting station identifier (TSID) associated with the fax inbound job.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR()
        result := ComCall(19, this, "ptr", pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * The CallerId property is a string that identifies the calling device that sent the inbound fax job.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_callerid
     */
    get_CallerId() {
        pbstrCallerId := BSTR()
        result := ComCall(20, this, "ptr", pbstrCallerId, "HRESULT")
        return pbstrCallerId
    }

    /**
     * The RoutingInformation property is a null-terminated string that specifies routing information for the inbound fax job.
     * @remarks
     * 
     * For more information about routing information, see the <a href="https://docs.microsoft.com/windows/desktop/api/faxdev/ns-faxdev-fax_dev_status">RoutingInfo</a> member of the <a href="https://docs.microsoft.com/windows/desktop/api/faxdev/ns-faxdev-fax_dev_status">FAX_DEV_STATUS</a> structure.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_routinginformation
     */
    get_RoutingInformation() {
        pbstrRoutingInformation := BSTR()
        result := ComCall(21, this, "ptr", pbstrRoutingInformation, "HRESULT")
        return pbstrRoutingInformation
    }

    /**
     * Retrieves the JobType property of a FaxIncomingJob object. The JobType property describes the type of fax job; for example, the job can be a receive job, a send job, or a routing job.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_type_enum">FAX_JOB_TYPE_ENUM</a>*</b>
     * 
     * Pointer to a value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_type_enum">FAX_JOB_TYPE_ENUM</a> enumeration that specifies the fax job type.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-get_jobtype
     */
    get_JobType() {
        result := ComCall(22, this, "int*", &pJobType := 0, "HRESULT")
        return pJobType
    }

    /**
     * The Cancel method cancels the incoming fax job.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-cancel
     */
    Cancel() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * The Refresh method refreshes FaxIncomingJob object information from the fax server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-refresh
     */
    Refresh() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * The CopyTiff method copies the Tagged Image File Format Class F (TIFF Class F) file associated with the inbound fax job to a file on the local computer.
     * @param {BSTR} bstrTiffPath Type: <b>BSTR</b>
     * 
     * Null-terminated string that specifies a fully qualified path and file name on the local computer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingjob-copytiff
     */
    CopyTiff(bstrTiffPath) {
        bstrTiffPath := bstrTiffPath is String ? BSTR.Alloc(bstrTiffPath).Value : bstrTiffPath

        result := ComCall(25, this, "ptr", bstrTiffPath, "HRESULT")
        return result
    }
}
