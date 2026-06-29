#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISectionList.ahk" { ISectionList }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGenericDescriptor.ahk" { IGenericDescriptor }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMpeg2Data.ahk" { IMpeg2Data }

/**
 * Implements methods that get information from an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT). A BIT contains a broadcaster unit and the service information transmission parameter for each broadcaster unit.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdb_bit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IISDB_BIT extends IUnknown {
    /**
     * The interface identifier for IISDB_BIT
     * @type {Guid}
     */
    static IID := Guid("{537cd71e-0e46-4173-9001-ba043f3e49e2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IISDB_BIT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                  : IntPtr
        GetVersionNumber            : IntPtr
        GetOriginalNetworkId        : IntPtr
        GetBroadcastViewPropriety   : IntPtr
        GetCountOfTableDescriptors  : IntPtr
        GetTableDescriptorByIndex   : IntPtr
        GetTableDescriptorByTag     : IntPtr
        GetCountOfRecords           : IntPtr
        GetRecordBroadcasterId      : IntPtr
        GetRecordCountOfDescriptors : IntPtr
        GetRecordDescriptorByIndex  : IntPtr
        GetRecordDescriptorByTag    : IntPtr
        GetVersionHash              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IISDB_BIT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the object by using captured table section data for an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface
     *   of the <b>SectionList</b> object that contains the section data.
     * @param {IMpeg2Data} pMPEGData Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the MPEG-2 Sections and Tables filter.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * Gets the version number for an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @returns {Integer} Receives the version_number field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets an identifier that identifies the broadcaster that originated the MPEG-2 transport stream from an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @returns {Integer} Receives the original network ID.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getoriginalnetworkid
     */
    GetOriginalNetworkId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Returns the broadcast_view_propriety flag from a record in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @returns {Integer} Receives the broadcast_view_propriety flag.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getbroadcastviewpropriety
     */
    GetBroadcastViewPropriety() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the broadcaster_descriptors_length field value from an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @returns {Integer} Receives the broadcaster_descriptors_length field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors() {
        result := ComCall(7, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Returns a descriptor for a specified table in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {Integer} dwIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountofrecords">IISDB_BIT::GetCountOfRecords</a> method to get the number of records in the BIT.
     * @returns {IGenericDescriptor} Specifies which descriptor to retrieve, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getrecordcountofdescriptors">IISDB_BIT::GetRecordCountOfDescriptors</a> method
     *   to get the number of descriptors for a particular record.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Searches a subtable in for an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position
     *   in the descriptor list. This parameter is optional.
     *   If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the
     *   first descriptor in the list. Otherwise, the search starts from
     *   the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor,
     *   if any. You can use this parameter to iterate through the descriptor list,
     *   looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor
     *   </a> interface pointer. Use this interface to retrieve the information
     *   in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(10, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Gets the broadcaster_id field from a record in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountofrecords">IISDB_BIT::GetCountOfRecords</a> method to get the number of records in the BIT.
     * @returns {Integer} Receives the broadcaster_id field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getrecordbroadcasterid
     */
    GetRecordBroadcasterId(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Returns the number of descriptors for subtables in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountofrecords">IISDB_BIT::GetCountOfRecords</a> 
     * 
     *   method to get the number of records in the BIT.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Returns a descriptor for a specified record in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountofrecords">IISDB_BIT::GetCountOfRecords</a> method to get the number
     *   of records in the BIT.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getrecordcountofdescriptors">IISDB_BIT::GetRecordCountOfDescriptors</a> method
     *   to get the number of descriptors for a particular record.
     * @returns {IGenericDescriptor} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface implemented by the descriptor.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(13, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Searches a record in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountofrecords">IISDB_BIT::GetCountOfRecords</a> method to get the number of records in the BIT.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position
     *   in the descriptor list. This parameter is optional.
     *   If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the
     *   first descriptor in the list. Otherwise, the search starts from
     *   the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor,
     *   if any. You can use this parameter to iterate through the descriptor list,
     *   looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor
     *   </a> interface pointer. Use this interface to retrieve the information
     *   in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Returns a hash value for this instance of an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @returns {Integer} Receives the hash value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getversionhash
     */
    GetVersionHash() {
        result := ComCall(15, this, "uint*", &pdwVersionHash := 0, "HRESULT")
        return pdwVersionHash
    }

    Query(iid) {
        if (IISDB_BIT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetVersionNumber := CallbackCreate(GetMethod(implObj, "GetVersionNumber"), flags, 2)
        this.vtbl.GetOriginalNetworkId := CallbackCreate(GetMethod(implObj, "GetOriginalNetworkId"), flags, 2)
        this.vtbl.GetBroadcastViewPropriety := CallbackCreate(GetMethod(implObj, "GetBroadcastViewPropriety"), flags, 2)
        this.vtbl.GetCountOfTableDescriptors := CallbackCreate(GetMethod(implObj, "GetCountOfTableDescriptors"), flags, 2)
        this.vtbl.GetTableDescriptorByIndex := CallbackCreate(GetMethod(implObj, "GetTableDescriptorByIndex"), flags, 3)
        this.vtbl.GetTableDescriptorByTag := CallbackCreate(GetMethod(implObj, "GetTableDescriptorByTag"), flags, 4)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordBroadcasterId := CallbackCreate(GetMethod(implObj, "GetRecordBroadcasterId"), flags, 3)
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
        CallbackFree(this.vtbl.GetOriginalNetworkId)
        CallbackFree(this.vtbl.GetBroadcastViewPropriety)
        CallbackFree(this.vtbl.GetCountOfTableDescriptors)
        CallbackFree(this.vtbl.GetTableDescriptorByIndex)
        CallbackFree(this.vtbl.GetTableDescriptorByTag)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordBroadcasterId)
        CallbackFree(this.vtbl.GetRecordCountOfDescriptors)
        CallbackFree(this.vtbl.GetRecordDescriptorByIndex)
        CallbackFree(this.vtbl.GetRecordDescriptorByTag)
        CallbackFree(this.vtbl.GetVersionHash)
    }
}
