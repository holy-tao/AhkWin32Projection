#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Used by a fax client application to retrieve information about a received fax message in the archive of inbound faxes. (IFaxIncomingMessage)
 * @remarks
 * To create a <b>FaxIncomingMessage</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingarchive-getmessage-vb">IFaxIncomingArchive::GetMessage</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessageiterator-message-vb">IFaxIncomingMessageIterator::get_Message</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxincomingmessage
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxIncomingMessage extends IDispatch {
    /**
     * The interface identifier for IFaxIncomingMessage
     * @type {Guid}
     */
    static IID := Guid("{7cab88fa-2ef9-4851-b2f3-1d148fed8447}")

    /**
     * The class identifier for FaxIncomingMessage
     * @type {Guid}
     */
    static CLSID := Guid("{1932fcf7-9d43-4d5a-89ff-03861b321736}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxIncomingMessage interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Id                 : IntPtr
        get_Pages              : IntPtr
        get_Size               : IntPtr
        get_DeviceName         : IntPtr
        get_Retries            : IntPtr
        get_TransmissionStart  : IntPtr
        get_TransmissionEnd    : IntPtr
        get_CSID               : IntPtr
        get_TSID               : IntPtr
        get_CallerId           : IntPtr
        get_RoutingInformation : IntPtr
        CopyTiff               : IntPtr
        Delete                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxIncomingMessage.Vtbl()
        }
        super.__New(implObj, flags)
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
     * Note that this is the same value that identified the associated fax job when the job was in the job queue.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_id
     */
    get_Id() {
        pbstrId := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * The Pages property is a value that indicates the total number of pages in the inbound fax message.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_pages
     */
    get_Pages() {
        result := ComCall(8, this, "int*", &plPages := 0, "HRESULT")
        return plPages
    }

    /**
     * The Size property is a value that indicates the size of the Tagged Image File Format Class F (TIFF Class F) file associated with the inbound fax message.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_size
     */
    get_Size() {
        result := ComCall(9, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * The DeviceName property is a null-terminated string that contains the name of the device on which the inbound fax message was received.
     * @remarks
     * This method returns the name of the fax device rather than the device ID. This is useful because an administrator may remove the device ID after completion of the fax job and before the client's query of the archive of inbound fax messages.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_devicename
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * The Retries property is a value that indicates the number of times that the fax service attempted to route an inbound fax message after the initial routing attempt failed.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_retries
     */
    get_Retries() {
        result := ComCall(11, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * The TransmissionStart property indicates the time that the inbound fax message began transmitting.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_transmissionstart
     */
    get_TransmissionStart() {
        result := ComCall(12, this, "double*", &pdateTransmissionStart := 0, "HRESULT")
        return pdateTransmissionStart
    }

    /**
     * The TransmissionEnd property indicates the time that the inbound fax message completed transmission.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_transmissionend
     */
    get_TransmissionEnd() {
        result := ComCall(13, this, "double*", &pdateTransmissionEnd := 0, "HRESULT")
        return pdateTransmissionEnd
    }

    /**
     * The CSID property is a null-terminated string that contains the called station identifier (CSID) for the inbound fax message.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * The TSID property is a null-terminated string that contains the transmitting station identifier (TSID) associated with the inbound fax message.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * The CallerId property is a null-terminated string that identifies the calling device associated with the inbound fax message.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_callerid
     */
    get_CallerId() {
        pbstrCallerId := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, pbstrCallerId, "HRESULT")
        return pbstrCallerId
    }

    /**
     * The RoutingInformation property is a null-terminated string that indicates inbound routing information for the fax message.
     * @remarks
     * For more information about routing information, see the <a href="https://docs.microsoft.com/windows/desktop/api/faxdev/ns-faxdev-fax_dev_status">RoutingInfo</a> member of the <b>FAX_DEV_STATUS</b> structure.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-get_routinginformation
     */
    get_RoutingInformation() {
        pbstrRoutingInformation := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pbstrRoutingInformation, "HRESULT")
        return pbstrRoutingInformation
    }

    /**
     * The CopyTiff method copies the Tagged Image File Format Class F (TIFF Class F) file associated with the inbound fax message to a file on the local computer.
     * @param {BSTR} bstrTiffPath Type: <b>BSTR</b>
     * 
     * Null-terminated <b>BSTR</b> that specifies a fully qualified path and file name on the local computer. The fax service will copy the TIFF Class F file associated with the inbound fax message to the specified file.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-copytiff
     */
    CopyTiff(bstrTiffPath) {
        bstrTiffPath := bstrTiffPath is String ? BSTR.Alloc(bstrTiffPath).Value : bstrTiffPath

        result := ComCall(18, this, BSTR, bstrTiffPath, "HRESULT")
        return result
    }

    /**
     * The Delete method deletes the specified fax message from the inbound fax archive.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_IN_ARCHIVE</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessage-delete
     */
    Delete() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxIncomingMessage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_Pages := CallbackCreate(GetMethod(implObj, "get_Pages"), flags, 2)
        this.vtbl.get_Size := CallbackCreate(GetMethod(implObj, "get_Size"), flags, 2)
        this.vtbl.get_DeviceName := CallbackCreate(GetMethod(implObj, "get_DeviceName"), flags, 2)
        this.vtbl.get_Retries := CallbackCreate(GetMethod(implObj, "get_Retries"), flags, 2)
        this.vtbl.get_TransmissionStart := CallbackCreate(GetMethod(implObj, "get_TransmissionStart"), flags, 2)
        this.vtbl.get_TransmissionEnd := CallbackCreate(GetMethod(implObj, "get_TransmissionEnd"), flags, 2)
        this.vtbl.get_CSID := CallbackCreate(GetMethod(implObj, "get_CSID"), flags, 2)
        this.vtbl.get_TSID := CallbackCreate(GetMethod(implObj, "get_TSID"), flags, 2)
        this.vtbl.get_CallerId := CallbackCreate(GetMethod(implObj, "get_CallerId"), flags, 2)
        this.vtbl.get_RoutingInformation := CallbackCreate(GetMethod(implObj, "get_RoutingInformation"), flags, 2)
        this.vtbl.CopyTiff := CallbackCreate(GetMethod(implObj, "CopyTiff"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_Pages)
        CallbackFree(this.vtbl.get_Size)
        CallbackFree(this.vtbl.get_DeviceName)
        CallbackFree(this.vtbl.get_Retries)
        CallbackFree(this.vtbl.get_TransmissionStart)
        CallbackFree(this.vtbl.get_TransmissionEnd)
        CallbackFree(this.vtbl.get_CSID)
        CallbackFree(this.vtbl.get_TSID)
        CallbackFree(this.vtbl.get_CallerId)
        CallbackFree(this.vtbl.get_RoutingInformation)
        CallbackFree(this.vtbl.CopyTiff)
        CallbackFree(this.vtbl.Delete)
    }
}
