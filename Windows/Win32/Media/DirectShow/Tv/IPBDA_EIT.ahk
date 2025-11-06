#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MPEG_DATE_AND_TIME.ahk
#Include .\MPEG_TIME.ahk
#Include .\IGenericDescriptor.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that enable the client to get information from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream. The IPBDASiParser::GetEIT method returns a pointer to this interface.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-ipbda_eit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPBDA_EIT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPBDA_EIT
     * @type {Guid}
     */
    static IID => Guid("{a35f2dea-098f-4ebd-984c-2bd4c3c8ce0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetTableId", "GetVersionNumber", "GetServiceIdx", "GetCountOfRecords", "GetRecordEventId", "GetRecordStartTime", "GetRecordDuration", "GetRecordCountOfDescriptors", "GetRecordDescriptorByIndex", "GetRecordDescriptorByTag"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} size 
     * @param {Pointer<Integer>} pBuffer 
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
    Initialize(size, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", size, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-gettableid
     */
    GetTableId() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getserviceidx
     */
    GetServiceIdx() {
        result := ComCall(6, this, "uint*", &plwVal := 0, "HRESULT")
        return plwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(7, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordeventid
     */
    GetRecordEventId(dwRecordIndex) {
        result := ComCall(8, this, "uint", dwRecordIndex, "uint*", &plwVal := 0, "HRESULT")
        return plwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {MPEG_DATE_AND_TIME} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordstarttime
     */
    GetRecordStartTime(dwRecordIndex) {
        pmdtVal := MPEG_DATE_AND_TIME()
        result := ComCall(9, this, "uint", dwRecordIndex, "ptr", pmdtVal, "HRESULT")
        return pmdtVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {MPEG_TIME} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordduration
     */
    GetRecordDuration(dwRecordIndex) {
        pmdVal := MPEG_TIME()
        result := ComCall(10, this, "uint", dwRecordIndex, "ptr", pmdVal, "HRESULT")
        return pmdVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} dwIndex 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }
}
