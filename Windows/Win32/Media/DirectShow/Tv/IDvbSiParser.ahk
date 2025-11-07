#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPAT.ahk
#Include .\ICAT.ahk
#Include .\IPMT.ahk
#Include .\ITSDT.ahk
#Include .\IDVB_NIT.ahk
#Include .\IDVB_SDT.ahk
#Include .\IDVB_EIT.ahk
#Include .\IDVB_BAT.ahk
#Include .\IDVB_RST.ahk
#Include .\IDVB_ST.ahk
#Include .\IDVB_TDT.ahk
#Include .\IDVB_TOT.ahk
#Include .\IDVB_DIT.ahk
#Include .\IDVB_SIT.ahk
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
     * @returns {IPAT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getpat
     */
    GetPAT() {
        result := ComCall(4, this, "ptr*", &ppPAT := 0, "HRESULT")
        return IPAT(ppPAT)
    }

    /**
     * 
     * @param {Integer} dwTimeout 
     * @returns {ICAT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getcat
     */
    GetCAT(dwTimeout) {
        result := ComCall(5, this, "uint", dwTimeout, "ptr*", &ppCAT := 0, "HRESULT")
        return ICAT(ppCAT)
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Pointer<Integer>} pwProgramNumber 
     * @returns {IPMT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getpmt
     */
    GetPMT(pid, pwProgramNumber) {
        pwProgramNumberMarshal := pwProgramNumber is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "ushort", pid, pwProgramNumberMarshal, pwProgramNumber, "ptr*", &ppPMT := 0, "HRESULT")
        return IPMT(ppPMT)
    }

    /**
     * 
     * @returns {ITSDT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-gettsdt
     */
    GetTSDT() {
        result := ComCall(7, this, "ptr*", &ppTSDT := 0, "HRESULT")
        return ITSDT(ppTSDT)
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwNetworkId 
     * @returns {IDVB_NIT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getnit
     */
    GetNIT(tableId, pwNetworkId) {
        pwNetworkIdMarshal := pwNetworkId is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "char", tableId, pwNetworkIdMarshal, pwNetworkId, "ptr*", &ppNIT := 0, "HRESULT")
        return IDVB_NIT(ppNIT)
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwTransportStreamId 
     * @returns {IDVB_SDT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getsdt
     */
    GetSDT(tableId, pwTransportStreamId) {
        pwTransportStreamIdMarshal := pwTransportStreamId is VarRef ? "ushort*" : "ptr"

        result := ComCall(9, this, "char", tableId, pwTransportStreamIdMarshal, pwTransportStreamId, "ptr*", &ppSDT := 0, "HRESULT")
        return IDVB_SDT(ppSDT)
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwServiceId 
     * @returns {IDVB_EIT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-geteit
     */
    GetEIT(tableId, pwServiceId) {
        pwServiceIdMarshal := pwServiceId is VarRef ? "ushort*" : "ptr"

        result := ComCall(10, this, "char", tableId, pwServiceIdMarshal, pwServiceId, "ptr*", &ppEIT := 0, "HRESULT")
        return IDVB_EIT(ppEIT)
    }

    /**
     * 
     * @param {Pointer<Integer>} pwBouquetId 
     * @returns {IDVB_BAT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getbat
     */
    GetBAT(pwBouquetId) {
        pwBouquetIdMarshal := pwBouquetId is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, pwBouquetIdMarshal, pwBouquetId, "ptr*", &ppBAT := 0, "HRESULT")
        return IDVB_BAT(ppBAT)
    }

    /**
     * 
     * @param {Integer} dwTimeout 
     * @returns {IDVB_RST} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getrst
     */
    GetRST(dwTimeout) {
        result := ComCall(12, this, "uint", dwTimeout, "ptr*", &ppRST := 0, "HRESULT")
        return IDVB_RST(ppRST)
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Integer} dwTimeout 
     * @returns {IDVB_ST} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getst
     */
    GetST(pid, dwTimeout) {
        result := ComCall(13, this, "ushort", pid, "uint", dwTimeout, "ptr*", &ppST := 0, "HRESULT")
        return IDVB_ST(ppST)
    }

    /**
     * 
     * @returns {IDVB_TDT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-gettdt
     */
    GetTDT() {
        result := ComCall(14, this, "ptr*", &ppTDT := 0, "HRESULT")
        return IDVB_TDT(ppTDT)
    }

    /**
     * 
     * @returns {IDVB_TOT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-gettot
     */
    GetTOT() {
        result := ComCall(15, this, "ptr*", &ppTOT := 0, "HRESULT")
        return IDVB_TOT(ppTOT)
    }

    /**
     * 
     * @param {Integer} dwTimeout 
     * @returns {IDVB_DIT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getdit
     */
    GetDIT(dwTimeout) {
        result := ComCall(16, this, "uint", dwTimeout, "ptr*", &ppDIT := 0, "HRESULT")
        return IDVB_DIT(ppDIT)
    }

    /**
     * 
     * @param {Integer} dwTimeout 
     * @returns {IDVB_SIT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getsit
     */
    GetSIT(dwTimeout) {
        result := ComCall(17, this, "uint", dwTimeout, "ptr*", &ppSIT := 0, "HRESULT")
        return IDVB_SIT(ppSIT)
    }
}
