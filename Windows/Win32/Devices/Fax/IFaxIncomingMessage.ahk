#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used by a fax client application to retrieve information about a received fax message in the archive of inbound faxes.
 * @remarks
 * 
  * To create a <b>FaxIncomingMessage</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingarchive-getmessage-vb">IFaxIncomingArchive::GetMessage</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessageiterator-message-vb">IFaxIncomingMessageIterator::get_Message</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxincomingmessage
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxIncomingMessage extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxIncomingMessage
     * @type {Guid}
     */
    static IID => Guid("{7cab88fa-2ef9-4851-b2f3-1d148fed8447}")

    /**
     * The class identifier for FaxIncomingMessage
     * @type {Guid}
     */
    static CLSID => Guid("{1932fcf7-9d43-4d5a-89ff-03861b321736}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Pages", "get_Size", "get_DeviceName", "get_Retries", "get_TransmissionStart", "get_TransmissionEnd", "get_CSID", "get_TSID", "get_CallerId", "get_RoutingInformation", "CopyTiff", "Delete"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_id
     */
    get_Id(pbstrId) {
        result := ComCall(7, this, "ptr", pbstrId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_pages
     */
    get_Pages(plPages) {
        result := ComCall(8, this, "int*", plPages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_size
     */
    get_Size(plSize) {
        result := ComCall(9, this, "int*", plSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDeviceName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_devicename
     */
    get_DeviceName(pbstrDeviceName) {
        result := ComCall(10, this, "ptr", pbstrDeviceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRetries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_retries
     */
    get_Retries(plRetries) {
        result := ComCall(11, this, "int*", plRetries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateTransmissionStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_transmissionstart
     */
    get_TransmissionStart(pdateTransmissionStart) {
        result := ComCall(12, this, "double*", pdateTransmissionStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateTransmissionEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_transmissionend
     */
    get_TransmissionEnd(pdateTransmissionEnd) {
        result := ComCall(13, this, "double*", pdateTransmissionEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_csid
     */
    get_CSID(pbstrCSID) {
        result := ComCall(14, this, "ptr", pbstrCSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_tsid
     */
    get_TSID(pbstrTSID) {
        result := ComCall(15, this, "ptr", pbstrTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCallerId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_callerid
     */
    get_CallerId(pbstrCallerId) {
        result := ComCall(16, this, "ptr", pbstrCallerId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRoutingInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_routinginformation
     */
    get_RoutingInformation(pbstrRoutingInformation) {
        result := ComCall(17, this, "ptr", pbstrRoutingInformation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTiffPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-copytiff
     */
    CopyTiff(bstrTiffPath) {
        bstrTiffPath := bstrTiffPath is String ? BSTR.Alloc(bstrTiffPath).Value : bstrTiffPath

        result := ComCall(18, this, "ptr", bstrTiffPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-delete
     */
    Delete() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
