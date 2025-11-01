#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUrlAccessor.ahk

/**
 * Extends functionality of the IUrlAccessor interface.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-iurlaccessor2
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IUrlAccessor2 extends IUrlAccessor{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUrlAccessor2
     * @type {Guid}
     */
    static IID => Guid("{c7310734-ac80-11d1-8df3-00c04fb6ef4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDisplayUrl", "IsDocument", "GetCodePage"]

    /**
     * 
     * @param {PWSTR} wszDocUrl 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor2-getdisplayurl
     */
    GetDisplayUrl(wszDocUrl, dwSize, pdwLength) {
        wszDocUrl := wszDocUrl is String ? StrPtr(wszDocUrl) : wszDocUrl

        result := ComCall(16, this, "ptr", wszDocUrl, "uint", dwSize, "uint*", pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor2-isdocument
     */
    IsDocument() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszCodePage 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor2-getcodepage
     */
    GetCodePage(wszCodePage, dwSize, pdwLength) {
        wszCodePage := wszCodePage is String ? StrPtr(wszCodePage) : wszCodePage

        result := ComCall(18, this, "ptr", wszCodePage, "uint", dwSize, "uint*", pdwLength, "HRESULT")
        return result
    }
}
