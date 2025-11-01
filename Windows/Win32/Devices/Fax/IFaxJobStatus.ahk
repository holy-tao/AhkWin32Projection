#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_status
     */
    get_Status(pStatus) {
        result := ComCall(7, this, "int*", pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_pages
     */
    get_Pages(plPages) {
        result := ComCall(8, this, "int*", plPages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_size
     */
    get_Size(plSize) {
        result := ComCall(9, this, "int*", plSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCurrentPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_currentpage
     */
    get_CurrentPage(plCurrentPage) {
        result := ComCall(10, this, "int*", plCurrentPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plDeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_deviceid
     */
    get_DeviceId(plDeviceId) {
        result := ComCall(11, this, "int*", plDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_csid
     */
    get_CSID(pbstrCSID) {
        result := ComCall(12, this, "ptr", pbstrCSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_tsid
     */
    get_TSID(pbstrTSID) {
        result := ComCall(13, this, "ptr", pbstrTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pExtendedStatusCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_extendedstatuscode
     */
    get_ExtendedStatusCode(pExtendedStatusCode) {
        result := ComCall(14, this, "int*", pExtendedStatusCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrExtendedStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_extendedstatus
     */
    get_ExtendedStatus(pbstrExtendedStatus) {
        result := ComCall(15, this, "ptr", pbstrExtendedStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAvailableOperations 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_availableoperations
     */
    get_AvailableOperations(pAvailableOperations) {
        result := ComCall(16, this, "int*", pAvailableOperations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRetries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_retries
     */
    get_Retries(plRetries) {
        result := ComCall(17, this, "int*", plRetries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pJobType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_jobtype
     */
    get_JobType(pJobType) {
        result := ComCall(18, this, "int*", pJobType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateScheduledTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_scheduledtime
     */
    get_ScheduledTime(pdateScheduledTime) {
        result := ComCall(19, this, "double*", pdateScheduledTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateTransmissionStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_transmissionstart
     */
    get_TransmissionStart(pdateTransmissionStart) {
        result := ComCall(20, this, "double*", pdateTransmissionStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateTransmissionEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_transmissionend
     */
    get_TransmissionEnd(pdateTransmissionEnd) {
        result := ComCall(21, this, "double*", pdateTransmissionEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCallerId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_callerid
     */
    get_CallerId(pbstrCallerId) {
        result := ComCall(22, this, "ptr", pbstrCallerId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRoutingInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxjobstatus-get_routinginformation
     */
    get_RoutingInformation(pbstrRoutingInformation) {
        result := ComCall(23, this, "ptr", pbstrRoutingInformation, "HRESULT")
        return result
    }
}
