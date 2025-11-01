#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IPAT interface enables the client to get information from a Program Association Table (PAT). The IAtscPsipParser::GetPAT method returns a pointer to this interface.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nn-mpeg2psiparser-ipat
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPAT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPAT
     * @type {Guid}
     */
    static IID => Guid("{6623b511-4b5f-43c3-9a01-e8ff84188060}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetTransportStreamId", "GetVersionNumber", "GetCountOfRecords", "GetRecordProgramNumber", "GetRecordProgramMapPid", "FindRecordProgramMapPid", "RegisterForNextTable", "GetNextTable", "RegisterForWhenCurrent", "ConvertNextToCurrent"]

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
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-gettransportstreamid
     */
    GetTransportStreamId(pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getversionnumber
     */
    GetVersionNumber(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getcountofrecords
     */
    GetCountOfRecords(pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwValMarshal, pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getrecordprogramnumber
     */
    GetRecordProgramNumber(dwIndex, pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "uint", dwIndex, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getrecordprogrammappid
     */
    GetRecordProgramMapPid(dwIndex, pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "uint", dwIndex, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wProgramNumber 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-findrecordprogrammappid
     */
    FindRecordProgramMapPid(wProgramNumber, pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(9, this, "ushort", wProgramNumber, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hNextTableAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-registerfornexttable
     */
    RegisterForNextTable(hNextTableAvailable) {
        hNextTableAvailable := hNextTableAvailable is Win32Handle ? NumGet(hNextTableAvailable, "ptr") : hNextTableAvailable

        result := ComCall(10, this, "ptr", hNextTableAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPAT>} ppPAT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getnexttable
     */
    GetNextTable(ppPAT) {
        result := ComCall(11, this, "ptr*", ppPAT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hNextTableIsCurrent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-registerforwhencurrent
     */
    RegisterForWhenCurrent(hNextTableIsCurrent) {
        hNextTableIsCurrent := hNextTableIsCurrent is Win32Handle ? NumGet(hNextTableIsCurrent, "ptr") : hNextTableIsCurrent

        result := ComCall(12, this, "ptr", hNextTableIsCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-convertnexttocurrent
     */
    ConvertNextToCurrent() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
