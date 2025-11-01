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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSDT", "GetBIT", "GetNBIT", "GetLDT", "GetSDTT", "GetCDT", "GetEMM"]

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwTransportStreamId 
     * @param {Pointer<IISDB_SDT>} ppSDT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getsdt
     */
    GetSDT(tableId, pwTransportStreamId, ppSDT) {
        pwTransportStreamIdMarshal := pwTransportStreamId is VarRef ? "ushort*" : "ptr"

        result := ComCall(19, this, "char", tableId, pwTransportStreamIdMarshal, pwTransportStreamId, "ptr*", ppSDT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwOriginalNetworkId 
     * @param {Pointer<IISDB_BIT>} ppBIT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getbit
     */
    GetBIT(tableId, pwOriginalNetworkId, ppBIT) {
        pwOriginalNetworkIdMarshal := pwOriginalNetworkId is VarRef ? "ushort*" : "ptr"

        result := ComCall(20, this, "char", tableId, pwOriginalNetworkIdMarshal, pwOriginalNetworkId, "ptr*", ppBIT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwOriginalNetworkId 
     * @param {Pointer<IISDB_NBIT>} ppNBIT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getnbit
     */
    GetNBIT(tableId, pwOriginalNetworkId, ppNBIT) {
        pwOriginalNetworkIdMarshal := pwOriginalNetworkId is VarRef ? "ushort*" : "ptr"

        result := ComCall(21, this, "char", tableId, pwOriginalNetworkIdMarshal, pwOriginalNetworkId, "ptr*", ppNBIT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwOriginalServiceId 
     * @param {Pointer<IISDB_LDT>} ppLDT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getldt
     */
    GetLDT(tableId, pwOriginalServiceId, ppLDT) {
        pwOriginalServiceIdMarshal := pwOriginalServiceId is VarRef ? "ushort*" : "ptr"

        result := ComCall(22, this, "char", tableId, pwOriginalServiceIdMarshal, pwOriginalServiceId, "ptr*", ppLDT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwTableIdExt 
     * @param {Pointer<IISDB_SDTT>} ppSDTT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getsdtt
     */
    GetSDTT(tableId, pwTableIdExt, ppSDTT) {
        pwTableIdExtMarshal := pwTableIdExt is VarRef ? "ushort*" : "ptr"

        result := ComCall(23, this, "char", tableId, pwTableIdExtMarshal, pwTableIdExt, "ptr*", ppSDTT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Integer} bSectionNumber 
     * @param {Pointer<Integer>} pwDownloadDataId 
     * @param {Pointer<IISDB_CDT>} ppCDT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getcdt
     */
    GetCDT(tableId, bSectionNumber, pwDownloadDataId, ppCDT) {
        pwDownloadDataIdMarshal := pwDownloadDataId is VarRef ? "ushort*" : "ptr"

        result := ComCall(24, this, "char", tableId, "char", bSectionNumber, pwDownloadDataIdMarshal, pwDownloadDataId, "ptr*", ppCDT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Integer} wTableIdExt 
     * @param {Pointer<IISDB_EMM>} ppEMM 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getemm
     */
    GetEMM(pid, wTableIdExt, ppEMM) {
        result := ComCall(25, this, "ushort", pid, "ushort", wTableIdExt, "ptr*", ppEMM, "HRESULT")
        return result
    }
}
