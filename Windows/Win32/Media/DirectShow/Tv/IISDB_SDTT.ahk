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
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT). An SDTT contains download information such as service ID, schedule, and receiver types for revision.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdb_sdtt
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IISDB_SDTT extends IUnknown {
    /**
     * The interface identifier for IISDB_SDTT
     * @type {Guid}
     */
    static IID := Guid("{ee60ef2d-813a-4dc7-bf92-ea13dac85313}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IISDB_SDTT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                            : IntPtr
        GetVersionNumber                      : IntPtr
        GetTableIdExt                         : IntPtr
        GetTransportStreamId                  : IntPtr
        GetOriginalNetworkId                  : IntPtr
        GetServiceId                          : IntPtr
        GetCountOfRecords                     : IntPtr
        GetRecordGroup                        : IntPtr
        GetRecordTargetVersion                : IntPtr
        GetRecordNewVersion                   : IntPtr
        GetRecordDownloadLevel                : IntPtr
        GetRecordVersionIndicator             : IntPtr
        GetRecordScheduleTimeShiftInformation : IntPtr
        GetRecordCountOfSchedules             : IntPtr
        GetRecordStartTimeByIndex             : IntPtr
        GetRecordDurationByIndex              : IntPtr
        GetRecordCountOfDescriptors           : IntPtr
        GetRecordDescriptorByIndex            : IntPtr
        GetRecordDescriptorByTag              : IntPtr
        GetVersionHash                        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IISDB_SDTT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the object by using captured table section data from an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface
     *   of the object that contains the section data.
     * @param {IMpeg2Data} pMPEGData Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/mpeg-2-sections-and-tables-filter">MPEG-2 Sections and Tables</a> filter.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * Gets the version number for an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @returns {Integer} Receives the version number.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the table_id_extension field value from an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT). This field value identifies a specific instance of an SDTT.
     * @returns {Integer} Receives the table_id_extension field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-gettableidext
     */
    GetTableIdExt() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Returns the transport stream identifier (TSID) for an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @returns {Integer} Receives the transport_stream_id field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-gettransportstreamid
     */
    GetTransportStreamId() {
        result := ComCall(6, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets an identifier that identifies the broadcaster that originated the MPEG-2 transport stream from an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @returns {Integer} Receives the original network ID.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getoriginalnetworkid
     */
    GetOriginalNetworkId() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Receives the service_id field that uniquely identifies a service from an Integrated Services Digital Broadcasting System (ISDB) software download trigger table (SDTT).
     * @returns {Integer} Receives the service_id value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getserviceid
     */
    GetServiceId() {
        result := ComCall(8, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(9, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Receives the recording download level from a record in an Integrated services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords">IISDB_SDTT::GetCountOfRecords</a> method to get the number of records in the SDTT.
     * @returns {Integer} Receives the recording download level.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordgroup
     */
    GetRecordGroup(dwRecordIndex) {
        result := ComCall(10, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Receives the target version from a record in an Integrated Services Digital Broadcasting (ISDB) Software Download Trigger Table (SDTT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords">IISDB_SDTT::GetCountOfRecords</a> method to get the number of records in the SDTT.
     * @returns {Integer} Receives the target version.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordtargetversion
     */
    GetRecordTargetVersion(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Returns a new version_number field value from a subtable within an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords">IISDB_SDTT::GetCountOfRecords</a> method to get the number of records in the SDTT.
     * @returns {Integer} Receives the new version_number field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordnewversion
     */
    GetRecordNewVersion(dwRecordIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the download level from an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords">IISDB_SDTT::GetCountOfRecords</a> method to get the number of records in the SDTT.
     * @returns {Integer} Receives the download level.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecorddownloadlevel
     */
    GetRecordDownloadLevel(dwRecordIndex) {
        result := ComCall(13, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Receives the version indicator from a record in an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords">IISDB_SDTT::GetCountOfRecords</a> method to get the number of records in the SDTT.
     * @returns {Integer} Receives the version indicator.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordversionindicator
     */
    GetRecordVersionIndicator(dwRecordIndex) {
        result := ComCall(14, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Receives event time shift information from a schedule record in an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *   indexed from zero. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords">IISDB_SDTT::GetCountOfRecords</a> method to get the number of records in the SDTT.
     * @returns {Integer} Receives the event time shift data.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordscheduletimeshiftinformation
     */
    GetRecordScheduleTimeShiftInformation(dwRecordIndex) {
        result := ComCall(15, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Returns the number of schedules from a record in an Information for Digital Broadcasting System (IDBS) software download trigger table (SDTT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords">IISDB_SDTT::GetCountOfRecords</a> method to get the number of records in the SDTT.
     * @returns {Integer} Receives the number of schedules.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordcountofschedules
     */
    GetRecordCountOfSchedules(dwRecordIndex) {
        result := ComCall(16, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Gets an event start time from a schedule record in in an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords">IISDB_SDTT::GetCountOfRecords</a> method to get the number of records in the SDTT.
     * @param {Integer} dwIndex Index to the schedules for the selected content.
     * @returns {MPEG_DATE_AND_TIME} Receives the event start time.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordstarttimebyindex
     */
    GetRecordStartTimeByIndex(dwRecordIndex, dwIndex) {
        pmdtVal := MPEG_DATE_AND_TIME()
        result := ComCall(17, this, "uint", dwRecordIndex, "uint", dwIndex, MPEG_DATE_AND_TIME.Ptr, pmdtVal, "HRESULT")
        return pmdtVal
    }

    /**
     * Receives the event duration from a schedule record in an Integrated Services Digital Broadcasting (ISDB) Software Download Trigger Table (SDTT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords">IISDB_SDTT::GetCountOfRecords</a> method to get the number of records in the SDTT.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordcountofdescriptors">IISDB_SDTT::GetRecordCountOfDescriptors</a> method to get the number
     *   of descriptors for a particular record.
     * @returns {MPEG_TIME} Receives the record duration.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecorddurationbyindex
     */
    GetRecordDurationByIndex(dwRecordIndex, dwIndex) {
        pmdVal := MPEG_TIME()
        result := ComCall(18, this, "uint", dwRecordIndex, "uint", dwIndex, MPEG_TIME.Ptr, pmdVal, "HRESULT")
        return pmdVal
    }

    /**
     * Returns the number of descriptors for a record in an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *       indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords">IISDB_SDTT::GetCountOfRecords</a> method to get the number of records in the SDTT.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(19, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Returns a descriptor for a specified record in an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords">IISDB_SDTT::GetCountOfRecords</a> method to get the number
     *   of records in the SDTT.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordcountofdescriptors">IISDB_SDTT::GetRecordCountOfDescriptors</a> method to get the number
     *   of descriptors for a particular record.
     * @returns {IGenericDescriptor} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface for the descriptor being retrieved. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(20, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Searches a record in an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords">IISDB_SDTT::GetCountOfRecords</a> method to get the number of records in the SDTT.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position
     *   in the descriptor list. This parameter is optional.
     *   If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the
     *   first descriptor in the list. Otherwise, the search starts from
     *   the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor,
     *   if any. You can use this parameter to iterate through the descriptor list,
     *   looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface pointer. Use this interface to retrieve the information
     *   in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Returns a hash value for this instance of an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT).
     * @returns {Integer} Receives the hash value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getversionhash
     */
    GetVersionHash() {
        result := ComCall(22, this, "uint*", &pdwVersionHash := 0, "HRESULT")
        return pdwVersionHash
    }

    Query(iid) {
        if (IISDB_SDTT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetVersionNumber := CallbackCreate(GetMethod(implObj, "GetVersionNumber"), flags, 2)
        this.vtbl.GetTableIdExt := CallbackCreate(GetMethod(implObj, "GetTableIdExt"), flags, 2)
        this.vtbl.GetTransportStreamId := CallbackCreate(GetMethod(implObj, "GetTransportStreamId"), flags, 2)
        this.vtbl.GetOriginalNetworkId := CallbackCreate(GetMethod(implObj, "GetOriginalNetworkId"), flags, 2)
        this.vtbl.GetServiceId := CallbackCreate(GetMethod(implObj, "GetServiceId"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordGroup := CallbackCreate(GetMethod(implObj, "GetRecordGroup"), flags, 3)
        this.vtbl.GetRecordTargetVersion := CallbackCreate(GetMethod(implObj, "GetRecordTargetVersion"), flags, 3)
        this.vtbl.GetRecordNewVersion := CallbackCreate(GetMethod(implObj, "GetRecordNewVersion"), flags, 3)
        this.vtbl.GetRecordDownloadLevel := CallbackCreate(GetMethod(implObj, "GetRecordDownloadLevel"), flags, 3)
        this.vtbl.GetRecordVersionIndicator := CallbackCreate(GetMethod(implObj, "GetRecordVersionIndicator"), flags, 3)
        this.vtbl.GetRecordScheduleTimeShiftInformation := CallbackCreate(GetMethod(implObj, "GetRecordScheduleTimeShiftInformation"), flags, 3)
        this.vtbl.GetRecordCountOfSchedules := CallbackCreate(GetMethod(implObj, "GetRecordCountOfSchedules"), flags, 3)
        this.vtbl.GetRecordStartTimeByIndex := CallbackCreate(GetMethod(implObj, "GetRecordStartTimeByIndex"), flags, 4)
        this.vtbl.GetRecordDurationByIndex := CallbackCreate(GetMethod(implObj, "GetRecordDurationByIndex"), flags, 4)
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
        CallbackFree(this.vtbl.GetTableIdExt)
        CallbackFree(this.vtbl.GetTransportStreamId)
        CallbackFree(this.vtbl.GetOriginalNetworkId)
        CallbackFree(this.vtbl.GetServiceId)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordGroup)
        CallbackFree(this.vtbl.GetRecordTargetVersion)
        CallbackFree(this.vtbl.GetRecordNewVersion)
        CallbackFree(this.vtbl.GetRecordDownloadLevel)
        CallbackFree(this.vtbl.GetRecordVersionIndicator)
        CallbackFree(this.vtbl.GetRecordScheduleTimeShiftInformation)
        CallbackFree(this.vtbl.GetRecordCountOfSchedules)
        CallbackFree(this.vtbl.GetRecordStartTimeByIndex)
        CallbackFree(this.vtbl.GetRecordDurationByIndex)
        CallbackFree(this.vtbl.GetRecordCountOfDescriptors)
        CallbackFree(this.vtbl.GetRecordDescriptorByIndex)
        CallbackFree(this.vtbl.GetRecordDescriptorByTag)
        CallbackFree(this.vtbl.GetVersionHash)
    }
}
