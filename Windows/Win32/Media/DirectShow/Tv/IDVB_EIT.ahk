#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvb_eit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDVB_EIT extends IUnknown{
    /**
     * The interface identifier for IDVB_EIT
     * @type {Guid}
     */
    static IID => Guid("{442db029-02cb-4495-8b92-1c13375bce99}")

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
    GetServiceId(pwVal) {
        result := ComCall(5, this, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetTransportStreamId(pwVal) {
        result := ComCall(6, this, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetOriginalNetworkId(pwVal) {
        result := ComCall(7, this, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetSegmentLastSectionNumber(pbVal) {
        result := ComCall(8, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetLastTableId(pbVal) {
        result := ComCall(9, this, "char*", pbVal, "int")
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
        result := ComCall(10, this, "uint*", pdwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetRecordEventId(dwRecordIndex, pwVal) {
        result := ComCall(11, this, "uint", dwRecordIndex, "ushort*", pwVal, "int")
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
        result := ComCall(12, this, "uint", dwRecordIndex, "ptr", pmdtVal, "int")
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
        result := ComCall(13, this, "uint", dwRecordIndex, "ptr", pmdVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetRecordRunningStatus(dwRecordIndex, pbVal) {
        result := ComCall(14, this, "uint", dwRecordIndex, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<BOOL>} pfVal 
     * @returns {HRESULT} 
     */
    GetRecordFreeCAMode(dwRecordIndex, pfVal) {
        result := ComCall(15, this, "uint", dwRecordIndex, "ptr", pfVal, "int")
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
        result := ComCall(16, this, "uint", dwRecordIndex, "uint*", pdwVal, "int")
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
        result := ComCall(17, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr", ppDescriptor, "int")
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
        result := ComCall(18, this, "uint", dwRecordIndex, "char", bTag, "uint*", pdwCookie, "ptr", ppDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hNextTableAvailable 
     * @returns {HRESULT} 
     */
    RegisterForNextTable(hNextTableAvailable) {
        hNextTableAvailable := hNextTableAvailable is Win32Handle ? NumGet(hNextTableAvailable, "ptr") : hNextTableAvailable

        result := ComCall(19, this, "ptr", hNextTableAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDVB_EIT>} ppEIT 
     * @returns {HRESULT} 
     */
    GetNextTable(ppEIT) {
        result := ComCall(20, this, "ptr", ppEIT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hNextTableIsCurrent 
     * @returns {HRESULT} 
     */
    RegisterForWhenCurrent(hNextTableIsCurrent) {
        hNextTableIsCurrent := hNextTableIsCurrent is Win32Handle ? NumGet(hNextTableIsCurrent, "ptr") : hNextTableIsCurrent

        result := ComCall(21, this, "ptr", hNextTableIsCurrent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ConvertNextToCurrent() {
        result := ComCall(22, this, "int")
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
        result := ComCall(23, this, "uint*", pdwVersionHash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
