#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that enable the client to get information from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream. The IPBDASiParser::GetEIT method returns a pointer to this interface.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-ipbda_eit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPBDA_EIT extends IUnknown{
    /**
     * The interface identifier for IPBDA_EIT
     * @type {Guid}
     */
    static IID => Guid("{a35f2dea-098f-4ebd-984c-2bd4c3c8ce0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} size 
     * @param {Pointer<Byte>} pBuffer 
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
    Initialize(size, pBuffer) {
        result := ComCall(3, this, "uint", size, "char*", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetTableId(pbVal) {
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
    GetVersionNumber(pwVal) {
        result := ComCall(5, this, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} plwVal 
     * @returns {HRESULT} 
     */
    GetServiceIdx(plwVal) {
        result := ComCall(6, this, "uint*", plwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVal 
     * @returns {HRESULT} 
     */
    GetCountOfRecords(pdwVal) {
        result := ComCall(7, this, "uint*", pdwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<UInt64>} plwVal 
     * @returns {HRESULT} 
     */
    GetRecordEventId(dwRecordIndex, plwVal) {
        result := ComCall(8, this, "uint", dwRecordIndex, "uint*", plwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<MPEG_DATE_AND_TIME>} pmdtVal 
     * @returns {HRESULT} 
     */
    GetRecordStartTime(dwRecordIndex, pmdtVal) {
        result := ComCall(9, this, "uint", dwRecordIndex, "ptr", pmdtVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<MPEG_TIME>} pmdVal 
     * @returns {HRESULT} 
     */
    GetRecordDuration(dwRecordIndex, pmdVal) {
        result := ComCall(10, this, "uint", dwRecordIndex, "ptr", pmdVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<UInt32>} pdwVal 
     * @returns {HRESULT} 
     */
    GetRecordCountOfDescriptors(dwRecordIndex, pdwVal) {
        result := ComCall(11, this, "uint", dwRecordIndex, "uint*", pdwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} dwIndex 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex, ppDescriptor) {
        result := ComCall(12, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr", ppDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} bTag 
     * @param {Pointer<UInt32>} pdwCookie 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie, ppDescriptor) {
        result := ComCall(13, this, "uint", dwRecordIndex, "char", bTag, "uint*", pdwCookie, "ptr", ppDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
