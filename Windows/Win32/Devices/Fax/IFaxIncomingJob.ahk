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
     * 
     * @param {Pointer<Integer>} plSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_size
     */
    get_Size(plSize) {
        result := ComCall(7, this, "int*", plSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_id
     */
    get_Id(pbstrId) {
        result := ComCall(8, this, "ptr", pbstrId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCurrentPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_currentpage
     */
    get_CurrentPage(plCurrentPage) {
        result := ComCall(9, this, "int*", plCurrentPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plDeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_deviceid
     */
    get_DeviceId(plDeviceId) {
        result := ComCall(10, this, "int*", plDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_status
     */
    get_Status(pStatus) {
        result := ComCall(11, this, "int*", pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pExtendedStatusCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_extendedstatuscode
     */
    get_ExtendedStatusCode(pExtendedStatusCode) {
        result := ComCall(12, this, "int*", pExtendedStatusCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrExtendedStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_extendedstatus
     */
    get_ExtendedStatus(pbstrExtendedStatus) {
        result := ComCall(13, this, "ptr", pbstrExtendedStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAvailableOperations 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_availableoperations
     */
    get_AvailableOperations(pAvailableOperations) {
        result := ComCall(14, this, "int*", pAvailableOperations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRetries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_retries
     */
    get_Retries(plRetries) {
        result := ComCall(15, this, "int*", plRetries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateTransmissionStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_transmissionstart
     */
    get_TransmissionStart(pdateTransmissionStart) {
        result := ComCall(16, this, "double*", pdateTransmissionStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateTransmissionEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_transmissionend
     */
    get_TransmissionEnd(pdateTransmissionEnd) {
        result := ComCall(17, this, "double*", pdateTransmissionEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_csid
     */
    get_CSID(pbstrCSID) {
        result := ComCall(18, this, "ptr", pbstrCSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_tsid
     */
    get_TSID(pbstrTSID) {
        result := ComCall(19, this, "ptr", pbstrTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCallerId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_callerid
     */
    get_CallerId(pbstrCallerId) {
        result := ComCall(20, this, "ptr", pbstrCallerId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRoutingInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_routinginformation
     */
    get_RoutingInformation(pbstrRoutingInformation) {
        result := ComCall(21, this, "ptr", pbstrRoutingInformation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pJobType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingjob-get_jobtype
     */
    get_JobType(pJobType) {
        result := ComCall(22, this, "int*", pJobType, "HRESULT")
        return result
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
