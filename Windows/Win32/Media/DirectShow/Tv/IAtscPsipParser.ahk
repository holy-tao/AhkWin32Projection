#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPMT.ahk" { IPMT }
#Import ".\IATSC_EIT.ahk" { IATSC_EIT }
#Import ".\IATSC_VCT.ahk" { IATSC_VCT }
#Import ".\ICAT.ahk" { ICAT }
#Import ".\IATSC_ETT.ahk" { IATSC_ETT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IATSC_STT.ahk" { IATSC_STT }
#Import ".\IATSC_MGT.ahk" { IATSC_MGT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISCTE_EAS.ahk" { ISCTE_EAS }
#Import ".\IPAT.ahk" { IPAT }
#Import ".\ITSDT.ahk" { ITSDT }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later. The IAtscPsipParser interface retrieves ATSC Program and System Information Protocol (PSIP) tables.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nn-atscpsipparser-iatscpsipparser
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IAtscPsipParser extends IUnknown {
    /**
     * The interface identifier for IAtscPsipParser
     * @type {Guid}
     */
    static IID := Guid("{b2c98995-5eb2-4fb1-b406-f3e8e2026a9a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAtscPsipParser interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
        GetPAT     : IntPtr
        GetCAT     : IntPtr
        GetPMT     : IntPtr
        GetTSDT    : IntPtr
        GetMGT     : IntPtr
        GetVCT     : IntPtr
        GetEIT     : IntPtr
        GetETT     : IntPtr
        GetSTT     : IntPtr
        GetEAS     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAtscPsipParser.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * Until this method is called, all other methods on this interface fail.
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
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-initialize
     */
    Initialize(punkMpeg2Data) {
        result := ComCall(3, this, "ptr", punkMpeg2Data, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * The method fails if the filter does not receive a matching table within a predetermined length of time.
     * @returns {IPAT} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-ipat">IPAT</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getpat
     */
    GetPAT() {
        result := ComCall(4, this, "ptr*", &ppPAT := 0, "HRESULT")
        return IPAT(ppPAT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * The method returns the first CAT that is marked <i>current</i>; that is, one in which the current_next_indicator bit is 1.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive the data within the time-out period, the method fails.
     * @returns {ICAT} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-icat">ICAT</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getcat
     */
    GetCAT(dwTimeout) {
        result := ComCall(5, this, "uint", dwTimeout, "ptr*", &ppCAT := 0, "HRESULT")
        return ICAT(ppCAT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * The method fails if the filter does not receive a matching table within a predetermined length of time.
     * @param {Integer} pid Specifies the PID for the requested PMT.
     * @param {Pointer<Integer>} pwProgramNumber Optional pointer to a variable that contains a table program number. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @returns {IPMT} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-ipmt">IPMT</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getpmt
     */
    GetPMT(pid, pwProgramNumber) {
        pwProgramNumberMarshal := pwProgramNumber is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "ushort", pid, pwProgramNumberMarshal, pwProgramNumber, "ptr*", &ppPMT := 0, "HRESULT")
        return IPMT(ppPMT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * The method fails if the filter does not receive a matching table within a predetermined length of time.
     * @returns {ITSDT} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-itsdt">ITSDT</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-gettsdt
     */
    GetTSDT() {
        result := ComCall(7, this, "ptr*", &ppTSDT := 0, "HRESULT")
        return ITSDT(ppTSDT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * The method fails if the filter does not receive a matching table within a predetermined length of time.
     * @returns {IATSC_MGT} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iatsc_mgt">IATSC_MGT</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getmgt
     */
    GetMGT() {
        result := ComCall(8, this, "ptr*", &ppMGT := 0, "HRESULT")
        return IATSC_MGT(ppMGT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * The method fails if the filter does not receive a matching table within a predetermined length of time.
     * @param {Integer} tableId 
     * @param {BOOL} fGetNextTable Boolean value that indicates whether to search for the current table or the next table. If the value is <b>TRUE</b>, the method searches for a table with the current_next_indicator flag set to 1. Otherwise, the method searches for a table with the current_next_indicator flag set to 0.
     * @returns {IATSC_VCT} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iatsc_vct">IATSC_VCT</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getvct
     */
    GetVCT(tableId, fGetNextTable) {
        result := ComCall(9, this, "char", tableId, BOOL, fGetNextTable, "ptr*", &ppVCT := 0, "HRESULT")
        return IATSC_VCT(ppVCT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} pid Specifies the packet identifier (PID) for the requested EIT.
     * @param {Pointer<Integer>} pwSourceId Optional pointer to a variable that contains a table source identifier. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive the data within the time-out period, the method fails.
     * @returns {IATSC_EIT} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iatsc_eit">IATSC_EIT</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-geteit
     */
    GetEIT(pid, pwSourceId, dwTimeout) {
        pwSourceIdMarshal := pwSourceId is VarRef ? "ushort*" : "ptr"

        result := ComCall(10, this, "ushort", pid, pwSourceIdMarshal, pwSourceId, "uint", dwTimeout, "ptr*", &ppEIT := 0, "HRESULT")
        return IATSC_EIT(ppEIT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * The method fails if the filter does not receive a matching table within a predetermined length of time.
     * @param {Integer} pid Specifies the packet identifier (PID) for the requested ETT.
     * @param {Pointer<Integer>} wSourceId Optional pointer to a variable that contains a table source identifier. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @param {Pointer<Integer>} pwEventId Optional pointer to a variable that contains a table event identifier. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @returns {IATSC_ETT} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iatsc_ett">IATSC_ETT</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getett
     */
    GetETT(pid, wSourceId, pwEventId) {
        wSourceIdMarshal := wSourceId is VarRef ? "ushort*" : "ptr"
        pwEventIdMarshal := pwEventId is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, "ushort", pid, wSourceIdMarshal, wSourceId, pwEventIdMarshal, pwEventId, "ptr*", &ppETT := 0, "HRESULT")
        return IATSC_ETT(ppETT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * The method fails if the filter does not receive a matching table within a predetermined length of time.
     * @returns {IATSC_STT} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iatsc_stt">IATSC_STT</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getstt
     */
    GetSTT() {
        result := ComCall(12, this, "ptr*", &ppSTT := 0, "HRESULT")
        return IATSC_STT(ppSTT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * The method fails if the filter does not receive a matching table within a predetermined length of time.
     * @param {Integer} pid Specifies the packet identifier (PID) for the requested EAS.
     * 
     * <div class="alert"><b>Note</b>  Earlier versions of this documentation described this parameter incorrectly as a time-out value.</div>
     * <div> </div>
     * @returns {ISCTE_EAS} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iscte_eas">ISCTE_EAS</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-geteas
     */
    GetEAS(pid) {
        result := ComCall(13, this, "ushort", pid, "ptr*", &ppEAS := 0, "HRESULT")
        return ISCTE_EAS(ppEAS)
    }

    Query(iid) {
        if (IAtscPsipParser.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.GetPAT := CallbackCreate(GetMethod(implObj, "GetPAT"), flags, 2)
        this.vtbl.GetCAT := CallbackCreate(GetMethod(implObj, "GetCAT"), flags, 3)
        this.vtbl.GetPMT := CallbackCreate(GetMethod(implObj, "GetPMT"), flags, 4)
        this.vtbl.GetTSDT := CallbackCreate(GetMethod(implObj, "GetTSDT"), flags, 2)
        this.vtbl.GetMGT := CallbackCreate(GetMethod(implObj, "GetMGT"), flags, 2)
        this.vtbl.GetVCT := CallbackCreate(GetMethod(implObj, "GetVCT"), flags, 4)
        this.vtbl.GetEIT := CallbackCreate(GetMethod(implObj, "GetEIT"), flags, 5)
        this.vtbl.GetETT := CallbackCreate(GetMethod(implObj, "GetETT"), flags, 5)
        this.vtbl.GetSTT := CallbackCreate(GetMethod(implObj, "GetSTT"), flags, 2)
        this.vtbl.GetEAS := CallbackCreate(GetMethod(implObj, "GetEAS"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetPAT)
        CallbackFree(this.vtbl.GetCAT)
        CallbackFree(this.vtbl.GetPMT)
        CallbackFree(this.vtbl.GetTSDT)
        CallbackFree(this.vtbl.GetMGT)
        CallbackFree(this.vtbl.GetVCT)
        CallbackFree(this.vtbl.GetEIT)
        CallbackFree(this.vtbl.GetETT)
        CallbackFree(this.vtbl.GetSTT)
        CallbackFree(this.vtbl.GetEAS)
    }
}
