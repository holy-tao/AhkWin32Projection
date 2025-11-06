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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getrecordlangid
     */
    GetRecordLangId(bRecordIndex) {
        result := ComCall(6, this, "char", bRecordIndex, "uint*", &ulVal := 0, "HRESULT")
        return ulVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Integer} convMode 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getrecordserviceprovidernamew
     */
    GetRecordServiceProviderNameW(bRecordIndex, convMode) {
        pbstrName := BSTR()
        result := ComCall(7, this, "char", bRecordIndex, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Integer} convMode 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getrecordservicenamew
     */
    GetRecordServiceNameW(bRecordIndex, convMode) {
        pbstrName := BSTR()
        result := ComCall(8, this, "char", bRecordIndex, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
