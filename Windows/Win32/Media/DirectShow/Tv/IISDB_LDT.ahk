#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISectionList.ahk" { ISectionList }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGenericDescriptor.ahk" { IGenericDescriptor }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMpeg2Data.ahk" { IMpeg2Data }

/**
 * Implements methods that get information from an Integrated Services Digital Broadcasting (ISDB) linked description table (LDT). An LDT contains data used to collect reference information from other tables.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdb_ldt
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IISDB_LDT extends IUnknown {
    /**
     * The interface identifier for IISDB_LDT
     * @type {Guid}
     */
    static IID := Guid("{141a546b-02ff-4fb9-a3a3-2f074b74a9a9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IISDB_LDT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                  : IntPtr
        GetVersionNumber            : IntPtr
        GetOriginalServiceId        : IntPtr
        GetTransportStreamId        : IntPtr
        GetOriginalNetworkId        : IntPtr
        GetCountOfRecords           : IntPtr
        GetRecordDescriptionId      : IntPtr
        GetRecordCountOfDescriptors : IntPtr
        GetRecordDescriptorByIndex  : IntPtr
        GetRecordDescriptorByTag    : IntPtr
        GetVersionHash              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IISDB_LDT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the object using captured table section data for an Integrated Services Digital Broadcasting (ISDB) linked description table (LDT).
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface
     *   of the <b>SectionList</b> object that contains the section data.
     * @param {IMpeg2Data} pMPEGData Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the MPEG-2 Sections and Tables filter.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * Gets the version number for an Integrated Services Digital Broadcasting (ISDB) linked description table (LDT).
     * @returns {Integer} Receives the version_number field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the original_service_id field from an Integrated Services Digital Broadcasting (ISDB) linked description table (LDT).
     * @returns {Integer} Receives the original_service_id value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getoriginalserviceid
     */
    GetOriginalServiceId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Returns the transport stream identifier (TSID) for an Integrated Services Digital Broadcasting (ISDB) linked description table (LDT).
     * @returns {Integer} Receives the transport_stream_id field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-gettransportstreamid
     */
    GetTransportStreamId() {
        result := ComCall(6, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets an identifier that identifies the broadcaster that originated the MPEG-2 transport stream from an Integrated Services Digital Broadcasting (ISDB) linked description table (LDT).
     * @returns {Integer} Receives the original network ID.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getoriginalnetworkid
     */
    GetOriginalNetworkId() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) linked description table (LDT). An LDT contains data used to collect reference information from other tables.
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(8, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Gets the record description ID from an Integrated services Digital Broadcasting System (IDBS) linked description table (LDT). The description ID field identifies a collected description in the LDT.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getcountofrecords">IISDB_LDT::GetCountOfRecords</a> method to get the number of records in the LDT.
     * @returns {Integer} Receives the description_id field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getrecorddescriptionid
     */
    GetRecordDescriptionId(dwRecordIndex) {
        result := ComCall(9, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Returns the number of descriptors for a record in an Integrated Services Digital Broadcasting (ISDB) linked description table (LDT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getcountofrecords">IISDB_LDT::GetCountOfRecords</a> method to get the number of records in the LDT.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(10, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Returns a descriptor for a specified record in an Integrated Services Digital Broadcasting (ISDB) linked description table (LDT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getcountofrecords">IISDB_LDT::GetCountOfRecords</a> method to get the number of records in the LDT.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero.
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getrecordcountofdescriptors">IISDB_LDT::GetRecordCountOfDescriptors</a> method 
     * to get the number of descriptors for a particular record.
     * @returns {IGenericDescriptor} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface for the object that contains the LDT. Use this interface to retrieve the information in the descriptor. 
     * The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Searches a record in an Integrated Services Digital Broadcasting (ISDB) linked description table (LDT) for a specific descriptor tag.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getcountofrecords">IISDB_LDT::GetCountOfRecords</a> method to get the number of records in the LDT.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position
     *   in the descriptor list. This parameter is optional.
     *   If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the
     *   first descriptor in the list. Otherwise, the search starts from
     *   the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor,
     *   if any. You can use this parameter to iterate through the descriptor list,
     *   looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface of the object that contains the LDT. Use this interface to retrieve the information
     *   in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Returns a hash value for this instance of an Integrated Services Digital Broadcasting (ISDB) linked description table (LDT).
     * @returns {Integer} Receives the hash value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getversionhash
     */
    GetVersionHash() {
        result := ComCall(13, this, "uint*", &pdwVersionHash := 0, "HRESULT")
        return pdwVersionHash
    }

    Query(iid) {
        if (IISDB_LDT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetVersionNumber := CallbackCreate(GetMethod(implObj, "GetVersionNumber"), flags, 2)
        this.vtbl.GetOriginalServiceId := CallbackCreate(GetMethod(implObj, "GetOriginalServiceId"), flags, 2)
        this.vtbl.GetTransportStreamId := CallbackCreate(GetMethod(implObj, "GetTransportStreamId"), flags, 2)
        this.vtbl.GetOriginalNetworkId := CallbackCreate(GetMethod(implObj, "GetOriginalNetworkId"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordDescriptionId := CallbackCreate(GetMethod(implObj, "GetRecordDescriptionId"), flags, 3)
        this.vtbl.GetRecordCountOfDescriptors := CallbackCreate(GetMethod(implObj, "GetRecordCountOfDescriptors"), flags, 3)
        this.vtbl.GetRecordDescriptorByIndex := CallbackCreate(GetMethod(implObj, "GetRecordDescriptorByIndex"), flags, 4)
        this.vtbl.GetRecordDescriptorByTag := CallbackCreate(GetMethod(implObj, "GetRecordDescriptorByTag"), flags, 5)
        this.vtbl.GetVersionHash := CallbackCreate(GetMethod(implObj, "GetVersionHash"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetVersionNumber)
        CallbackFree(this.vtbl.GetOriginalServiceId)
        CallbackFree(this.vtbl.GetTransportStreamId)
        CallbackFree(this.vtbl.GetOriginalNetworkId)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordDescriptionId)
        CallbackFree(this.vtbl.GetRecordCountOfDescriptors)
        CallbackFree(this.vtbl.GetRecordDescriptorByIndex)
        CallbackFree(this.vtbl.GetRecordDescriptorByTag)
        CallbackFree(this.vtbl.GetVersionHash)
    }
}
