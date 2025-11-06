#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IGenericDescriptor.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get information from an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT). The NBIT describes the programs included in a multiplexed transport stream for an ISDB broadcast.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdb_nbit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IISDB_NBIT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IISDB_NBIT
     * @type {Guid}
     */
    static IID => Guid("{1b1863ef-08f1-40b7-a559-3b1eff8cafa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetOriginalNetworkId", "GetCountOfRecords", "GetRecordInformationId", "GetRecordInformationType", "GetRecordDescriptionBodyLocation", "GetRecordMessageSectionNumber", "GetRecordUserDefined", "GetRecordNumberOfKeys", "GetRecordKeys", "GetRecordCountOfDescriptors", "GetRecordDescriptorByIndex", "GetRecordDescriptorByTag", "GetVersionHash"]

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
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getoriginalnetworkid
     */
    GetOriginalNetworkId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(6, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordinformationid
     */
    GetRecordInformationId(dwRecordIndex) {
        result := ComCall(7, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordinformationtype
     */
    GetRecordInformationType(dwRecordIndex) {
        result := ComCall(8, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecorddescriptionbodylocation
     */
    GetRecordDescriptionBodyLocation(dwRecordIndex) {
        result := ComCall(9, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordmessagesectionnumber
     */
    GetRecordMessageSectionNumber(dwRecordIndex) {
        result := ComCall(10, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecorduserdefined
     */
    GetRecordUserDefined(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordnumberofkeys
     */
    GetRecordNumberOfKeys(dwRecordIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordkeys
     */
    GetRecordKeys(dwRecordIndex) {
        result := ComCall(13, this, "uint", dwRecordIndex, "ptr*", &pbKeys := 0, "HRESULT")
        return pbKeys
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(14, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} dwIndex 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(15, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getversionhash
     */
    GetVersionHash() {
        result := ComCall(17, this, "uint*", &pdwVersionHash := 0, "HRESULT")
        return pdwVersionHash
    }
}
