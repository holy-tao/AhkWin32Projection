#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\MPEG_TIME.ahk" { MPEG_TIME }
#Import ".\ISectionList.ahk" { ISectionList }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGenericDescriptor.ahk" { IGenericDescriptor }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMpeg2Data.ahk" { IMpeg2Data }
#Import ".\MPEG_DATE_AND_TIME.ahk" { MPEG_DATE_AND_TIME }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nn-atscpsipparser-iatsc_eit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IATSC_EIT extends IUnknown {
    /**
     * The interface identifier for IATSC_EIT
     * @type {Guid}
     */
    static IID := Guid("{d7c212d7-76a2-4b4b-aa56-846879a80096}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IATSC_EIT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                  : IntPtr
        GetVersionNumber            : IntPtr
        GetSourceId                 : IntPtr
        GetProtocolVersion          : IntPtr
        GetCountOfRecords           : IntPtr
        GetRecordEventId            : IntPtr
        GetRecordStartTime          : IntPtr
        GetRecordEtmLocation        : IntPtr
        GetRecordDuration           : IntPtr
        GetRecordTitleText          : IntPtr
        GetRecordCountOfDescriptors : IntPtr
        GetRecordDescriptorByIndex  : IntPtr
        GetRecordDescriptorByTag    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IATSC_EIT.Vtbl()
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
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the version_number field.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the source_id field.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getsourceid
     */
    GetSourceId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the protocol_version field.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getprotocolversion
     */
    GetProtocolVersion() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(7, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getcountofrecords">IATSC_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {Integer} Receives the event_id field.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getrecordeventid
     */
    GetRecordEventId(dwRecordIndex) {
        result := ComCall(8, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getcountofrecords">IATSC_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {MPEG_DATE_AND_TIME} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_date_and_time">MPEG_DATE_AND_TIME</a> structure allocated by the caller. The method fills the structure with the event start time.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getrecordstarttime
     */
    GetRecordStartTime(dwRecordIndex) {
        pmdtVal := MPEG_DATE_AND_TIME()
        result := ComCall(9, this, "uint", dwRecordIndex, MPEG_DATE_AND_TIME.Ptr, pmdtVal, "HRESULT")
        return pmdtVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getcountofrecords">IATSC_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {Integer} Receives the ETM_location field.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getrecordetmlocation
     */
    GetRecordEtmLocation(dwRecordIndex) {
        result := ComCall(10, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getcountofrecords">IATSC_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {MPEG_TIME} Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd390732(v=vs.85)">MPEG_DURATION</a> structure allocated by the caller. The method fills the structure with the event duration.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getrecordduration
     */
    GetRecordDuration(dwRecordIndex) {
        pmdVal := MPEG_TIME()
        result := ComCall(11, this, "uint", dwRecordIndex, MPEG_TIME.Ptr, pmdVal, "HRESULT")
        return pmdVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getcountofrecords">IATSC_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @param {Pointer<Integer>} pdwLength Receives the length of the title text, in bytes.
     * @param {Pointer<Pointer<Integer>>} ppText Receives a pointer to the text buffer. The method allocates the buffer and fills it with the title text, which is formatted as a Multiple String Structure as defined by ATSC PSIP Standard A/65. The caller must free the buffer by calling <b>CoTaskMemFree</b>.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_OUT_OF_BOUNDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Index out of bounds.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This record does not contain a title.
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
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getrecordtitletext
     */
    GetRecordTitleText(dwRecordIndex, pdwLength, ppText) {
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"
        ppTextMarshal := ppText is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "uint", dwRecordIndex, pdwLengthMarshal, pdwLength, ppTextMarshal, ppText, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getcountofrecords">IATSC_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(13, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getcountofrecords">IATSC_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getrecordcountofdescriptors">IATSC_EIT::GetRecordCountOfDescriptors</a> method to get the number of descriptors for a particular record.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(14, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * If the value of <i>pdwCookie</i> is not <b>NULL</b>, the method returns either MPEG2_S_NO_MORE_DATA_AVAILABLE or MPEG2_S_MORE_DATA_AVAILABLE to indicate whether the record contains additional tags that match the search criteria.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getcountofrecords">IATSC_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position in the descriptor list. This parameter is optional. If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the first descriptor in the list. Otherwise, the search starts from the position given in *<i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor, if any. You can use this parameter to iterate through the descriptor list, looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    Query(iid) {
        if (IATSC_EIT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetVersionNumber := CallbackCreate(GetMethod(implObj, "GetVersionNumber"), flags, 2)
        this.vtbl.GetSourceId := CallbackCreate(GetMethod(implObj, "GetSourceId"), flags, 2)
        this.vtbl.GetProtocolVersion := CallbackCreate(GetMethod(implObj, "GetProtocolVersion"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordEventId := CallbackCreate(GetMethod(implObj, "GetRecordEventId"), flags, 3)
        this.vtbl.GetRecordStartTime := CallbackCreate(GetMethod(implObj, "GetRecordStartTime"), flags, 3)
        this.vtbl.GetRecordEtmLocation := CallbackCreate(GetMethod(implObj, "GetRecordEtmLocation"), flags, 3)
        this.vtbl.GetRecordDuration := CallbackCreate(GetMethod(implObj, "GetRecordDuration"), flags, 3)
        this.vtbl.GetRecordTitleText := CallbackCreate(GetMethod(implObj, "GetRecordTitleText"), flags, 4)
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
        CallbackFree(this.vtbl.GetVersionNumber)
        CallbackFree(this.vtbl.GetSourceId)
        CallbackFree(this.vtbl.GetProtocolVersion)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordEventId)
        CallbackFree(this.vtbl.GetRecordStartTime)
        CallbackFree(this.vtbl.GetRecordEtmLocation)
        CallbackFree(this.vtbl.GetRecordDuration)
        CallbackFree(this.vtbl.GetRecordTitleText)
        CallbackFree(this.vtbl.GetRecordCountOfDescriptors)
        CallbackFree(this.vtbl.GetRecordDescriptorByIndex)
        CallbackFree(this.vtbl.GetRecordDescriptorByTag)
    }
}
