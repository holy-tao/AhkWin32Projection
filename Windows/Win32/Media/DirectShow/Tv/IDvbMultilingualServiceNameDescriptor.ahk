#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) multilingual service name descriptor. A multilingual service name descriptor provides the names of the service provider and service in text form in one or more languages.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbmultilingualservicenamedescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbMultilingualServiceNameDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbMultilingualServiceNameDescriptor
     * @type {Guid}
     */
    static IID => Guid("{2d80433b-b32c-47ef-987f-e78ebb773e34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCountOfRecords", "GetRecordLangId", "GetRecordServiceProviderNameW", "GetRecordServiceNameW"]

    /**
     * Gets the tag identifying a Digital Video Broadcast (DVB) multilingual service name descriptor.
     * @returns {Integer} Receives the service list descriptor tag. Typically, this value is 0x5D for multilingual service name descriptors.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the descriptor_length field value from a from a Digital Video Broadcast (DVB) multilingual service name descriptor.
     * @returns {Integer} Receives the descriptor_length field value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of service records in a Digital Video Broadcast (DVB) multilingual service name descriptor.
     * @returns {Integer} Receives the number of service records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from a Digital Video Broadcast (DVB) multilingual service name descriptor. The language code identifies the language used for text in the descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getcountofrecords">IDvbMultilingualServiceNameDescriptor::GetCountOfRecords</a>method to get the number of records in the multilingual service name descriptor.
     * @returns {Integer} Pointer to a buffer that receives the language code. For a list of language codes, refer to <a href="http://www.sil.org/ISO639-3/codes.asp">this document</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getrecordlangid
     */
    GetRecordLangId(bRecordIndex) {
        result := ComCall(6, this, "char", bRecordIndex, "uint*", &ulVal := 0, "HRESULT")
        return ulVal
    }

    /**
     * Gets the service provider name in string format from a Digital Video Broadcast (DVB) multilingual service name descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getcountofrecords">IDvbMultilingualServiceNameDescriptor::GetCountOfRecords</a>method to get the number of records in the logical channel descriptor.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to a memory block that receives the service provider name string. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getrecordserviceprovidernamew
     */
    GetRecordServiceProviderNameW(bRecordIndex, convMode) {
        pbstrName := BSTR()
        result := ComCall(7, this, "char", bRecordIndex, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the service name in string format from a Digital Video Broadcast (DVB) multilingual service name descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getcountofrecords">IDvbMultilingualServiceNameDescriptor::GetCountOfRecords</a>method to get the number of records in the logical channel descriptor.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the service name string. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getrecordservicenamew
     */
    GetRecordServiceNameW(bRecordIndex, convMode) {
        pbstrName := BSTR()
        result := ComCall(8, this, "char", bRecordIndex, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
