#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that retrieve program and system information protocol (PSIP) and service information (SI) tables from a Protected Broadcast Driver Architecture (PBDA) transport stream.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-ipbdasiparser
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPBDASiParser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPBDASiParser
     * @type {Guid}
     */
    static IID => Guid("{9de49a74-aba2-4a18-93e1-21f17f95c3c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetEIT", "GetServices"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IUnknown} punk 
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
    Initialize(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Pointer<IPBDA_EIT>} ppEIT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdasiparser-geteit
     */
    GetEIT(dwSize, pBuffer, ppEIT) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", dwSize, pBufferMarshal, pBuffer, "ptr*", ppEIT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Pointer<IPBDA_Services>} ppServices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdasiparser-getservices
     */
    GetServices(dwSize, pBuffer, ppServices) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", dwSize, pBufferMarshal, pBuffer, "ptr*", ppServices, "HRESULT")
        return result
    }
}
