#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<IUnknown>} punkMpeg2Data 
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
        result := ComCall(3, this, "ptr", punkMpeg2Data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPAT>} ppPAT 
     * @returns {HRESULT} 
     */
    GetPAT(ppPAT) {
        result := ComCall(4, this, "ptr", ppPAT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTimeout 
     * @param {Pointer<ICAT>} ppCAT 
     * @returns {HRESULT} 
     */
    GetCAT(dwTimeout, ppCAT) {
        result := ComCall(5, this, "uint", dwTimeout, "ptr", ppCAT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Pointer<UInt16>} pwProgramNumber 
     * @param {Pointer<IPMT>} ppPMT 
     * @returns {HRESULT} 
     */
    GetPMT(pid, pwProgramNumber, ppPMT) {
        result := ComCall(6, this, "ushort", pid, "ushort*", pwProgramNumber, "ptr", ppPMT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITSDT>} ppTSDT 
     * @returns {HRESULT} 
     */
    GetTSDT(ppTSDT) {
        result := ComCall(7, this, "ptr", ppTSDT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IATSC_MGT>} ppMGT 
     * @returns {HRESULT} 
     */
    GetMGT(ppMGT) {
        result := ComCall(8, this, "ptr", ppMGT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {BOOL} fGetNextTable 
     * @param {Pointer<IATSC_VCT>} ppVCT 
     * @returns {HRESULT} 
     */
    GetVCT(tableId, fGetNextTable, ppVCT) {
        result := ComCall(9, this, "char", tableId, "int", fGetNextTable, "ptr", ppVCT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Pointer<UInt16>} pwSourceId 
     * @param {Integer} dwTimeout 
     * @param {Pointer<IATSC_EIT>} ppEIT 
     * @returns {HRESULT} 
     */
    GetEIT(pid, pwSourceId, dwTimeout, ppEIT) {
        result := ComCall(10, this, "ushort", pid, "ushort*", pwSourceId, "uint", dwTimeout, "ptr", ppEIT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Pointer<UInt16>} wSourceId 
     * @param {Pointer<UInt16>} pwEventId 
     * @param {Pointer<IATSC_ETT>} ppETT 
     * @returns {HRESULT} 
     */
    GetETT(pid, wSourceId, pwEventId, ppETT) {
        result := ComCall(11, this, "ushort", pid, "ushort*", wSourceId, "ushort*", pwEventId, "ptr", ppETT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IATSC_STT>} ppSTT 
     * @returns {HRESULT} 
     */
    GetSTT(ppSTT) {
        result := ComCall(12, this, "ptr", ppSTT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Pointer<ISCTE_EAS>} ppEAS 
     * @returns {HRESULT} 
     */
    GetEAS(pid, ppEAS) {
        result := ComCall(13, this, "ushort", pid, "ptr", ppEAS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
