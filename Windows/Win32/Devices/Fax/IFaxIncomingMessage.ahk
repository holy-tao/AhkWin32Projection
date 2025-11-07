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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_id
     */
    get_Id() {
        pbstrId := BSTR()
        result := ComCall(7, this, "ptr", pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_pages
     */
    get_Pages() {
        result := ComCall(8, this, "int*", &plPages := 0, "HRESULT")
        return plPages
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_size
     */
    get_Size() {
        result := ComCall(9, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_devicename
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR()
        result := ComCall(10, this, "ptr", pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_retries
     */
    get_Retries() {
        result := ComCall(11, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_transmissionstart
     */
    get_TransmissionStart() {
        result := ComCall(12, this, "double*", &pdateTransmissionStart := 0, "HRESULT")
        return pdateTransmissionStart
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_transmissionend
     */
    get_TransmissionEnd() {
        result := ComCall(13, this, "double*", &pdateTransmissionEnd := 0, "HRESULT")
        return pdateTransmissionEnd
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR()
        result := ComCall(14, this, "ptr", pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR()
        result := ComCall(15, this, "ptr", pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_callerid
     */
    get_CallerId() {
        pbstrCallerId := BSTR()
        result := ComCall(16, this, "ptr", pbstrCallerId, "HRESULT")
        return pbstrCallerId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_routinginformation
     */
    get_RoutingInformation() {
        pbstrRoutingInformation := BSTR()
        result := ComCall(17, this, "ptr", pbstrRoutingInformation, "HRESULT")
        return pbstrRoutingInformation
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
