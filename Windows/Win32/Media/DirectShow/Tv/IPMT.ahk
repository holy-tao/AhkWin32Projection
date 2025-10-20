#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IPMT interface enables the client to get information from a program map table (PMT).
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nn-mpeg2psiparser-ipmt
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPMT extends IUnknown{
    /**
     * The interface identifier for IPMT
     * @type {Guid}
     */
    static IID => Guid("{01f3b398-9527-4736-94db-5195878e97a8}")

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
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetProgramNumber(pwVal) {
        result := ComCall(4, this, "ushort*", pwVal, "int")
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
        result := ComCall(5, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pPidVal 
     * @returns {HRESULT} 
     */
    GetPcrPid(pPidVal) {
        result := ComCall(6, this, "ushort*", pPidVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVal 
     * @returns {HRESULT} 
     */
    GetCountOfTableDescriptors(pdwVal) {
        result := ComCall(7, this, "uint*", pdwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     */
    GetTableDescriptorByIndex(dwIndex, ppDescriptor) {
        result := ComCall(8, this, "uint", dwIndex, "ptr", ppDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bTag 
     * @param {Pointer<UInt32>} pdwCookie 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     */
    GetTableDescriptorByTag(bTag, pdwCookie, ppDescriptor) {
        result := ComCall(9, this, "char", bTag, "uint*", pdwCookie, "ptr", ppDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetCountOfRecords(pwVal) {
        result := ComCall(10, this, "ushort*", pwVal, "int")
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
    GetRecordStreamType(dwRecordIndex, pbVal) {
        result := ComCall(11, this, "uint", dwRecordIndex, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<UInt16>} pPidVal 
     * @returns {HRESULT} 
     */
    GetRecordElementaryPid(dwRecordIndex, pPidVal) {
        result := ComCall(12, this, "uint", dwRecordIndex, "ushort*", pPidVal, "int")
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
        result := ComCall(13, this, "uint", dwRecordIndex, "uint*", pdwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} dwDescIndex 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwDescIndex, ppDescriptor) {
        result := ComCall(14, this, "uint", dwRecordIndex, "uint", dwDescIndex, "ptr", ppDescriptor, "int")
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
        result := ComCall(15, this, "uint", dwRecordIndex, "char", bTag, "uint*", pdwCookie, "ptr", ppDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DSMCC_ELEMENT>} ppDSMCCList 
     * @param {Pointer<UInt32>} puiCount 
     * @returns {HRESULT} 
     */
    QueryServiceGatewayInfo(ppDSMCCList, puiCount) {
        result := ComCall(16, this, "ptr", ppDSMCCList, "uint*", puiCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MPE_ELEMENT>} ppMPEList 
     * @param {Pointer<UInt32>} puiCount 
     * @returns {HRESULT} 
     */
    QueryMPEInfo(ppMPEList, puiCount) {
        result := ComCall(17, this, "ptr", ppMPEList, "uint*", puiCount, "int")
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

        result := ComCall(18, this, "ptr", hNextTableAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPMT>} ppPMT 
     * @returns {HRESULT} 
     */
    GetNextTable(ppPMT) {
        result := ComCall(19, this, "ptr", ppPMT, "int")
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

        result := ComCall(20, this, "ptr", hNextTableIsCurrent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ConvertNextToCurrent() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
