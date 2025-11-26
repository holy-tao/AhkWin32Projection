#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxJobStatus interface is used for notifications and to hold the dynamic information of the job.
 * @remarks
 * 
 * You do not create the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxjobstatus">FaxJobStatus</a> object. It is received as part of a notification when you implement <a href="https://docs.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-_ifaxaccountnotify-onincomingjobchanged">IFaxServerNotify::OnIncomingJobChanged</a> or <a href="https://msdn.microsoft.com/132747ed-04b4-4803-976c-5274d8c9f73d">IFaxServerNotify::OnOutgoingJobChanged</a>, which include a parameter of the type <b>FaxJobStatus</b>. When the event occurs and the implemented function is called, you receive this object containing the dynamic information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxjobstatus
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxJobStatus extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxJobStatus
     * @type {Guid}
     */
    static IID => Guid("{8b86f485-fd7f-4824-886b-40c5caa617cc}")

    /**
     * The class identifier for FaxJobStatus
     * @type {Guid}
     */
    static CLSID => Guid("{7bf222f4-be8d-442f-841d-6132742423bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_Pages", "get_Size", "get_CurrentPage", "get_DeviceId", "get_CSID", "get_TSID", "get_ExtendedStatusCode", "get_ExtendedStatus", "get_AvailableOperations", "get_Retries", "get_JobType", "get_ScheduledTime", "get_TransmissionStart", "get_TransmissionEnd", "get_CallerId", "get_RoutingInformation"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
     */
    Pages {
        get => this.get_Pages()
    }

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
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
     * @type {Integer} 
     */
    JobType {
        get => this.get_JobType()
    }

    /**
     * @type {Float} 
     */
    ScheduledTime {
        get => this.get_ScheduledTime()
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_status
     */
    get_Status() {
        result := ComCall(7, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_pages
     */
    get_Pages() {
        result := ComCall(8, this, "int*", &plPages := 0, "HRESULT")
        return plPages
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_size
     */
    get_Size() {
        result := ComCall(9, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_currentpage
     */
    get_CurrentPage() {
        result := ComCall(10, this, "int*", &plCurrentPage := 0, "HRESULT")
        return plCurrentPage
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_deviceid
     */
    get_DeviceId() {
        result := ComCall(11, this, "int*", &plDeviceId := 0, "HRESULT")
        return plDeviceId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR()
        result := ComCall(12, this, "ptr", pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR()
        result := ComCall(13, this, "ptr", pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_extendedstatuscode
     */
    get_ExtendedStatusCode() {
        result := ComCall(14, this, "int*", &pExtendedStatusCode := 0, "HRESULT")
        return pExtendedStatusCode
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_extendedstatus
     */
    get_ExtendedStatus() {
        pbstrExtendedStatus := BSTR()
        result := ComCall(15, this, "ptr", pbstrExtendedStatus, "HRESULT")
        return pbstrExtendedStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_availableoperations
     */
    get_AvailableOperations() {
        result := ComCall(16, this, "int*", &pAvailableOperations := 0, "HRESULT")
        return pAvailableOperations
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_retries
     */
    get_Retries() {
        result := ComCall(17, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_jobtype
     */
    get_JobType() {
        result := ComCall(18, this, "int*", &pJobType := 0, "HRESULT")
        return pJobType
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_scheduledtime
     */
    get_ScheduledTime() {
        result := ComCall(19, this, "double*", &pdateScheduledTime := 0, "HRESULT")
        return pdateScheduledTime
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_transmissionstart
     */
    get_TransmissionStart() {
        result := ComCall(20, this, "double*", &pdateTransmissionStart := 0, "HRESULT")
        return pdateTransmissionStart
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_transmissionend
     */
    get_TransmissionEnd() {
        result := ComCall(21, this, "double*", &pdateTransmissionEnd := 0, "HRESULT")
        return pdateTransmissionEnd
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_callerid
     */
    get_CallerId() {
        pbstrCallerId := BSTR()
        result := ComCall(22, this, "ptr", pbstrCallerId, "HRESULT")
        return pbstrCallerId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_routinginformation
     */
    get_RoutingInformation() {
        pbstrRoutingInformation := BSTR()
        result := ComCall(23, this, "ptr", pbstrRoutingInformation, "HRESULT")
        return pbstrRoutingInformation
    }
}
