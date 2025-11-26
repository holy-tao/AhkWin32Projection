#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IGenericDescriptor.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get information from an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT). The NBIT describes the programs included in a multiplexed transport stream for an ISDB broadcast.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdb_nbit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IISDB_NBIT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IISDB_NBIT
     * @type {Guid}
     */
    static IID => Guid("{1b1863ef-08f1-40b7-a559-3b1eff8cafa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetOriginalNetworkId", "GetCountOfRecords", "GetRecordInformationId", "GetRecordInformationType", "GetRecordDescriptionBodyLocation", "GetRecordMessageSectionNumber", "GetRecordUserDefined", "GetRecordNumberOfKeys", "GetRecordKeys", "GetRecordCountOfDescriptors", "GetRecordDescriptorByIndex", "GetRecordDescriptorByTag", "GetVersionHash"]

    /**
     * Initializes the object by using captured table section data from an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface 
     * of the <b>SectionList</b> object that contains the section data.
     * @param {IMpeg2Data} pMPEGData Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the MPEG-2 Sections and Tables
     * filter.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * Gets the version number of a subtable within an Integrated Services Digital Broadcasting (ISDB) network broadcaster Information Table (NBIT).
     * @returns {Integer} Receives the version number.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets an identifier that identifies the broadcaster that originated the MPEG-2 transport stream from an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @returns {Integer} Receives the original network ID.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getoriginalnetworkid
     */
    GetOriginalNetworkId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @returns {Integer} Receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(6, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *     Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> method to get the number
     *     of records in the NBIT.
     * @returns {Integer} Receives the information_type field for the record.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordinformationid
     */
    GetRecordInformationId(dwRecordIndex) {
        result := ComCall(7, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets an information_type field from a record in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> method to get the number of records in the NBIT.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordinformationtype
     */
    GetRecordInformationType(dwRecordIndex) {
        result := ComCall(8, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Receives the value of the description_body_location field from a record in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Index of a record containing descriptors in the NBIT.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecorddescriptionbodylocation
     */
    GetRecordDescriptionBodyLocation(dwRecordIndex) {
        result := ComCall(9, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the section_number field from a record in Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> method to get the number
     *   of records in the NBIT.
     * @returns {Integer} Gets the section_number field value from the NBIT record.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordmessagesectionnumber
     */
    GetRecordMessageSectionNumber(dwRecordIndex) {
        result := ComCall(10, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the user_defined field from an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Record containing the user-defined field, indexed from zero.
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords </a> method to get the number of records in the NBIT.
     * @returns {Integer} Receives the user_defined field value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecorduserdefined
     */
    GetRecordUserDefined(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Returns the number_of_keys field value for a section in an for an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a>method to get the number of records in the NBIT.
     * @returns {Integer} Receives the number_of_keys field value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordnumberofkeys
     */
    GetRecordNumberOfKeys(dwRecordIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number_of_keys field from a record in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *     Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> method to get the number
     *     of records in the NBIT.
     * @returns {Pointer<Integer>} Gets the number_of_keys field from the NBIT record.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordkeys
     */
    GetRecordKeys(dwRecordIndex) {
        result := ComCall(13, this, "uint", dwRecordIndex, "ptr*", &pbKeys := 0, "HRESULT")
        return pbKeys
    }

    /**
     * Returns the number of descriptors for a record in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     * indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> 
     * method to get the number of records in the NBIT.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(14, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Retrieves a descriptor for a specified record in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT) based on the descriptor index.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. 
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> 
     *  method to get the number 
     * of records in the NBIT.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero. 
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordcountofdescriptors">IISDB_NBIT::GetRecordCountOfDescriptors</a> method 
     * to get the number of descriptors for a particular record.
     * @returns {IGenericDescriptor} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface implemented by the descriptor. The caller is responsible for freeing the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(15, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Gets a descriptor from a record in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT) by using the standard tag for the descriptor.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> method to get the number of records in the NBIT.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Receives 
     * the start position in the descriptor list. This parameter is optional. 
     * If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the first descriptor in the list. Otherwise, the search starts from the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor, if any. You can use this parameter to iterate through the descriptor list, 
     * looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface pointer. 
     * Use this interface to retrieve the information 
     * in the descriptor. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Returns a hash value for this instance of an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @returns {Integer} Receives the hash value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_nbit-getversionhash
     */
    GetVersionHash() {
        result := ComCall(17, this, "uint*", &pdwVersionHash := 0, "HRESULT")
        return pdwVersionHash
    }
}
