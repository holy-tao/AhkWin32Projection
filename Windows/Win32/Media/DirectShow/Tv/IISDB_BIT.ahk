#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IGenericDescriptor.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get information from an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT). A BIT contains a broadcaster unit and the service information transmission parameter for each broadcaster unit.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdb_bit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IISDB_BIT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IISDB_BIT
     * @type {Guid}
     */
    static IID => Guid("{537cd71e-0e46-4173-9001-ba043f3e49e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetOriginalNetworkId", "GetBroadcastViewPropriety", "GetCountOfTableDescriptors", "GetTableDescriptorByIndex", "GetTableDescriptorByTag", "GetCountOfRecords", "GetRecordBroadcasterId", "GetRecordCountOfDescriptors", "GetRecordDescriptorByIndex", "GetRecordDescriptorByTag", "GetVersionHash"]

    /**
     * Initializes the object by using captured table section data for an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface
     *   of the <b>SectionList</b> object that contains the section data.
     * @param {IMpeg2Data} pMPEGData Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the MPEG-2 Sections and Tables filter.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * Gets the version number for an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @returns {Integer} Receives the version_number field.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets an identifier that identifies the broadcaster that originated the MPEG-2 transport stream from an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @returns {Integer} Receives the original network ID.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-getoriginalnetworkid
     */
    GetOriginalNetworkId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Returns the broadcast_view_propriety flag from a record in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @returns {Integer} Receives the broadcast_view_propriety flag.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-getbroadcastviewpropriety
     */
    GetBroadcastViewPropriety() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the broadcaster_descriptors_length field value from an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @returns {Integer} Receives the broadcaster_descriptors_length field value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors() {
        result := ComCall(7, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Returns a descriptor for a specified table in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {Integer} dwIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountofrecords">IISDB_BIT::GetCountOfRecords</a> method to get the number of records in the BIT.
     * @returns {IGenericDescriptor} Specifies which descriptor to retrieve, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getrecordcountofdescriptors">IISDB_BIT::GetRecordCountOfDescriptors</a> method
     *   to get the number of descriptors for a particular record.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Searches a subtable in for an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position
     *   in the descriptor list. This parameter is optional.
     *   If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the
     *   first descriptor in the list. Otherwise, the search starts from
     *   the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i>parameter contains the position of the next matching descriptor,
     *   if any. You can use this parameter to iterate through the descriptor list,
     *   looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor
     *   </a>interface pointer. Use this interface to retrieve the information
     *   in the descriptor. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @returns {Integer} Receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(10, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Gets the broadcaster_id field from a record in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountofrecords">IISDB_BIT::GetCountOfRecords</a> method to get the number of records in the BIT.
     * @returns {Integer} Receives the broadcaster_id field.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-getrecordbroadcasterid
     */
    GetRecordBroadcasterId(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Returns the number of descriptors for subtables in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountofrecords">IISDB_BIT::GetCountOfRecords</a> 
     * 
     *   method to get the number of records in the BIT.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Returns a descriptor for a specified record in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountofrecords">IISDB_BIT::GetCountOfRecords</a> method to get the number
     *   of records in the BIT.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getrecordcountofdescriptors">IISDB_BIT::GetRecordCountOfDescriptors</a> method
     *   to get the number of descriptors for a particular record.
     * @returns {IGenericDescriptor} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface implemented by the descriptor.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(13, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Searches a record in an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_bit-getcountofrecords">IISDB_BIT::GetCountOfRecords</a> method to get the number of records in the BIT.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position
     *   in the descriptor list. This parameter is optional.
     *   If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the
     *   first descriptor in the list. Otherwise, the search starts from
     *   the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i>parameter contains the position of the next matching descriptor,
     *   if any. You can use this parameter to iterate through the descriptor list,
     *   looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor
     *   </a> interface pointer. Use this interface to retrieve the information
     *   in the descriptor. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Returns a hash value for this instance of an Integrated Services Digital Broadcasting (ISDB) broadcaster information table (BIT).
     * @returns {Integer} Receives the hash value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_bit-getversionhash
     */
    GetVersionHash() {
        result := ComCall(15, this, "uint*", &pdwVersionHash := 0, "HRESULT")
        return pdwVersionHash
    }
}
