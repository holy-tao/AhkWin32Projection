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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<ISectionList>} pSectionList 
     * @param {Pointer<IMpeg2Data>} pMPEGData 
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
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetVersionNumber(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetTableIdExtension(pwVal) {
        result := ComCall(5, this, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwBufferLength 
     * @param {Pointer<Byte>} pbBuffer 
     * @returns {HRESULT} 
     */
    GetDataBytes(pwBufferLength, pbBuffer) {
        result := ComCall(6, this, "ushort*", pwBufferLength, "char*", pbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwLength 
     * @param {Pointer<Byte>} ppbMessage 
     * @returns {HRESULT} 
     */
    GetSharedEmmMessage(pwLength, ppbMessage) {
        result := ComCall(7, this, "ushort*", pwLength, "char*", ppbMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnknown 
     * @param {Pointer<UInt16>} pwLength 
     * @param {Pointer<Byte>} ppbMessage 
     * @returns {HRESULT} 
     */
    GetIndividualEmmMessage(pUnknown, pwLength, ppbMessage) {
        result := ComCall(8, this, "ptr", pUnknown, "ushort*", pwLength, "char*", ppbMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVersionHash 
     * @returns {HRESULT} 
     */
    GetVersionHash(pdwVersionHash) {
        result := ComCall(9, this, "uint*", pdwVersionHash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
