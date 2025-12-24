#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MPEG_DATE_AND_TIME.ahk
#Include .\MPEG_TIME.ahk
#Include .\IGenericDescriptor.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that enable the client to get information from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream. The IPBDASiParser::GetEIT method returns a pointer to this interface.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-ipbda_eit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPBDA_EIT extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetTableId", "GetVersionNumber", "GetServiceIdx", "GetCountOfRecords", "GetRecordEventId", "GetRecordStartTime", "GetRecordDuration", "GetRecordCountOfDescriptors", "GetRecordDescriptorByIndex", "GetRecordDescriptorByTag"]

    /**
     * Initializes an object that gets data from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} size Specifies the buffer size for data used to initialize each section.
     * @param {Pointer<Integer>} pBuffer Specifies the buffer used to initialize each section.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_eit-initialize
     */
    Initialize(size, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", size, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }

    /**
     * Gets the table identifier from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @returns {Integer} Receives the table identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_eit-gettableid
     */
    GetTableId() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the version number from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @returns {Integer} Receives the version number.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_eit-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the service identifier from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream. The service identifier identifies the service that contains the events.
     * @returns {Integer} Receives the service identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_eit-getserviceidx
     */
    GetServiceIdx() {
        result := ComCall(6, this, "uint*", &plwVal := 0, "HRESULT")
        return plwVal
    }

    /**
     * Receives the number of event records from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @returns {Integer} Receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(7, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Receives the unique identifier from an event record in an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords">IPBDA_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {Integer} Receives the event identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordeventid
     */
    GetRecordEventId(dwRecordIndex) {
        result := ComCall(8, this, "uint", dwRecordIndex, "uint*", &plwVal := 0, "HRESULT")
        return plwVal
    }

    /**
     * Gets the start time from an event record in an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords">IPBDA_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {MPEG_DATE_AND_TIME} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_date_and_time">MPEG_DATE_AND_TIME</a> structure that receives the start time from the event record.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordstarttime
     */
    GetRecordStartTime(dwRecordIndex) {
        pmdtVal := MPEG_DATE_AND_TIME()
        result := ComCall(9, this, "uint", dwRecordIndex, "ptr", pmdtVal, "HRESULT")
        return pmdtVal
    }

    /**
     * Gets the duration from an event record in an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords">IPBDA_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {MPEG_TIME} Receives the event duration.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordduration
     */
    GetRecordDuration(dwRecordIndex) {
        pmdVal := MPEG_TIME()
        result := ComCall(10, this, "uint", dwRecordIndex, "ptr", pmdVal, "HRESULT")
        return pmdVal
    }

    /**
     * Gets the number of event records from an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords">IPBDA_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Retrieves a descriptor for a specified record in an event information table (EIT) in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords">IPBDA_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @param {Integer} dwIndex Specifies the descriptor to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecordcountofdescriptors">IPBDA_EIT::GetRecordCountOfDescriptors</a> method to get the number of descriptors for a particular record.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface pointer. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Searches a record in an event information table (EIT) from a Protected Broadcast Device Architecture (PBDA) transport stream for a descriptor with a specified descriptor tag.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_eit-getcountofrecords">IPBDA_EIT::GetCountOfRecords</a> method to get the number of records in the EIT.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position in the descriptor list. This parameter is optional. If the value of *<i>pdwCookie</i> is <b>NULL</b>, the search starts from the first descriptor in the list. Otherwise, the search starts from the position given in *<i>pdwCookie</i>. When the method returns, the *<i>pdwCookie</i> parameter contains the position of the next matching descriptor, if any. You can use this parameter to iterate through the descriptor list, looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_eit-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }
}
