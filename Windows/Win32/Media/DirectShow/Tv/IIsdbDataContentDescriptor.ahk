#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbdatacontentdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbDataContentDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbDataContentDescriptor
     * @type {Guid}
     */
    static IID => Guid("{a428100a-e646-4bd6-aa14-6087bdc08cd5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetDataComponentId", "GetEntryComponent", "GetSelectorLength", "GetSelectorBytes", "GetCountOfRecords", "GetRecordComponentRef", "GetLanguageCode", "GetTextW"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getdatacomponentid
     */
    GetDataComponentId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getentrycomponent
     */
    GetEntryComponent() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getselectorlength
     */
    GetSelectorLength() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bBufLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getselectorbytes
     */
    GetSelectorBytes(bBufLength) {
        result := ComCall(8, this, "char", bBufLength, "char*", &pbBuf := 0, "HRESULT")
        return pbBuf
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getrecordcomponentref
     */
    GetRecordComponentRef(bRecordIndex) {
        result := ComCall(10, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getlanguagecode
     */
    GetLanguageCode() {
        result := ComCall(11, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * 
     * @param {Integer} convMode 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrText := BSTR()
        result := ComCall(12, this, "int", convMode, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
