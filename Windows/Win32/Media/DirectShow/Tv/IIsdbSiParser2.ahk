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
     * Gets a service description table (SDT) from an Integrated Services Digital Broadcast (ISDB) transport stream. An SDT lists the names and other parameters of the services in an MPEG-2 transport stream.
     * @param {Integer} tableId Table identifier for the type of table to retrieve. For an SDT, this value is 0x42 for an actual transport stream, or 0x46 for another stream.
     * @param {Pointer<Integer>} pwTransportStreamId Pointer to the transport_stream_id field. This field value uniquely identifies the transport stream that contains the SDT.
     * @returns {IISDB_SDT} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-iisdb_sdt">IISDB_SDT</a>interface. Use this interface to retrieve the information in the table. 
     * The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getsdt
     */
    GetSDT(tableId, pwTransportStreamId) {
        pwTransportStreamIdMarshal := pwTransportStreamId is VarRef ? "ushort*" : "ptr"

        result := ComCall(19, this, "char", tableId, pwTransportStreamIdMarshal, pwTransportStreamId, "ptr*", &ppSDT := 0, "HRESULT")
        return IISDB_SDT(ppSDT)
    }

    /**
     * Gets the broadcaster information table (BIT) from an Integrated Services Digital Broadcasting (ISDB) transport stream. A BIT contains a broadcaster unit and the service information transmission parameter for each broadcaster unit.
     * @param {Integer} tableId Table identifier for the type of table to retrieve. For a BIT, this value is 0xC4.
     * @param {Pointer<Integer>} pwOriginalNetworkId Pointer to the original_network_id field for the BIT. This field contains an identifier for the broadcaster that originates the
     *   MPEG-2 transport stream
     * @returns {IISDB_BIT} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-iisdb_bit">IISDB_BIT</a>interface. Use this interface to retrieve the information in the table. 
     * The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getbit
     */
    GetBIT(tableId, pwOriginalNetworkId) {
        pwOriginalNetworkIdMarshal := pwOriginalNetworkId is VarRef ? "ushort*" : "ptr"

        result := ComCall(20, this, "char", tableId, pwOriginalNetworkIdMarshal, pwOriginalNetworkId, "ptr*", &ppBIT := 0, "HRESULT")
        return IISDB_BIT(ppBIT)
    }

    /**
     * Gets the network board information table (NBIT) from an Integrated Services Digital Broadcast (ISDB) transport stream. The NBIT describes the programs included in a multiplexed transport stream.
     * @param {Integer} tableId Table identifier for the type of table to retrieve. For an NBIT, this value is 0xC5 if the table contains the network board information body, or 0xC6 if the table contains reference information for retrieving the network board information.
     * @param {Pointer<Integer>} pwOriginalNetworkId Pointer to the original_network_id field for the NBIT. This field contains an identifier for the broadcaster that originates the
     *   MPEG-2 transport stream
     * @returns {IISDB_NBIT} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-iisdb_nbit">IISDB_NBIT</a>interface. Use this interface to retrieve the information in the table. 
     * The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getnbit
     */
    GetNBIT(tableId, pwOriginalNetworkId) {
        pwOriginalNetworkIdMarshal := pwOriginalNetworkId is VarRef ? "ushort*" : "ptr"

        result := ComCall(21, this, "char", tableId, pwOriginalNetworkIdMarshal, pwOriginalNetworkId, "ptr*", &ppNBIT := 0, "HRESULT")
        return IISDB_NBIT(ppNBIT)
    }

    /**
     * Gets a linked description table (LDT) from an Integrated Services Digital Broadcast (ISDB) transport stream. An LDT contains data that is used to collect reference information from other tables.
     * @param {Integer} tableId Table identifier for the type of table to retrieve. For an LDT, this value is 0xC7.
     * @param {Pointer<Integer>} pwOriginalServiceId Pointer to the original_service_id field for the LDT. This field contains an identifier for the service  for this transport stream.
     * @returns {IISDB_LDT} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-iisdb_ldt">IISDB_LDT</a>interface. Use this interface to retrieve the information in the table. 
     * The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getldt
     */
    GetLDT(tableId, pwOriginalServiceId) {
        pwOriginalServiceIdMarshal := pwOriginalServiceId is VarRef ? "ushort*" : "ptr"

        result := ComCall(22, this, "char", tableId, pwOriginalServiceIdMarshal, pwOriginalServiceId, "ptr*", &ppLDT := 0, "HRESULT")
        return IISDB_LDT(ppLDT)
    }

    /**
     * Gets the software download trigger table (SDTT) from an Integrated Services Digital Broadcast (ISDB) transport stream. An SDTT contains download information such as the service identifier, schedule, and receiver types for revision.
     * @param {Integer} tableId Table identifier for the type of table to retrieve. For an SDTT, this value is 0xC34.
     * @param {Pointer<Integer>} pwTableIdExt Value of the table_id_extension field for the SDTT. This field value identifies a specific instance of the SDTT.
     * @returns {IISDB_SDTT} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-iisdb_sdtt">IISDB_SDTT</a>interface. Use this interface to retrieve the information in the table. 
     * The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getsdtt
     */
    GetSDTT(tableId, pwTableIdExt) {
        pwTableIdExtMarshal := pwTableIdExt is VarRef ? "ushort*" : "ptr"

        result := ComCall(23, this, "char", tableId, pwTableIdExtMarshal, pwTableIdExt, "ptr*", &ppSDTT := 0, "HRESULT")
        return IISDB_SDTT(ppSDTT)
    }

    /**
     * Gets the common data table (CDT) from an Integrated Services Digital Broadcasting (ISDB) transport stream. A CDT contains data that is needed for receivers and stored in nonvolatile memory, such as company logos.
     * @param {Integer} tableId Table identifier for the type of table to retrieve. For a CDT, this value is 0xC8.
     * @param {Integer} bSectionNumber Specifies the value of the section_number field for the CDT.
     * @param {Pointer<Integer>} pwDownloadDataId Pointer to the download_data_id field value for the CDT.
     * @returns {IISDB_CDT} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-iisdb_cdt">IISDB_CDT</a>interface. Use this interface to retrieve the information in the table. 
     * The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getcdt
     */
    GetCDT(tableId, bSectionNumber, pwDownloadDataId) {
        pwDownloadDataIdMarshal := pwDownloadDataId is VarRef ? "ushort*" : "ptr"

        result := ComCall(24, this, "char", tableId, "char", bSectionNumber, pwDownloadDataIdMarshal, pwDownloadDataId, "ptr*", &ppCDT := 0, "HRESULT")
        return IISDB_CDT(ppCDT)
    }

    /**
     * Gets the entitlement management message (EMM) table from an Integrated Services Digital Broadcast (ISDB) transport stream.
     * @param {Integer} pid Specifies the packet identifier (PID) of the transport stream packet that transmits the EMM.
     * @param {Integer} wTableIdExt Value of the table_id field for the EMM. This field value identifies a subtable in the EMM.
     * @returns {IISDB_EMM} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-iisdb_emm">IISDB_EMM</a>interface. Use this interface to retrieve the information in the table. 
     * The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparser2-getemm
     */
    GetEMM(pid, wTableIdExt) {
        result := ComCall(25, this, "ushort", pid, "ushort", wTableIdExt, "ptr*", &ppEMM := 0, "HRESULT")
        return IISDB_EMM(ppEMM)
    }
}
