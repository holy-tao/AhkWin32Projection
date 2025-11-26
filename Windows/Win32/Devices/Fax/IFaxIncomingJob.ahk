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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_size
     */
    get_Size() {
        result := ComCall(7, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_id
     */
    get_Id() {
        pbstrId := BSTR()
        result := ComCall(8, this, "ptr", pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_currentpage
     */
    get_CurrentPage() {
        result := ComCall(9, this, "int*", &plCurrentPage := 0, "HRESULT")
        return plCurrentPage
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_deviceid
     */
    get_DeviceId() {
        result := ComCall(10, this, "int*", &plDeviceId := 0, "HRESULT")
        return plDeviceId
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_status
     */
    get_Status() {
        result := ComCall(11, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_extendedstatuscode
     */
    get_ExtendedStatusCode() {
        result := ComCall(12, this, "int*", &pExtendedStatusCode := 0, "HRESULT")
        return pExtendedStatusCode
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_extendedstatus
     */
    get_ExtendedStatus() {
        pbstrExtendedStatus := BSTR()
        result := ComCall(13, this, "ptr", pbstrExtendedStatus, "HRESULT")
        return pbstrExtendedStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_availableoperations
     */
    get_AvailableOperations() {
        result := ComCall(14, this, "int*", &pAvailableOperations := 0, "HRESULT")
        return pAvailableOperations
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_retries
     */
    get_Retries() {
        result := ComCall(15, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_transmissionstart
     */
    get_TransmissionStart() {
        result := ComCall(16, this, "double*", &pdateTransmissionStart := 0, "HRESULT")
        return pdateTransmissionStart
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_transmissionend
     */
    get_TransmissionEnd() {
        result := ComCall(17, this, "double*", &pdateTransmissionEnd := 0, "HRESULT")
        return pdateTransmissionEnd
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR()
        result := ComCall(18, this, "ptr", pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR()
        result := ComCall(19, this, "ptr", pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_callerid
     */
    get_CallerId() {
        pbstrCallerId := BSTR()
        result := ComCall(20, this, "ptr", pbstrCallerId, "HRESULT")
        return pbstrCallerId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_routinginformation
     */
    get_RoutingInformation() {
        pbstrRoutingInformation := BSTR()
        result := ComCall(21, this, "ptr", pbstrRoutingInformation, "HRESULT")
        return pbstrRoutingInformation
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_jobtype
     */
    get_JobType() {
        result := ComCall(22, this, "int*", &pJobType := 0, "HRESULT")
        return pJobType
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-cancel
     */
    Cancel() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-refresh
     */
    Refresh() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTiffPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-copytiff
     */
    CopyTiff(bstrTiffPath) {
        bstrTiffPath := bstrTiffPath is String ? BSTR.Alloc(bstrTiffPath).Value : bstrTiffPath

        result := ComCall(25, this, "ptr", bstrTiffPath, "HRESULT")
        return result
    }
}
