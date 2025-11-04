#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nn-atscpsipparser-iatsc_ett
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IATSC_ETT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IATSC_ETT
     * @type {Guid}
     */
    static IID => Guid("{5a142cc9-b8cf-4a86-a040-e9cadf3ef3e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetProtocolVersion", "GetEtmId", "GetExtendedMessageText"]

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
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_ett-getversionnumber
     */
    GetVersionNumber(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_ett-getprotocolversion
     */
    GetProtocolVersion(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_ett-getetmid
     */
    GetEtmId(pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwValMarshal, pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwLength 
     * @param {Pointer<Pointer<Integer>>} ppText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_ett-getextendedmessagetext
     */
    GetExtendedMessageText(pdwLength, ppText) {
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"
        ppTextMarshal := ppText is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, pdwLengthMarshal, pdwLength, ppTextMarshal, ppText, "HRESULT")
        return result
    }
}
