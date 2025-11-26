#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IGenericDescriptor.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get information from an Integrated Services Digital Broadcasting (ISDB) common data table (CDT). A CDT contains data, such as company logos, that is needed for receivers and stored in nonvolatile memory.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdb_cdt
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IISDB_CDT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IISDB_CDT
     * @type {Guid}
     */
    static IID => Guid("{25fa92c2-8b80-4787-a841-3a0e8f17984b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetDownloadDataId", "GetSectionNumber", "GetOriginalNetworkId", "GetDataType", "GetCountOfTableDescriptors", "GetTableDescriptorByIndex", "GetTableDescriptorByTag", "GetSizeOfDataModule", "GetDataModule", "GetVersionHash"]

    /**
     * Initializes the object by using captured table section data from an Integrated Services Digital Broadcasting System (ISDB) common data table (CDT).
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface
     *   of the object that contains the section data.
     * @param {IMpeg2Data} pMPEGData Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/mpeg-2-sections-and-tables-filter">MPEG-2 Sections and Tables</a> filter.
     * @param {Integer} bSectionNumber Specifies a value for the section_number field.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_cdt-initialize
     */
    Initialize(pSectionList, pMPEGData, bSectionNumber) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "char", bSectionNumber, "HRESULT")
        return result
    }

    /**
     * Gets the version number for an Integrated Services Digital Broadcasting (ISDB) common data table (CDT).
     * @returns {Integer} Receives the version_number field.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_cdt-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Receives the download_data_id field value for a logo transmission descriptor from an Integrated Services Digital Broadcasting (ISDB) common data table (CDT). The download_data_id field identifies the data to be downloaded.
     * @returns {Integer} Receives the download_data_id field value. This value is the same as the value of the table_id_extension field for the CDT containing the logo data.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_cdt-getdownloaddataid
     */
    GetDownloadDataId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the section_number field value from an Integrated Services Digital Broadcasting (ISDB) common data table (CDT).
     * @returns {Integer} Receives the section_number field value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_cdt-getsectionnumber
     */
    GetSectionNumber() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets an identifier that identifies the broadcaster that originated the MPEG-2 transport stream from an Integrated Services Digital Broadcasting (ISDB) common data table (CDT).
     * @returns {Integer} Receives the original network ID.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_cdt-getoriginalnetworkid
     */
    GetOriginalNetworkId() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Receives the data type value from an Integrated Services Digital Broadcasting (ISDB) common data table (CDT).
     * @returns {Integer} Receives the data type value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_cdt-getdatatype
     */
    GetDataType() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Returns the number of descriptors for logos in an Integrated Services Digital Broadcasting (ISDB) common data table (CDT).
     * @returns {Integer} Receives the count of logo descriptors.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_cdt-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors() {
        result := ComCall(9, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Returns a specified logo transmission descriptor from an Integrated Services Digital Broadcasting (ISDB) common data table (CDT).
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_cdt-getcountoftabledescriptors">IISDB_CDT::GetCountOfTableDescriptors</a> method to get the number of table descriptors.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface implemented by the descriptor. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_cdt-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex) {
        result := ComCall(10, this, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Searches a subtable in an Integrated Services Digital Broadcasting (ISDB) common data table (CDT).
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position
     *   in the descriptor list. This parameter is optional.
     *   If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the
     *   first descriptor in the list. Otherwise, the search starts from
     *   the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i>parameter contains the position of the next matching descriptor,
     *   if any. You can use this parameter to iterate through the descriptor list,
     *   looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a>interface pointer. Use this interface to retrieve the information
     *   in the descriptor. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_cdt-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Gets the size of a data module from an Integrated Services Digital Broadcasting (ISDB) common data table (CDT).
     * @returns {Integer} Receives the size of the data module.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_cdt-getsizeofdatamodule
     */
    GetSizeOfDataModule() {
        result := ComCall(12, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Receives the data module from an Integrated Services Digital Broadcasting (ISDB) common data table (CDT).
     * @returns {Pointer<Integer>} Pointer to a memory block allocated to receive the data module.
     * The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_cdt-getdatamodule
     */
    GetDataModule() {
        result := ComCall(13, this, "ptr*", &pbData := 0, "HRESULT")
        return pbData
    }

    /**
     * Returns a hash value for this instance of an Integrated Services Digital Broadcasting (ISDB) common data table (CDT).
     * @returns {Integer} Receives the hash value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_cdt-getversionhash
     */
    GetVersionHash() {
        result := ComCall(14, this, "uint*", &pdwVersionHash := 0, "HRESULT")
        return pdwVersionHash
    }
}
