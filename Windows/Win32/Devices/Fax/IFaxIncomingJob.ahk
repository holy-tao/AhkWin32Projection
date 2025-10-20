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
     * 
     * @param {Pointer<Int32>} plSize 
     * @returns {HRESULT} 
     */
    get_Size(plSize) {
        result := ComCall(7, this, "int*", plSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrId 
     * @returns {HRESULT} 
     */
    get_Id(pbstrId) {
        result := ComCall(8, this, "ptr", pbstrId, "int")
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
        result := ComCall(9, this, "int*", plCurrentPage, "int")
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
        result := ComCall(10, this, "int*", plDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    get_Status(pStatus) {
        result := ComCall(11, this, "int*", pStatus, "int")
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
        result := ComCall(12, this, "int*", pExtendedStatusCode, "int")
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
        result := ComCall(13, this, "ptr", pbstrExtendedStatus, "int")
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
        result := ComCall(14, this, "int*", pAvailableOperations, "int")
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
        result := ComCall(15, this, "int*", plRetries, "int")
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
        result := ComCall(16, this, "double*", pdateTransmissionStart, "int")
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
        result := ComCall(17, this, "double*", pdateTransmissionEnd, "int")
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
        result := ComCall(18, this, "ptr", pbstrCSID, "int")
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
        result := ComCall(19, this, "ptr", pbstrTSID, "int")
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
        result := ComCall(20, this, "ptr", pbstrCallerId, "int")
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
        result := ComCall(21, this, "ptr", pbstrRoutingInformation, "int")
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
        result := ComCall(22, this, "int*", pJobType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(24, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTiffPath 
     * @returns {HRESULT} 
     */
    CopyTiff(bstrTiffPath) {
        bstrTiffPath := bstrTiffPath is String ? BSTR.Alloc(bstrTiffPath).Value : bstrTiffPath

        result := ComCall(25, this, "ptr", bstrTiffPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
