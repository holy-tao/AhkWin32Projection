#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDvbSiParser2.ahk

/**
 * Implements methods that retrieve program specific information (PSI) tables and service information tables from an Integrated Services Digital Broadcast (ISDB) transport stream.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbsiparser2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbSiParser2 extends IDvbSiParser2{
    /**
     * The interface identifier for IIsdbSiParser2
     * @type {Guid}
     */
    static IID => Guid("{900e4bb7-18cd-453f-98be-3be6aa211772}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<UInt16>} pwTransportStreamId 
     * @param {Pointer<IISDB_SDT>} ppSDT 
     * @returns {HRESULT} 
     */
    GetSDT(tableId, pwTransportStreamId, ppSDT) {
        result := ComCall(19, this, "char", tableId, "ushort*", pwTransportStreamId, "ptr", ppSDT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<UInt16>} pwOriginalNetworkId 
     * @param {Pointer<IISDB_BIT>} ppBIT 
     * @returns {HRESULT} 
     */
    GetBIT(tableId, pwOriginalNetworkId, ppBIT) {
        result := ComCall(20, this, "char", tableId, "ushort*", pwOriginalNetworkId, "ptr", ppBIT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<UInt16>} pwOriginalNetworkId 
     * @param {Pointer<IISDB_NBIT>} ppNBIT 
     * @returns {HRESULT} 
     */
    GetNBIT(tableId, pwOriginalNetworkId, ppNBIT) {
        result := ComCall(21, this, "char", tableId, "ushort*", pwOriginalNetworkId, "ptr", ppNBIT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<UInt16>} pwOriginalServiceId 
     * @param {Pointer<IISDB_LDT>} ppLDT 
     * @returns {HRESULT} 
     */
    GetLDT(tableId, pwOriginalServiceId, ppLDT) {
        result := ComCall(22, this, "char", tableId, "ushort*", pwOriginalServiceId, "ptr", ppLDT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<UInt16>} pwTableIdExt 
     * @param {Pointer<IISDB_SDTT>} ppSDTT 
     * @returns {HRESULT} 
     */
    GetSDTT(tableId, pwTableIdExt, ppSDTT) {
        result := ComCall(23, this, "char", tableId, "ushort*", pwTableIdExt, "ptr", ppSDTT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Integer} bSectionNumber 
     * @param {Pointer<UInt16>} pwDownloadDataId 
     * @param {Pointer<IISDB_CDT>} ppCDT 
     * @returns {HRESULT} 
     */
    GetCDT(tableId, bSectionNumber, pwDownloadDataId, ppCDT) {
        result := ComCall(24, this, "char", tableId, "char", bSectionNumber, "ushort*", pwDownloadDataId, "ptr", ppCDT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Integer} wTableIdExt 
     * @param {Pointer<IISDB_EMM>} ppEMM 
     * @returns {HRESULT} 
     */
    GetEMM(pid, wTableIdExt, ppEMM) {
        result := ComCall(25, this, "ushort", pid, "ushort", wTableIdExt, "ptr", ppEMM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
