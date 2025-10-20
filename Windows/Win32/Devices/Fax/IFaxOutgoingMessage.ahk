#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutgoingMessage interface describes an object that is used by a fax client application to retrieve information about a fax message in the archive of outbound faxes.
 * @remarks
 * 
  * A default implementation of <b>IFaxOutgoingMessage</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessage">FaxOutgoingMessage</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutgoingmessage
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutgoingMessage extends IDispatch{
    /**
     * The interface identifier for IFaxOutgoingMessage
     * @type {Guid}
     */
    static IID => Guid("{f0ea35de-caa5-4a7c-82c7-2b60ba5f2be2}")

    /**
     * The class identifier for FaxOutgoingMessage
     * @type {Guid}
     */
    static CLSID => Guid("{91b4a378-4ad8-4aef-a4dc-97d96e939a3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubmissionId 
     * @returns {HRESULT} 
     */
    get_SubmissionId(pbstrSubmissionId) {
        result := ComCall(7, this, "ptr", pbstrSubmissionId, "int")
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
     * @param {Pointer<BSTR>} pbstrSubject 
     * @returns {HRESULT} 
     */
    get_Subject(pbstrSubject) {
        result := ComCall(9, this, "ptr", pbstrSubject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDocumentName 
     * @returns {HRESULT} 
     */
    get_DocumentName(pbstrDocumentName) {
        result := ComCall(10, this, "ptr", pbstrDocumentName, "int")
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
        result := ComCall(11, this, "int*", plRetries, "int")
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
        result := ComCall(12, this, "int*", plPages, "int")
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
        result := ComCall(13, this, "int*", plSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateOriginalScheduledTime 
     * @returns {HRESULT} 
     */
    get_OriginalScheduledTime(pdateOriginalScheduledTime) {
        result := ComCall(14, this, "double*", pdateOriginalScheduledTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateSubmissionTime 
     * @returns {HRESULT} 
     */
    get_SubmissionTime(pdateSubmissionTime) {
        result := ComCall(15, this, "double*", pdateSubmissionTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPriority 
     * @returns {HRESULT} 
     */
    get_Priority(pPriority) {
        result := ComCall(16, this, "int*", pPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxSender>} ppFaxSender 
     * @returns {HRESULT} 
     */
    get_Sender(ppFaxSender) {
        result := ComCall(17, this, "ptr", ppFaxSender, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxRecipient>} ppFaxRecipient 
     * @returns {HRESULT} 
     */
    get_Recipient(ppFaxRecipient) {
        result := ComCall(18, this, "ptr", ppFaxRecipient, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDeviceName 
     * @returns {HRESULT} 
     */
    get_DeviceName(pbstrDeviceName) {
        result := ComCall(19, this, "ptr", pbstrDeviceName, "int")
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
     * @param {Pointer<BSTR>} pbstrCSID 
     * @returns {HRESULT} 
     */
    get_CSID(pbstrCSID) {
        result := ComCall(22, this, "ptr", pbstrCSID, "int")
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
        result := ComCall(23, this, "ptr", pbstrTSID, "int")
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

        result := ComCall(24, this, "ptr", bstrTiffPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(25, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
