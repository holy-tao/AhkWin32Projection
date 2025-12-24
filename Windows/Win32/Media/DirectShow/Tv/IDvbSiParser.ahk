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
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {IUnknown} punkMpeg2Data Pointer to the <b>IUnknown</b> interface of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/mpeg-2-sections-and-tables-filter">MPEG-2 Sections and Tables Filter</a> or another object that implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>punkMpeg2Data</i> pointer does not expose the <b>IMpeg2Data</b> interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-initialize
     */
    Initialize(punkMpeg2Data) {
        result := ComCall(3, this, "ptr", punkMpeg2Data, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {IPAT} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-ipat">IPAT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-getpat
     */
    GetPAT() {
        result := ComCall(4, this, "ptr*", &ppPAT := 0, "HRESULT")
        return IPAT(ppPAT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive the data within the time-out period, the method fails.
     * @returns {ICAT} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-icat">ICAT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-getcat
     */
    GetCAT(dwTimeout) {
        result := ComCall(5, this, "uint", dwTimeout, "ptr*", &ppCAT := 0, "HRESULT")
        return ICAT(ppCAT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} pid Specifies the PID for the requested PMT.
     * @param {Pointer<Integer>} pwProgramNumber Optional pointer to a variable that contains a table program number. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @returns {IPMT} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-ipmt">IPMT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-getpmt
     */
    GetPMT(pid, pwProgramNumber) {
        pwProgramNumberMarshal := pwProgramNumber is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "ushort", pid, pwProgramNumberMarshal, pwProgramNumber, "ptr*", &ppPMT := 0, "HRESULT")
        return IPMT(ppPMT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {ITSDT} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-itsdt">ITSDT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-gettsdt
     */
    GetTSDT() {
        result := ComCall(7, this, "ptr*", &ppTSDT := 0, "HRESULT")
        return ITSDT(ppTSDT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} tableId Specifies the table identifier of the NIT. Use one of the values in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>DVB_NIT_ACTUAL_TID (0x40)</td>
     * <td>NIT for the network that carries this transport stream.</td>
     * </tr>
     * <tr>
     * <td>DVB_NIT_OTHER_TID (0x41)</td>
     * <td>NIT for another network.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pwNetworkId Optional parameter that contains a network identifier. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @returns {IDVB_NIT} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvb_nit">IDVB_NIT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-getnit
     */
    GetNIT(tableId, pwNetworkId) {
        pwNetworkIdMarshal := pwNetworkId is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "char", tableId, pwNetworkIdMarshal, pwNetworkId, "ptr*", &ppNIT := 0, "HRESULT")
        return IDVB_NIT(ppNIT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} tableId Specifies the table identifier of the SDT. Use one of the values in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>DVB_SDT_ACTUAL_TID (0x42)</td>
     * <td>SDT for the current transport stream.</td>
     * </tr>
     * <tr>
     * <td>DVB_SDT_OTHER_TID (0x46)</td>
     * <td>SDT for another transport stream.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pwTransportStreamId Optional parameter that contains a transport stream identifier (TSID). You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @returns {IDVB_SDT} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvb_sdt">IDVB_SDT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-getsdt
     */
    GetSDT(tableId, pwTransportStreamId) {
        pwTransportStreamIdMarshal := pwTransportStreamId is VarRef ? "ushort*" : "ptr"

        result := ComCall(9, this, "char", tableId, pwTransportStreamIdMarshal, pwTransportStreamId, "ptr*", &ppSDT := 0, "HRESULT")
        return IDVB_SDT(ppSDT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} tableId Specifies the table identifier of the EIT. Use one of the values in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>DVB_EIT_ACTUAL_TID (0x4E)</td>
     * <td>Present/following EIT for this transport stream.</td>
     * </tr>
     * <tr>
     * <td>DVB_EIT_OTHER_TID (0x4F)</td>
     * <td>Present/following EIT for another transport stream.</td>
     * </tr>
     * <tr>
     * <td>0x50 – 0x5F</td>
     * <td>Schedule EIT for this transport stream.</td>
     * </tr>
     * <tr>
     * <td>0x60 – 0x6F</td>
     * <td>Schedule EIT for another transport stream.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pwServiceId Optional parameter that contains a service identifier. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @returns {IDVB_EIT} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvb_eit">IDVB_EIT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-geteit
     */
    GetEIT(tableId, pwServiceId) {
        pwServiceIdMarshal := pwServiceId is VarRef ? "ushort*" : "ptr"

        result := ComCall(10, this, "char", tableId, pwServiceIdMarshal, pwServiceId, "ptr*", &ppEIT := 0, "HRESULT")
        return IDVB_EIT(ppEIT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Pointer<Integer>} pwBouquetId Optional parameter that contains a bouquet identifier. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @returns {IDVB_BAT} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvb_bat">IDVB_BAT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-getbat
     */
    GetBAT(pwBouquetId) {
        pwBouquetIdMarshal := pwBouquetId is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, pwBouquetIdMarshal, pwBouquetId, "ptr*", &ppBAT := 0, "HRESULT")
        return IDVB_BAT(ppBAT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive the data within the time-out period, the method fails.
     * @returns {IDVB_RST} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvb_rst">IDVB_RST</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-getrst
     */
    GetRST(dwTimeout) {
        result := ComCall(12, this, "uint", dwTimeout, "ptr*", &ppRST := 0, "HRESULT")
        return IDVB_RST(ppRST)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} pid Specifies the packet identifier (PID) for the ST. Valid PIDs are in the range 0x10 through 0x14, inclusive.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive the data within the time-out period, the method fails.
     * @returns {IDVB_ST} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvb_st">IDVB_ST</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-getst
     */
    GetST(pid, dwTimeout) {
        result := ComCall(13, this, "ushort", pid, "uint", dwTimeout, "ptr*", &ppST := 0, "HRESULT")
        return IDVB_ST(ppST)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {IDVB_TDT} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvb_tdt">IDVB_TDT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-gettdt
     */
    GetTDT() {
        result := ComCall(14, this, "ptr*", &ppTDT := 0, "HRESULT")
        return IDVB_TDT(ppTDT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {IDVB_TOT} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvb_tot">IDVB_TOT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-gettot
     */
    GetTOT() {
        result := ComCall(15, this, "ptr*", &ppTOT := 0, "HRESULT")
        return IDVB_TOT(ppTOT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive the data within the time-out period, the method fails.
     * @returns {IDVB_DIT} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvb_dit">IDVB_DIT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-getdit
     */
    GetDIT(dwTimeout) {
        result := ComCall(16, this, "uint", dwTimeout, "ptr*", &ppDIT := 0, "HRESULT")
        return IDVB_DIT(ppDIT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive the data within the time-out period, the method fails.
     * @returns {IDVB_SIT} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvb_sit">IDVB_SIT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsiparser-getsit
     */
    GetSIT(dwTimeout) {
        result := ComCall(17, this, "uint", dwTimeout, "ptr*", &ppSIT := 0, "HRESULT")
        return IDVB_SIT(ppSIT)
    }
}
