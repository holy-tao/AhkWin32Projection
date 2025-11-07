#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MPEG_DATE_AND_TIME.ahk
#Include .\MPEG_TIME.ahk
#Include .\IGenericDescriptor.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) software download trigger table (SDTT). An SDTT contains download information such as service ID, schedule, and receiver types for revision.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdb_sdtt
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IISDB_SDTT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IISDB_SDTT
     * @type {Guid}
     */
    static IID => Guid("{ee60ef2d-813a-4dc7-bf92-ea13dac85313}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetTableIdExt", "GetTransportStreamId", "GetOriginalNetworkId", "GetServiceId", "GetCountOfRecords", "GetRecordGroup", "GetRecordTargetVersion", "GetRecordNewVersion", "GetRecordDownloadLevel", "GetRecordVersionIndicator", "GetRecordScheduleTimeShiftInformation", "GetRecordCountOfSchedules", "GetRecordStartTimeByIndex", "GetRecordDurationByIndex", "GetRecordCountOfDescriptors", "GetRecordDescriptorByIndex", "GetRecordDescriptorByTag", "GetVersionHash"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {ISectionList} pSectionList 
     * @param {IMpeg2Data} pMPEGData 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-gettableidext
     */
    GetTableIdExt() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-gettransportstreamid
     */
    GetTransportStreamId() {
        result := ComCall(6, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getoriginalnetworkid
     */
    GetOriginalNetworkId() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getserviceid
     */
    GetServiceId() {
        result := ComCall(8, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(9, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordgroup
     */
    GetRecordGroup(dwRecordIndex) {
        result := ComCall(10, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordtargetversion
     */
    GetRecordTargetVersion(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordnewversion
     */
    GetRecordNewVersion(dwRecordIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecorddownloadlevel
     */
    GetRecordDownloadLevel(dwRecordIndex) {
        result := ComCall(13, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordversionindicator
     */
    GetRecordVersionIndicator(dwRecordIndex) {
        result := ComCall(14, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordscheduletimeshiftinformation
     */
    GetRecordScheduleTimeShiftInformation(dwRecordIndex) {
        result := ComCall(15, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordcountofschedules
     */
    GetRecordCountOfSchedules(dwRecordIndex) {
        result := ComCall(16, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} dwIndex 
     * @returns {MPEG_DATE_AND_TIME} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordstarttimebyindex
     */
    GetRecordStartTimeByIndex(dwRecordIndex, dwIndex) {
        pmdtVal := MPEG_DATE_AND_TIME()
        result := ComCall(17, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr", pmdtVal, "HRESULT")
        return pmdtVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} dwIndex 
     * @returns {MPEG_TIME} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecorddurationbyindex
     */
    GetRecordDurationByIndex(dwRecordIndex, dwIndex) {
        pmdVal := MPEG_TIME()
        result := ComCall(18, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr", pmdVal, "HRESULT")
        return pmdVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(19, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} dwIndex 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(20, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdtt-getversionhash
     */
    GetVersionHash() {
        result := ComCall(22, this, "uint*", &pdwVersionHash := 0, "HRESULT")
        return pdwVersionHash
    }
}
