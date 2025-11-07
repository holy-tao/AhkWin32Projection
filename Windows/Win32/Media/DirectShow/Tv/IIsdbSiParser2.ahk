#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IISDB_SDT.ahk
#Include .\IISDB_BIT.ahk
#Include .\IISDB_NBIT.ahk
#Include .\IISDB_LDT.ahk
#Include .\IISDB_SDTT.ahk
#Include .\IISDB_CDT.ahk
#Include .\IISDB_EMM.ahk
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
     * @returns {IISDB_SDT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getsdt
     */
    GetSDT(tableId, pwTransportStreamId) {
        pwTransportStreamIdMarshal := pwTransportStreamId is VarRef ? "ushort*" : "ptr"

        result := ComCall(19, this, "char", tableId, pwTransportStreamIdMarshal, pwTransportStreamId, "ptr*", &ppSDT := 0, "HRESULT")
        return IISDB_SDT(ppSDT)
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwOriginalNetworkId 
     * @returns {IISDB_BIT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getbit
     */
    GetBIT(tableId, pwOriginalNetworkId) {
        pwOriginalNetworkIdMarshal := pwOriginalNetworkId is VarRef ? "ushort*" : "ptr"

        result := ComCall(20, this, "char", tableId, pwOriginalNetworkIdMarshal, pwOriginalNetworkId, "ptr*", &ppBIT := 0, "HRESULT")
        return IISDB_BIT(ppBIT)
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwOriginalNetworkId 
     * @returns {IISDB_NBIT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getnbit
     */
    GetNBIT(tableId, pwOriginalNetworkId) {
        pwOriginalNetworkIdMarshal := pwOriginalNetworkId is VarRef ? "ushort*" : "ptr"

        result := ComCall(21, this, "char", tableId, pwOriginalNetworkIdMarshal, pwOriginalNetworkId, "ptr*", &ppNBIT := 0, "HRESULT")
        return IISDB_NBIT(ppNBIT)
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwOriginalServiceId 
     * @returns {IISDB_LDT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getldt
     */
    GetLDT(tableId, pwOriginalServiceId) {
        pwOriginalServiceIdMarshal := pwOriginalServiceId is VarRef ? "ushort*" : "ptr"

        result := ComCall(22, this, "char", tableId, pwOriginalServiceIdMarshal, pwOriginalServiceId, "ptr*", &ppLDT := 0, "HRESULT")
        return IISDB_LDT(ppLDT)
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwTableIdExt 
     * @returns {IISDB_SDTT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getsdtt
     */
    GetSDTT(tableId, pwTableIdExt) {
        pwTableIdExtMarshal := pwTableIdExt is VarRef ? "ushort*" : "ptr"

        result := ComCall(23, this, "char", tableId, pwTableIdExtMarshal, pwTableIdExt, "ptr*", &ppSDTT := 0, "HRESULT")
        return IISDB_SDTT(ppSDTT)
    }

    /**
     * 
     * @param {Integer} tableId 
     * @param {Integer} bSectionNumber 
     * @param {Pointer<Integer>} pwDownloadDataId 
     * @returns {IISDB_CDT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getcdt
     */
    GetCDT(tableId, bSectionNumber, pwDownloadDataId) {
        pwDownloadDataIdMarshal := pwDownloadDataId is VarRef ? "ushort*" : "ptr"

        result := ComCall(24, this, "char", tableId, "char", bSectionNumber, pwDownloadDataIdMarshal, pwDownloadDataId, "ptr*", &ppCDT := 0, "HRESULT")
        return IISDB_CDT(ppCDT)
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Integer} wTableIdExt 
     * @returns {IISDB_EMM} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getemm
     */
    GetEMM(pid, wTableIdExt) {
        result := ComCall(25, this, "ushort", pid, "ushort", wTableIdExt, "ptr*", &ppEMM := 0, "HRESULT")
        return IISDB_EMM(ppEMM)
    }
}
