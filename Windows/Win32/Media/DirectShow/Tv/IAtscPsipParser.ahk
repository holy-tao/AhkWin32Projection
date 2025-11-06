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
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getpat
     */
    GetPAT() {
        result := ComCall(4, this, "ptr*", &ppPAT := 0, "HRESULT")
        return IPAT(ppPAT)
    }

    /**
     * 
     * @param {Integer} dwTimeout 
     * @returns {ICAT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getcat
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
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getpmt
     */
    GetPMT(pid, pwProgramNumber) {
        pwProgramNumberMarshal := pwProgramNumber is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "ushort", pid, pwProgramNumberMarshal, pwProgramNumber, "ptr*", &ppPMT := 0, "HRESULT")
        return IPMT(ppPMT)
    }

    /**
     * 
     * @returns {ITSDT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-gettsdt
     */
    GetTSDT() {
        result := ComCall(7, this, "ptr*", &ppTSDT := 0, "HRESULT")
        return ITSDT(ppTSDT)
    }

    /**
     * 
     * @returns {IATSC_MGT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getmgt
     */
    GetMGT() {
        result := ComCall(8, this, "ptr*", &ppMGT := 0, "HRESULT")
        return IATSC_MGT(ppMGT)
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {BOOL} fGetNextTable 
     * @returns {IATSC_VCT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getvct
     */
    GetVCT(tableId, fGetNextTable) {
        result := ComCall(9, this, "char", tableId, "int", fGetNextTable, "ptr*", &ppVCT := 0, "HRESULT")
        return IATSC_VCT(ppVCT)
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Pointer<Integer>} pwSourceId 
     * @param {Integer} dwTimeout 
     * @returns {IATSC_EIT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-geteit
     */
    GetEIT(pid, pwSourceId, dwTimeout) {
        pwSourceIdMarshal := pwSourceId is VarRef ? "ushort*" : "ptr"

        result := ComCall(10, this, "ushort", pid, pwSourceIdMarshal, pwSourceId, "uint", dwTimeout, "ptr*", &ppEIT := 0, "HRESULT")
        return IATSC_EIT(ppEIT)
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Pointer<Integer>} wSourceId 
     * @param {Pointer<Integer>} pwEventId 
     * @returns {IATSC_ETT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getett
     */
    GetETT(pid, wSourceId, pwEventId) {
        wSourceIdMarshal := wSourceId is VarRef ? "ushort*" : "ptr"
        pwEventIdMarshal := pwEventId is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, "ushort", pid, wSourceIdMarshal, wSourceId, pwEventIdMarshal, pwEventId, "ptr*", &ppETT := 0, "HRESULT")
        return IATSC_ETT(ppETT)
    }

    /**
     * 
     * @returns {IATSC_STT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-getstt
     */
    GetSTT() {
        result := ComCall(12, this, "ptr*", &ppSTT := 0, "HRESULT")
        return IATSC_STT(ppSTT)
    }

    /**
     * 
     * @param {Integer} pid 
     * @returns {ISCTE_EAS} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-geteas
     */
    GetEAS(pid) {
        result := ComCall(13, this, "ushort", pid, "ptr*", &ppEAS := 0, "HRESULT")
        return ISCTE_EAS(ppEAS)
    }
}
