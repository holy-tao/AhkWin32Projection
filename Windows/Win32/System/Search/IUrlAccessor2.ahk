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
     * 
     * @param {PWSTR} wszDocUrl 
     * @param {Integer} dwSize 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetDisplayUrl(wszDocUrl, dwSize, pdwLength) {
        wszDocUrl := wszDocUrl is String ? StrPtr(wszDocUrl) : wszDocUrl

        result := ComCall(16, this, "ptr", wszDocUrl, "uint", dwSize, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDocument() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszCodePage 
     * @param {Integer} dwSize 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetCodePage(wszCodePage, dwSize, pdwLength) {
        wszCodePage := wszCodePage is String ? StrPtr(wszCodePage) : wszCodePage

        result := ComCall(18, this, "ptr", wszCodePage, "uint", dwSize, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
