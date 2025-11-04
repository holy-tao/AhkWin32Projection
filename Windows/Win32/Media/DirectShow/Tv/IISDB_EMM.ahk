#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Gets data from an Integrated Services Digital Broadcasting (ISDB) entitlement management message (EMM) table.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdb_emm
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IISDB_EMM extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IISDB_EMM
     * @type {Guid}
     */
    static IID => Guid("{0edb556d-43ad-4938-9668-321b2ffecfd3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetTableIdExtension", "GetDataBytes", "GetSharedEmmMessage", "GetIndividualEmmMessage", "GetVersionHash"]

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
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_emm-getversionnumber
     */
    GetVersionNumber(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_emm-gettableidextension
     */
    GetTableIdExtension(pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwBufferLength 
     * @param {Pointer<Integer>} pbBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_emm-getdatabytes
     */
    GetDataBytes(pwBufferLength, pbBuffer) {
        pwBufferLengthMarshal := pwBufferLength is VarRef ? "ushort*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pwBufferLengthMarshal, pwBufferLength, pbBufferMarshal, pbBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwLength 
     * @param {Pointer<Pointer<Integer>>} ppbMessage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_emm-getsharedemmmessage
     */
    GetSharedEmmMessage(pwLength, ppbMessage) {
        pwLengthMarshal := pwLength is VarRef ? "ushort*" : "ptr"
        ppbMessageMarshal := ppbMessage is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, pwLengthMarshal, pwLength, ppbMessageMarshal, ppbMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnknown 
     * @param {Pointer<Integer>} pwLength 
     * @param {Pointer<Pointer<Integer>>} ppbMessage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_emm-getindividualemmmessage
     */
    GetIndividualEmmMessage(pUnknown, pwLength, ppbMessage) {
        pwLengthMarshal := pwLength is VarRef ? "ushort*" : "ptr"
        ppbMessageMarshal := ppbMessage is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", pUnknown, pwLengthMarshal, pwLength, ppbMessageMarshal, ppbMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVersionHash 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_emm-getversionhash
     */
    GetVersionHash(pdwVersionHash) {
        pdwVersionHashMarshal := pdwVersionHash is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwVersionHashMarshal, pdwVersionHash, "HRESULT")
        return result
    }
}
