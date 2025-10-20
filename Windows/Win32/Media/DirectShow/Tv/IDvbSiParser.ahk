#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later. The IDvbSiParser retrieves program specific information (PSI) and service information (SI) tables from a DVB transport stream.
 * @remarks
 * 
  * To get a pointer to this interface, see the remarks for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvbsiparser2">IDvbSiParser2</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbsiparser
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbSiParser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbSiParser
     * @type {Guid}
     */
    static IID => Guid("{b758a7bd-14dc-449d-b828-35909acb3b1e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetPAT", "GetCAT", "GetPMT", "GetTSDT", "GetNIT", "GetSDT", "GetEIT", "GetBAT", "GetRST", "GetST", "GetTDT", "GetTOT", "GetDIT", "GetSIT"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IUnknown} punkMpeg2Data 
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
    Initialize(punkMpeg2Data) {
        result := ComCall(3, this, "ptr", punkMpeg2Data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPAT>} ppPAT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getpat
     */
    GetPAT(ppPAT) {
        result := ComCall(4, this, "ptr*", ppPAT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTimeout 
     * @param {Pointer<ICAT>} ppCAT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getcat
     */
    GetCAT(dwTimeout, ppCAT) {
        result := ComCall(5, this, "uint", dwTimeout, "ptr*", ppCAT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Pointer<Integer>} pwProgramNumber 
     * @param {Pointer<IPMT>} ppPMT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getpmt
     */
    GetPMT(pid, pwProgramNumber, ppPMT) {
        result := ComCall(6, this, "ushort", pid, "ushort*", pwProgramNumber, "ptr*", ppPMT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITSDT>} ppTSDT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-gettsdt
     */
    GetTSDT(ppTSDT) {
        result := ComCall(7, this, "ptr*", ppTSDT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwNetworkId 
     * @param {Pointer<IDVB_NIT>} ppNIT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getnit
     */
    GetNIT(tableId, pwNetworkId, ppNIT) {
        result := ComCall(8, this, "char", tableId, "ushort*", pwNetworkId, "ptr*", ppNIT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwTransportStreamId 
     * @param {Pointer<IDVB_SDT>} ppSDT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getsdt
     */
    GetSDT(tableId, pwTransportStreamId, ppSDT) {
        result := ComCall(9, this, "char", tableId, "ushort*", pwTransportStreamId, "ptr*", ppSDT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwServiceId 
     * @param {Pointer<IDVB_EIT>} ppEIT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-geteit
     */
    GetEIT(tableId, pwServiceId, ppEIT) {
        result := ComCall(10, this, "char", tableId, "ushort*", pwServiceId, "ptr*", ppEIT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwBouquetId 
     * @param {Pointer<IDVB_BAT>} ppBAT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getbat
     */
    GetBAT(pwBouquetId, ppBAT) {
        result := ComCall(11, this, "ushort*", pwBouquetId, "ptr*", ppBAT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTimeout 
     * @param {Pointer<IDVB_RST>} ppRST 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getrst
     */
    GetRST(dwTimeout, ppRST) {
        result := ComCall(12, this, "uint", dwTimeout, "ptr*", ppRST, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Integer} dwTimeout 
     * @param {Pointer<IDVB_ST>} ppST 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getst
     */
    GetST(pid, dwTimeout, ppST) {
        result := ComCall(13, this, "ushort", pid, "uint", dwTimeout, "ptr*", ppST, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDVB_TDT>} ppTDT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-gettdt
     */
    GetTDT(ppTDT) {
        result := ComCall(14, this, "ptr*", ppTDT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDVB_TOT>} ppTOT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-gettot
     */
    GetTOT(ppTOT) {
        result := ComCall(15, this, "ptr*", ppTOT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTimeout 
     * @param {Pointer<IDVB_DIT>} ppDIT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getdit
     */
    GetDIT(dwTimeout, ppDIT) {
        result := ComCall(16, this, "uint", dwTimeout, "ptr*", ppDIT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTimeout 
     * @param {Pointer<IDVB_SIT>} ppSIT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getsit
     */
    GetSIT(dwTimeout, ppSIT) {
        result := ComCall(17, this, "uint", dwTimeout, "ptr*", ppSIT, "HRESULT")
        return result
    }
}
