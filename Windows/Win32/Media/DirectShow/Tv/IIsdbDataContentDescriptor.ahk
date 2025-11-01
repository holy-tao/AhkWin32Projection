#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-gettag
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getlength
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getdatacomponentid
     */
    GetDataComponentId(pwVal) {
        result := ComCall(5, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getentrycomponent
     */
    GetEntryComponent(pbVal) {
        result := ComCall(6, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getselectorlength
     */
    GetSelectorLength(pbVal) {
        result := ComCall(7, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bBufLength 
     * @param {Pointer<Integer>} pbBuf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getselectorbytes
     */
    GetSelectorBytes(bBufLength, pbBuf) {
        result := ComCall(8, this, "char", bBufLength, "char*", pbBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getcountofrecords
     */
    GetCountOfRecords(pbVal) {
        result := ComCall(9, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getrecordcomponentref
     */
    GetRecordComponentRef(bRecordIndex, pbVal) {
        result := ComCall(10, this, "char", bRecordIndex, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pszCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getlanguagecode
     */
    GetLanguageCode(pszCode) {
        result := ComCall(11, this, "char*", pszCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-gettextw
     */
    GetTextW(convMode, pbstrText) {
        result := ComCall(12, this, "int", convMode, "ptr", pbstrText, "HRESULT")
        return result
    }
}
