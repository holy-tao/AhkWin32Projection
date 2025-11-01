#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get information from an Integrated Services Digital Broadcasting (ISDB) linked description table (LDT). An LDT contains data used to collect reference information from other tables.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdb_ldt
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IISDB_LDT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IISDB_LDT
     * @type {Guid}
     */
    static IID => Guid("{141a546b-02ff-4fb9-a3a3-2f074b74a9a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetOriginalServiceId", "GetTransportStreamId", "GetOriginalNetworkId", "GetCountOfRecords", "GetRecordDescriptionId", "GetRecordCountOfDescriptors", "GetRecordDescriptorByIndex", "GetRecordDescriptorByTag", "GetVersionHash"]

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
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getversionnumber
     */
    GetVersionNumber(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getoriginalserviceid
     */
    GetOriginalServiceId(pwVal) {
        result := ComCall(5, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-gettransportstreamid
     */
    GetTransportStreamId(pwVal) {
        result := ComCall(6, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getoriginalnetworkid
     */
    GetOriginalNetworkId(pwVal) {
        result := ComCall(7, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getcountofrecords
     */
    GetCountOfRecords(pdwVal) {
        result := ComCall(8, this, "uint*", pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getrecorddescriptionid
     */
    GetRecordDescriptionId(dwRecordIndex, pwVal) {
        result := ComCall(9, this, "uint", dwRecordIndex, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex, pdwVal) {
        result := ComCall(10, this, "uint", dwRecordIndex, "uint*", pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} dwIndex 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex, ppDescriptor) {
        result := ComCall(11, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", ppDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie, ppDescriptor) {
        result := ComCall(12, this, "uint", dwRecordIndex, "char", bTag, "uint*", pdwCookie, "ptr*", ppDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVersionHash 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_ldt-getversionhash
     */
    GetVersionHash(pdwVersionHash) {
        result := ComCall(13, this, "uint*", pdwVersionHash, "HRESULT")
        return result
    }
}
