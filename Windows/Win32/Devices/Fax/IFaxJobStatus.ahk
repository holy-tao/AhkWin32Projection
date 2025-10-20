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
     * 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    get_Status(pStatus) {
        result := ComCall(7, this, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPages 
     * @returns {HRESULT} 
     */
    get_Pages(plPages) {
        result := ComCall(8, this, "int*", plPages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSize 
     * @returns {HRESULT} 
     */
    get_Size(plSize) {
        result := ComCall(9, this, "int*", plSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCurrentPage 
     * @returns {HRESULT} 
     */
    get_CurrentPage(plCurrentPage) {
        result := ComCall(10, this, "int*", plCurrentPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDeviceId 
     * @returns {HRESULT} 
     */
    get_DeviceId(plDeviceId) {
        result := ComCall(11, this, "int*", plDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCSID 
     * @returns {HRESULT} 
     */
    get_CSID(pbstrCSID) {
        result := ComCall(12, this, "ptr", pbstrCSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTSID 
     * @returns {HRESULT} 
     */
    get_TSID(pbstrTSID) {
        result := ComCall(13, this, "ptr", pbstrTSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pExtendedStatusCode 
     * @returns {HRESULT} 
     */
    get_ExtendedStatusCode(pExtendedStatusCode) {
        result := ComCall(14, this, "int*", pExtendedStatusCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrExtendedStatus 
     * @returns {HRESULT} 
     */
    get_ExtendedStatus(pbstrExtendedStatus) {
        result := ComCall(15, this, "ptr", pbstrExtendedStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pAvailableOperations 
     * @returns {HRESULT} 
     */
    get_AvailableOperations(pAvailableOperations) {
        result := ComCall(16, this, "int*", pAvailableOperations, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRetries 
     * @returns {HRESULT} 
     */
    get_Retries(plRetries) {
        result := ComCall(17, this, "int*", plRetries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pJobType 
     * @returns {HRESULT} 
     */
    get_JobType(pJobType) {
        result := ComCall(18, this, "int*", pJobType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateScheduledTime 
     * @returns {HRESULT} 
     */
    get_ScheduledTime(pdateScheduledTime) {
        result := ComCall(19, this, "double*", pdateScheduledTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateTransmissionStart 
     * @returns {HRESULT} 
     */
    get_TransmissionStart(pdateTransmissionStart) {
        result := ComCall(20, this, "double*", pdateTransmissionStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateTransmissionEnd 
     * @returns {HRESULT} 
     */
    get_TransmissionEnd(pdateTransmissionEnd) {
        result := ComCall(21, this, "double*", pdateTransmissionEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCallerId 
     * @returns {HRESULT} 
     */
    get_CallerId(pbstrCallerId) {
        result := ComCall(22, this, "ptr", pbstrCallerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRoutingInformation 
     * @returns {HRESULT} 
     */
    get_RoutingInformation(pbstrRoutingInformation) {
        result := ComCall(23, this, "ptr", pbstrRoutingInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
