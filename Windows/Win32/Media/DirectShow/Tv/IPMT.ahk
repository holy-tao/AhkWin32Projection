#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IGenericDescriptor.ahk
#Include .\IPMT.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IPMT interface enables the client to get information from a program map table (PMT).
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nn-mpeg2psiparser-ipmt
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPMT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMT
     * @type {Guid}
     */
    static IID => Guid("{01f3b398-9527-4736-94db-5195878e97a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetProgramNumber", "GetVersionNumber", "GetPcrPid", "GetCountOfTableDescriptors", "GetTableDescriptorByIndex", "GetTableDescriptorByTag", "GetCountOfRecords", "GetRecordStreamType", "GetRecordElementaryPid", "GetRecordCountOfDescriptors", "GetRecordDescriptorByIndex", "GetRecordDescriptorByTag", "QueryServiceGatewayInfo", "QueryMPEInfo", "RegisterForNextTable", "GetNextTable", "RegisterForWhenCurrent", "ConvertNextToCurrent"]

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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getprogramnumber
     */
    GetProgramNumber() {
        result := ComCall(4, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getpcrpid
     */
    GetPcrPid() {
        result := ComCall(6, this, "ushort*", &pPidVal := 0, "HRESULT")
        return pPidVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors() {
        result := ComCall(7, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(10, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getrecordstreamtype
     */
    GetRecordStreamType(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getrecordelementarypid
     */
    GetRecordElementaryPid(dwRecordIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "ushort*", &pPidVal := 0, "HRESULT")
        return pPidVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(13, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} dwDescIndex 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwDescIndex) {
        result := ComCall(14, this, "uint", dwRecordIndex, "uint", dwDescIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @param {Pointer<Pointer<DSMCC_ELEMENT>>} ppDSMCCList 
     * @param {Pointer<Integer>} puiCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-queryservicegatewayinfo
     */
    QueryServiceGatewayInfo(ppDSMCCList, puiCount) {
        ppDSMCCListMarshal := ppDSMCCList is VarRef ? "ptr*" : "ptr"
        puiCountMarshal := puiCount is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, ppDSMCCListMarshal, ppDSMCCList, puiCountMarshal, puiCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<MPE_ELEMENT>>} ppMPEList 
     * @param {Pointer<Integer>} puiCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-querympeinfo
     */
    QueryMPEInfo(ppMPEList, puiCount) {
        ppMPEListMarshal := ppMPEList is VarRef ? "ptr*" : "ptr"
        puiCountMarshal := puiCount is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, ppMPEListMarshal, ppMPEList, puiCountMarshal, puiCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hNextTableAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-registerfornexttable
     */
    RegisterForNextTable(hNextTableAvailable) {
        hNextTableAvailable := hNextTableAvailable is Win32Handle ? NumGet(hNextTableAvailable, "ptr") : hNextTableAvailable

        result := ComCall(18, this, "ptr", hNextTableAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPMT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getnexttable
     */
    GetNextTable() {
        result := ComCall(19, this, "ptr*", &ppPMT := 0, "HRESULT")
        return IPMT(ppPMT)
    }

    /**
     * 
     * @param {HANDLE} hNextTableIsCurrent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-registerforwhencurrent
     */
    RegisterForWhenCurrent(hNextTableIsCurrent) {
        hNextTableIsCurrent := hNextTableIsCurrent is Win32Handle ? NumGet(hNextTableIsCurrent, "ptr") : hNextTableIsCurrent

        result := ComCall(20, this, "ptr", hNextTableIsCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-convertnexttocurrent
     */
    ConvertNextToCurrent() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}
