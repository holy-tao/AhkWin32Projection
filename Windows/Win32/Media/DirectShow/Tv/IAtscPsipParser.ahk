#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPAT.ahk
#Include .\ICAT.ahk
#Include .\IPMT.ahk
#Include .\ITSDT.ahk
#Include .\IATSC_MGT.ahk
#Include .\IATSC_VCT.ahk
#Include .\IATSC_EIT.ahk
#Include .\IATSC_ETT.ahk
#Include .\IATSC_STT.ahk
#Include .\ISCTE_EAS.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later. The IAtscPsipParser interface retrieves ATSC Program and System Information Protocol (PSIP) tables.
 * @remarks
 * 
 * To get a pointer to this interface, call <b>CoCreateInstance</b>. Use the following CLSID:
 * 
 * 
 * ```cpp
 * 3508C064-B94E-420b-A821-20C8096FAADC
 * ```
 * 
 * 
 * This CLSID is not is not published in an SDK header; define a new GUID constant in your application.
 * 
 * You must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-initialize">Initialize</a> before calling any other methods on the object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nn-atscpsipparser-iatscpsipparser
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAtscPsipParser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAtscPsipParser
     * @type {Guid}
     */
    static IID => Guid("{b2c98995-5eb2-4fb1-b406-f3e8e2026a9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetPAT", "GetCAT", "GetPMT", "GetTSDT", "GetMGT", "GetVCT", "GetEIT", "GetETT", "GetSTT", "GetEAS"]

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
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iatscpsipparser-initialize
     */
    Initialize(punkMpeg2Data) {
        result := ComCall(3, this, "ptr", punkMpeg2Data, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {IPAT} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-ipat">IPAT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iatscpsipparser-getpat
     */
    GetPAT() {
        result := ComCall(4, this, "ptr*", &ppPAT := 0, "HRESULT")
        return IPAT(ppPAT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive the data within the time-out period, the method fails.
     * @returns {ICAT} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-icat">ICAT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iatscpsipparser-getcat
     */
    GetCAT(dwTimeout) {
        result := ComCall(5, this, "uint", dwTimeout, "ptr*", &ppCAT := 0, "HRESULT")
        return ICAT(ppCAT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} pid Specifies the PID for the requested PMT.
     * @param {Pointer<Integer>} pwProgramNumber Optional pointer to a variable that contains a table program number. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @returns {IPMT} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-ipmt">IPMT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iatscpsipparser-getpmt
     */
    GetPMT(pid, pwProgramNumber) {
        pwProgramNumberMarshal := pwProgramNumber is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "ushort", pid, pwProgramNumberMarshal, pwProgramNumber, "ptr*", &ppPMT := 0, "HRESULT")
        return IPMT(ppPMT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {ITSDT} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-itsdt">ITSDT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iatscpsipparser-gettsdt
     */
    GetTSDT() {
        result := ComCall(7, this, "ptr*", &ppTSDT := 0, "HRESULT")
        return ITSDT(ppTSDT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {IATSC_MGT} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iatsc_mgt">IATSC_MGT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iatscpsipparser-getmgt
     */
    GetMGT() {
        result := ComCall(8, this, "ptr*", &ppMGT := 0, "HRESULT")
        return IATSC_MGT(ppMGT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} tableId 
     * @param {BOOL} fGetNextTable Boolean value that indicates whether to search for the current table or the next table. If the value is <b>TRUE</b>, the method searches for a table with the current_next_indicator flag set to 1. Otherwise, the method searches for a table with the current_next_indicator flag set to 0.
     * @returns {IATSC_VCT} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iatsc_vct">IATSC_VCT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iatscpsipparser-getvct
     */
    GetVCT(tableId, fGetNextTable) {
        result := ComCall(9, this, "char", tableId, "int", fGetNextTable, "ptr*", &ppVCT := 0, "HRESULT")
        return IATSC_VCT(ppVCT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} pid Specifies the packet identifier (PID) for the requested EIT.
     * @param {Pointer<Integer>} pwSourceId Optional pointer to a variable that contains a table source identifier. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive the data within the time-out period, the method fails.
     * @returns {IATSC_EIT} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iatsc_eit">IATSC_EIT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iatscpsipparser-geteit
     */
    GetEIT(pid, pwSourceId, dwTimeout) {
        pwSourceIdMarshal := pwSourceId is VarRef ? "ushort*" : "ptr"

        result := ComCall(10, this, "ushort", pid, pwSourceIdMarshal, pwSourceId, "uint", dwTimeout, "ptr*", &ppEIT := 0, "HRESULT")
        return IATSC_EIT(ppEIT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} pid Specifies the packet identifier (PID) for the requested ETT.
     * @param {Pointer<Integer>} wSourceId Optional pointer to a variable that contains a table source identifier. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @param {Pointer<Integer>} pwEventId Optional pointer to a variable that contains a table event identifier. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @returns {IATSC_ETT} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iatsc_ett">IATSC_ETT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iatscpsipparser-getett
     */
    GetETT(pid, wSourceId, pwEventId) {
        wSourceIdMarshal := wSourceId is VarRef ? "ushort*" : "ptr"
        pwEventIdMarshal := pwEventId is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, "ushort", pid, wSourceIdMarshal, wSourceId, pwEventIdMarshal, pwEventId, "ptr*", &ppETT := 0, "HRESULT")
        return IATSC_ETT(ppETT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {IATSC_STT} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iatsc_stt">IATSC_STT</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iatscpsipparser-getstt
     */
    GetSTT() {
        result := ComCall(12, this, "ptr*", &ppSTT := 0, "HRESULT")
        return IATSC_STT(ppSTT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} pid Specifies the packet identifier (PID) for the requested EAS.
     * 
     * <div class="alert"><b>Note</b>  Earlier versions of this documentation described this parameter incorrectly as a time-out value.</div>
     * <div> </div>
     * @returns {ISCTE_EAS} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iscte_eas">ISCTE_EAS</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-iatscpsipparser-geteas
     */
    GetEAS(pid) {
        result := ComCall(13, this, "ushort", pid, "ptr*", &ppEAS := 0, "HRESULT")
        return ISCTE_EAS(ppEAS)
    }
}
