#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The ISectionList interface represents a list of MPEG-2 table sections.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISectionList)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nn-mpeg2data-isectionlist
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISectionList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISectionList
     * @type {Guid}
     */
    static IID => Guid("{afec1eb5-2a64-46c6-bf4b-ae3ccb6afdb0}")

    /**
     * The class identifier for SectionList
     * @type {Guid}
     */
    static CLSID => Guid("{73da5d04-4347-45d3-a9dc-fae9ddbe558d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "InitializeWithRawSections", "CancelPendingRequest", "GetNumberOfSections", "GetSectionData", "GetProgramIdentifier", "GetTableIdentifier"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} requestType 
     * @param {IMpeg2Data} pMpeg2Data 
     * @param {Pointer<MPEG_CONTEXT>} pContext 
     * @param {Integer} pid 
     * @param {Integer} tid 
     * @param {Pointer<MPEG2_FILTER>} pFilter 
     * @param {Integer} timeout 
     * @param {HANDLE} hDoneEvent 
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
    Initialize(requestType, pMpeg2Data, pContext, pid, tid, pFilter, timeout, hDoneEvent) {
        hDoneEvent := hDoneEvent is Win32Handle ? NumGet(hDoneEvent, "ptr") : hDoneEvent

        result := ComCall(3, this, "int", requestType, "ptr", pMpeg2Data, "ptr", pContext, "ushort", pid, "char", tid, "ptr", pFilter, "uint", timeout, "ptr", hDoneEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MPEG_PACKET_LIST>} pmplSections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-initializewithrawsections
     */
    InitializeWithRawSections(pmplSections) {
        result := ComCall(4, this, "ptr", pmplSections, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-cancelpendingrequest
     */
    CancelPendingRequest() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-getnumberofsections
     */
    GetNumberOfSections(pCount) {
        pCountMarshal := pCount is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} sectionNumber 
     * @param {Pointer<Integer>} pdwRawPacketLength 
     * @param {Pointer<Pointer<SECTION>>} ppSection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-getsectiondata
     */
    GetSectionData(sectionNumber, pdwRawPacketLength, ppSection) {
        pdwRawPacketLengthMarshal := pdwRawPacketLength is VarRef ? "uint*" : "ptr"
        ppSectionMarshal := ppSection is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ushort", sectionNumber, pdwRawPacketLengthMarshal, pdwRawPacketLength, ppSectionMarshal, ppSection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-getprogramidentifier
     */
    GetProgramIdentifier(pPid) {
        pPidMarshal := pPid is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, pPidMarshal, pPid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTableId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-gettableidentifier
     */
    GetTableIdentifier(pTableId) {
        pTableIdMarshal := pTableId is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, pTableIdMarshal, pTableId, "HRESULT")
        return result
    }
}
