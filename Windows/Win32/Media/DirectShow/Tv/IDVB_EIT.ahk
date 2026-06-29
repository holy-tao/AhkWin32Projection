#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMpeg2Data.ahk" { IMpeg2Data }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MPEG_TIME.ahk" { MPEG_TIME }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\MPEG_DATE_AND_TIME.ahk" { MPEG_DATE_AND_TIME }
#Import ".\IGenericDescriptor.ahk" { IGenericDescriptor }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ISectionList.ahk" { ISectionList }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvb_eit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDVB_EIT extends IUnknown {
    /**
     * The interface identifier for IDVB_EIT
     * @type {Guid}
     */
    static IID := Guid("{442db029-02cb-4495-8b92-1c13375bce99}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVB_EIT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                  : IntPtr
        GetVersionNumber            : IntPtr
        GetServiceId                : IntPtr
        GetTransportStreamId        : IntPtr
        GetOriginalNetworkId        : IntPtr
        GetSegmentLastSectionNumber : IntPtr
        GetLastTableId              : IntPtr
        GetCountOfRecords           : IntPtr
        GetRecordEventId            : IntPtr
        GetRecordStartTime          : IntPtr
        GetRecordDuration           : IntPtr
        GetRecordRunningStatus      : IntPtr
        GetRecordFreeCAMode         : IntPtr
        GetRecordCountOfDescriptors : IntPtr
        GetRecordDescriptorByIndex  : IntPtr
        GetRecordDescriptorByTag    : IntPtr
        RegisterForNextTable        : IntPtr
        GetNextTable                : IntPtr
        RegisterForWhenCurrent      : IntPtr
        ConvertNextToCurrent        : IntPtr
        GetVersionHash              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVB_EIT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface of the <b>SectionList</b> object that contains the section data.
     * @param {IMpeg2Data} pMPEGData Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the MPEG-2 Sections and Tables filter.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is already initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Pointer to a variable that receives the version_number field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Pointer to a variable that receives the service_id field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getserviceid
     */
    GetServiceId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Pointer to a variable that receives the transport_stream_id field. This value identifies the transport stream from other transport streams in the multiplex.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-gettransportstreamid
     */
    GetTransportStreamId() {
        result := ComCall(6, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Pointer to a variable that receives the original_network_id field. This value identifies the network_id of the originating delivery system.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getoriginalnetworkid
     */
    GetOriginalNetworkId() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Pointer to a variable that receives the last_section_number field
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getsegmentlastsectionnumber
     */
    GetSegmentLastSectionNumber() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Pointer to a variable that receives the last_table_id field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getlasttableid
     */
    GetLastTableId() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Pointer to a variable that receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(10, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getcountofrecords">IDVB_EIT::GetCountOfRecords</a> to get the number of records in the EIT.
     * @returns {Integer} Pointer to a variable that receives the event_id field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getrecordeventid
     */
    GetRecordEventId(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getcountofrecords">IDVB_EIT::GetCountOfRecords</a> to get the number of records in the EIT.
     * @returns {MPEG_DATE_AND_TIME} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_date_and_time">MPEG_DATE_AND_TIME</a> structure allocated by the caller. The method fills the structure with the event start time.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getrecordstarttime
     */
    GetRecordStartTime(dwRecordIndex) {
        pmdtVal := MPEG_DATE_AND_TIME()
        result := ComCall(12, this, "uint", dwRecordIndex, MPEG_DATE_AND_TIME.Ptr, pmdtVal, "HRESULT")
        return pmdtVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getcountofrecords">IDVB_EIT::GetCountOfRecords</a> to get the number of records in the EIT.
     * @returns {MPEG_TIME} Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd390732(v=vs.85)">MPEG_DURATION</a> structure allocated by the caller. The method fills the structure with the event duration.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getrecordduration
     */
    GetRecordDuration(dwRecordIndex) {
        pmdVal := MPEG_TIME()
        result := ComCall(13, this, "uint", dwRecordIndex, MPEG_TIME.Ptr, pmdVal, "HRESULT")
        return pmdVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number for the event, indexed from zero. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getcountofrecords">IDVB_EIT::GetCountOfRecords</a> to get the number of records in the EIT.
     * @returns {Integer} Pointer to a variable that receives the running_status field. See the Remarks section in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_rst-getrecordrunningstatus">IDVB_RST::GetRecordRunningStatus</a> method for more information.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getrecordrunningstatus
     */
    GetRecordRunningStatus(dwRecordIndex) {
        result := ComCall(14, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number for the event, indexed from zero. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getcountofrecords">IDVB_EIT::GetCountOfRecords</a> to get the number of records in the EIT.
     * @returns {BOOL} Pointer to a variable that receives a Boolean value. The value is <b>TRUE</b> if the free_CA_mode bit is set, which indicates that one or more streams are scrambled. Otherwise, the value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getrecordfreecamode
     */
    GetRecordFreeCAMode(dwRecordIndex) {
        result := ComCall(15, this, "uint", dwRecordIndex, BOOL.Ptr, &pfVal := 0, "HRESULT")
        return pfVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getcountofrecords">IDVB_EIT::GetCountOfRecords</a> to get the number of records in the EIT.
     * @returns {Integer} Pointer to a variable that receives the number of descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(16, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getcountofrecords">IDVB_EIT::GetCountOfRecords</a> to get the number of records in the EIT.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getrecordcountofdescriptors">IDVB_EIT::GetRecordCountOfDescriptors</a> method to get the number of descriptors for a particular record.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface pointer. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(17, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * If the value of <i>pdwCookie</i> is not <b>NULL</b>, the method returns either MPEG2_S_NO_MORE_DATA_AVAILABLE or MPEG2_S_MORE_DATA_AVAILABLE to indicate whether the record contains additional tags that match the search criteria.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getcountofrecords">IDVB_EIT::GetCountOfRecords</a> to get the number of records in the EIT.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position in the descriptor list. This parameter is optional. If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the first descriptor in the list. Otherwise, the search starts from the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor, if any. You can use this parameter to iterate through the descriptor list, looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface pointer. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method applies only to <i>current</i> tables. Otherwise, the method returns E_ACCESSDENIED.
     * @param {HANDLE} hNextTableAvailable Handle to an event created by the caller. The object signals the event when the next table arrives. When the event is signaled, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getnexttable">IDVB_EIT::GetNextTable</a> method to retrieve the table.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This table is already a <i>next</i> table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument; <i>hNextTableAvailable</i> cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method has already been called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-registerfornexttable
     */
    RegisterForNextTable(hNextTableAvailable) {
        result := ComCall(19, this, HANDLE, hNextTableAvailable, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method applies only to current tables. Otherwise, the method returns E_ACCESSDENIED.
     * @returns {IDVB_EIT} Address of a variable that receives an <b>IDVB_EIT</b> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getnexttable
     */
    GetNextTable() {
        result := ComCall(20, this, "ptr*", &ppEIT := 0, "HRESULT")
        return IDVB_EIT(ppEIT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method applies only to <i>next</i> tables. Otherwise, the method returns E_ACCESSDENIED.
     * @param {HANDLE} hNextTableIsCurrent Handle to an event created by the caller. The object signals the event when the table becomes current.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This table is already a <i>current</i> table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument; <i>hNextTableIsCurrent</i> cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method has already been called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-registerforwhencurrent
     */
    RegisterForWhenCurrent(hNextTableIsCurrent) {
        result := ComCall(21, this, HANDLE, hNextTableIsCurrent, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method applies only to <i>next</i> tables that have become current. Before calling this method, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-registerforwhencurrent">IDVB_EIT::RegisterForWhenCurrent</a> and wait for the event to be signaled.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This table is already current.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>RegisterForWhenCurrent</b> method was not called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_MALFORMED_TABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new <i>current</i> table is malformed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-convertnexttocurrent
     */
    ConvertNextToCurrent() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the hash value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getversionhash
     */
    GetVersionHash() {
        result := ComCall(23, this, "uint*", &pdwVersionHash := 0, "HRESULT")
        return pdwVersionHash
    }

    Query(iid) {
        if (IDVB_EIT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetVersionNumber := CallbackCreate(GetMethod(implObj, "GetVersionNumber"), flags, 2)
        this.vtbl.GetServiceId := CallbackCreate(GetMethod(implObj, "GetServiceId"), flags, 2)
        this.vtbl.GetTransportStreamId := CallbackCreate(GetMethod(implObj, "GetTransportStreamId"), flags, 2)
        this.vtbl.GetOriginalNetworkId := CallbackCreate(GetMethod(implObj, "GetOriginalNetworkId"), flags, 2)
        this.vtbl.GetSegmentLastSectionNumber := CallbackCreate(GetMethod(implObj, "GetSegmentLastSectionNumber"), flags, 2)
        this.vtbl.GetLastTableId := CallbackCreate(GetMethod(implObj, "GetLastTableId"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordEventId := CallbackCreate(GetMethod(implObj, "GetRecordEventId"), flags, 3)
        this.vtbl.GetRecordStartTime := CallbackCreate(GetMethod(implObj, "GetRecordStartTime"), flags, 3)
        this.vtbl.GetRecordDuration := CallbackCreate(GetMethod(implObj, "GetRecordDuration"), flags, 3)
        this.vtbl.GetRecordRunningStatus := CallbackCreate(GetMethod(implObj, "GetRecordRunningStatus"), flags, 3)
        this.vtbl.GetRecordFreeCAMode := CallbackCreate(GetMethod(implObj, "GetRecordFreeCAMode"), flags, 3)
        this.vtbl.GetRecordCountOfDescriptors := CallbackCreate(GetMethod(implObj, "GetRecordCountOfDescriptors"), flags, 3)
        this.vtbl.GetRecordDescriptorByIndex := CallbackCreate(GetMethod(implObj, "GetRecordDescriptorByIndex"), flags, 4)
        this.vtbl.GetRecordDescriptorByTag := CallbackCreate(GetMethod(implObj, "GetRecordDescriptorByTag"), flags, 5)
        this.vtbl.RegisterForNextTable := CallbackCreate(GetMethod(implObj, "RegisterForNextTable"), flags, 2)
        this.vtbl.GetNextTable := CallbackCreate(GetMethod(implObj, "GetNextTable"), flags, 2)
        this.vtbl.RegisterForWhenCurrent := CallbackCreate(GetMethod(implObj, "RegisterForWhenCurrent"), flags, 2)
        this.vtbl.ConvertNextToCurrent := CallbackCreate(GetMethod(implObj, "ConvertNextToCurrent"), flags, 1)
        this.vtbl.GetVersionHash := CallbackCreate(GetMethod(implObj, "GetVersionHash"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetVersionNumber)
        CallbackFree(this.vtbl.GetServiceId)
        CallbackFree(this.vtbl.GetTransportStreamId)
        CallbackFree(this.vtbl.GetOriginalNetworkId)
        CallbackFree(this.vtbl.GetSegmentLastSectionNumber)
        CallbackFree(this.vtbl.GetLastTableId)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordEventId)
        CallbackFree(this.vtbl.GetRecordStartTime)
        CallbackFree(this.vtbl.GetRecordDuration)
        CallbackFree(this.vtbl.GetRecordRunningStatus)
        CallbackFree(this.vtbl.GetRecordFreeCAMode)
        CallbackFree(this.vtbl.GetRecordCountOfDescriptors)
        CallbackFree(this.vtbl.GetRecordDescriptorByIndex)
        CallbackFree(this.vtbl.GetRecordDescriptorByTag)
        CallbackFree(this.vtbl.RegisterForNextTable)
        CallbackFree(this.vtbl.GetNextTable)
        CallbackFree(this.vtbl.RegisterForWhenCurrent)
        CallbackFree(this.vtbl.ConvertNextToCurrent)
        CallbackFree(this.vtbl.GetVersionHash)
    }
}
