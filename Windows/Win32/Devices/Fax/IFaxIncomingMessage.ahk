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
     * @type {BSTR} 
     */
    Id {
        get => this.get_Id()
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
     * @type {BSTR} 
     */
    DeviceName {
        get => this.get_DeviceName()
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
     * The Id property is a null-terminated string that contains a unique ID for the inbound fax message.
     * @remarks
     * 
     * Note that this is the same value that identified the associated fax job when the job was in the job queue.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-get_id
     */
    get_Id() {
        pbstrId := BSTR()
        result := ComCall(7, this, "ptr", pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * The Pages property is a value that indicates the total number of pages in the inbound fax message.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-get_pages
     */
    get_Pages() {
        result := ComCall(8, this, "int*", &plPages := 0, "HRESULT")
        return plPages
    }

    /**
     * The Size property is a value that indicates the size of the Tagged Image File Format Class F (TIFF Class F) file associated with the inbound fax message.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-get_size
     */
    get_Size() {
        result := ComCall(9, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * The DeviceName property is a null-terminated string that contains the name of the device on which the inbound fax message was received.
     * @remarks
     * 
     * This method returns the name of the fax device rather than the device ID. This is useful because an administrator may remove the device ID after completion of the fax job and before the client's query of the archive of inbound fax messages.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-get_devicename
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR()
        result := ComCall(10, this, "ptr", pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * The Retries property is a value that indicates the number of times that the fax service attempted to route an inbound fax message after the initial routing attempt failed.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-get_retries
     */
    get_Retries() {
        result := ComCall(11, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * The TransmissionStart property indicates the time that the inbound fax message began transmitting.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-get_transmissionstart
     */
    get_TransmissionStart() {
        result := ComCall(12, this, "double*", &pdateTransmissionStart := 0, "HRESULT")
        return pdateTransmissionStart
    }

    /**
     * The TransmissionEnd property indicates the time that the inbound fax message completed transmission.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-get_transmissionend
     */
    get_TransmissionEnd() {
        result := ComCall(13, this, "double*", &pdateTransmissionEnd := 0, "HRESULT")
        return pdateTransmissionEnd
    }

    /**
     * The CSID property is a null-terminated string that contains the called station identifier (CSID) for the inbound fax message.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR()
        result := ComCall(14, this, "ptr", pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * The TSID property is a null-terminated string that contains the transmitting station identifier (TSID) associated with the inbound fax message.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR()
        result := ComCall(15, this, "ptr", pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * The CallerId property is a null-terminated string that identifies the calling device associated with the inbound fax message.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-get_callerid
     */
    get_CallerId() {
        pbstrCallerId := BSTR()
        result := ComCall(16, this, "ptr", pbstrCallerId, "HRESULT")
        return pbstrCallerId
    }

    /**
     * The RoutingInformation property is a null-terminated string that indicates inbound routing information for the fax message.
     * @remarks
     * 
     * For more information about routing information, see the <a href="https://docs.microsoft.com/windows/desktop/api/faxdev/ns-faxdev-fax_dev_status">RoutingInfo</a> member of the <b>FAX_DEV_STATUS</b> structure.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-get_routinginformation
     */
    get_RoutingInformation() {
        pbstrRoutingInformation := BSTR()
        result := ComCall(17, this, "ptr", pbstrRoutingInformation, "HRESULT")
        return pbstrRoutingInformation
    }

    /**
     * The CopyTiff method copies the Tagged Image File Format Class F (TIFF Class F) file associated with the inbound fax message to a file on the local computer.
     * @param {BSTR} bstrTiffPath Type: <b>BSTR</b>
     * 
     * Null-terminated <b>BSTR</b> that specifies a fully qualified path and file name on the local computer. The fax service will copy the TIFF Class F file associated with the inbound fax message to the specified file.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-copytiff
     */
    CopyTiff(bstrTiffPath) {
        bstrTiffPath := bstrTiffPath is String ? BSTR.Alloc(bstrTiffPath).Value : bstrTiffPath

        result := ComCall(18, this, "ptr", bstrTiffPath, "HRESULT")
        return result
    }

    /**
     * The Delete method deletes the specified fax message from the inbound fax archive.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxincomingmessage-delete
     */
    Delete() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
