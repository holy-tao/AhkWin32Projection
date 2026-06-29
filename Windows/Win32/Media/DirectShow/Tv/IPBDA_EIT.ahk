#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\MPEG_TIME.ahk" { MPEG_TIME }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGenericDescriptor.ahk" { IGenericDescriptor }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MPEG_DATE_AND_TIME.ahk" { MPEG_DATE_AND_TIME }

/**
 * Implements methods that enable the client to get information from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream. The IPBDASiParser::GetEIT method returns a pointer to this interface.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-ipbda_eit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IPBDA_EIT extends IUnknown {
    /**
     * The interface identifier for IPBDA_EIT
     * @type {Guid}
     */
    static IID := Guid("{a35f2dea-098f-4ebd-984c-2bd4c3c8ce0a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPBDA_EIT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                  : IntPtr
        GetTableId                  : IntPtr
        GetVersionNumber            : IntPtr
        GetServiceIdx               : IntPtr
        GetCountOfRecords           : IntPtr
        GetRecordEventId            : IntPtr
        GetRecordStartTime          : IntPtr
        GetRecordDuration           : IntPtr
        GetRecordCountOfDescriptors : IntPtr
        GetRecordDescriptorByIndex  : IntPtr
        GetRecordDescriptorByTag    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPBDA_EIT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes an object that gets data from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} _size Specifies the buffer size for data used to initialize each section.
     * @param {Pointer<Integer>} pBuffer Specifies the buffer used to initialize each section.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-initialize
     */
    Initialize(_size, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", _size, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }

    /**
     * Gets the table identifier from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @returns {Integer} Receives the table identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-gettableid
     */
    GetTableId() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the version number from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @returns {Integer} Receives the version number.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the service identifier from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream. The service identifier identifies the service that contains the events.
     * @returns {Integer} Receives the service identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getserviceidx
     */
    GetServiceIdx() {
        result := ComCall(6, this, "uint*", &plwVal := 0, "HRESULT")
        return plwVal
    }

    /**
     * Receives the number of event records from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(7, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Receives the unique identifier from an event record in an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords">IPBDA_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {Integer} Receives the event identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordeventid
     */
    GetRecordEventId(dwRecordIndex) {
        result := ComCall(8, this, "uint", dwRecordIndex, "uint*", &plwVal := 0, "HRESULT")
        return plwVal
    }

    /**
     * Gets the start time from an event record in an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords">IPBDA_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {MPEG_DATE_AND_TIME} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_date_and_time">MPEG_DATE_AND_TIME</a> structure that receives the start time from the event record.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordstarttime
     */
    GetRecordStartTime(dwRecordIndex) {
        pmdtVal := MPEG_DATE_AND_TIME()
        result := ComCall(9, this, "uint", dwRecordIndex, MPEG_DATE_AND_TIME.Ptr, pmdtVal, "HRESULT")
        return pmdtVal
    }

    /**
     * Gets the duration from an event record in an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords">IPBDA_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {MPEG_TIME} Receives the event duration.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordduration
     */
    GetRecordDuration(dwRecordIndex) {
        pmdVal := MPEG_TIME()
        result := ComCall(10, this, "uint", dwRecordIndex, MPEG_TIME.Ptr, pmdVal, "HRESULT")
        return pmdVal
    }

    /**
     * Gets the number of event records from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords">IPBDA_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Retrieves a descriptor for a specified record in an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords">IPBDA_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @param {Integer} dwIndex Specifies the descriptor to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordcountofdescriptors">IPBDA_EIT::GetRecordCountOfDescriptors</a> method to get the number of descriptors for a particular record.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface pointer. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Searches a record in an event information table (EIT) from a Protected Broadcast Device Architecture (PBDA) transport stream for a descriptor with a specified descriptor tag.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords">IPBDA_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position in the descriptor list. This parameter is optional. If the value of *<i>pdwCookie</i> is <b>NULL</b>, the search starts from the first descriptor in the list. Otherwise, the search starts from the position given in *<i>pdwCookie</i>. When the method returns, the *<i>pdwCookie</i> parameter contains the position of the next matching descriptor, if any. You can use this parameter to iterate through the descriptor list, looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    Query(iid) {
        if (IPBDA_EIT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetTableId := CallbackCreate(GetMethod(implObj, "GetTableId"), flags, 2)
        this.vtbl.GetVersionNumber := CallbackCreate(GetMethod(implObj, "GetVersionNumber"), flags, 2)
        this.vtbl.GetServiceIdx := CallbackCreate(GetMethod(implObj, "GetServiceIdx"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordEventId := CallbackCreate(GetMethod(implObj, "GetRecordEventId"), flags, 3)
        this.vtbl.GetRecordStartTime := CallbackCreate(GetMethod(implObj, "GetRecordStartTime"), flags, 3)
        this.vtbl.GetRecordDuration := CallbackCreate(GetMethod(implObj, "GetRecordDuration"), flags, 3)
        this.vtbl.GetRecordCountOfDescriptors := CallbackCreate(GetMethod(implObj, "GetRecordCountOfDescriptors"), flags, 3)
        this.vtbl.GetRecordDescriptorByIndex := CallbackCreate(GetMethod(implObj, "GetRecordDescriptorByIndex"), flags, 4)
        this.vtbl.GetRecordDescriptorByTag := CallbackCreate(GetMethod(implObj, "GetRecordDescriptorByTag"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetTableId)
        CallbackFree(this.vtbl.GetVersionNumber)
        CallbackFree(this.vtbl.GetServiceIdx)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordEventId)
        CallbackFree(this.vtbl.GetRecordStartTime)
        CallbackFree(this.vtbl.GetRecordDuration)
        CallbackFree(this.vtbl.GetRecordCountOfDescriptors)
        CallbackFree(this.vtbl.GetRecordDescriptorByIndex)
        CallbackFree(this.vtbl.GetRecordDescriptorByTag)
    }
}
