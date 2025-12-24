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
     * Gets the user-friendly path for the URL item.
     * @param {PWSTR} wszDocUrl Type: <b>WCHAR[]</b>
     * 
     * Receives the display URL as a null-terminated Unicode string.
     * @param {Integer} dwSize Type: <b>DWORD</b>
     * 
     * Size in <b>TCHAR</b><b>s</b>of <i>wszDocUrl</i>.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the number of
     *                 <b>TCHAR</b><b>s</b> written
     *                 to <i>wszDocUrl</i>, not including the terminating <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-iurlaccessor2-getdisplayurl
     */
    GetDisplayUrl(wszDocUrl, dwSize) {
        wszDocUrl := wszDocUrl is String ? StrPtr(wszDocUrl) : wszDocUrl

        result := ComCall(16, this, "ptr", wszDocUrl, "uint", dwSize, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    /**
     * Ascertains whether an item URL is a document or directory.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_FALSE if the item is a directory; otherwise, it returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-iurlaccessor2-isdocument
     */
    IsDocument() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Gets the code page for properties of the URL item.
     * @param {PWSTR} wszCodePage Type: <b>WCHAR[]</b>
     * 
     * Receives the code page as a null-terminated Unicode string.
     * @param {Integer} dwSize Type: <b>DWORD</b>
     * 
     * Size of <i>wszCodePage</i> 
     *                     in <b>TCHAR</b><b>s</b>.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the number of
     *                 <b>TCHAR</b><b>s</b> written to
     *                <i>wszCodePage</i>, not including the terminating <b>NULL</b> character.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-iurlaccessor2-getcodepage
     */
    GetCodePage(wszCodePage, dwSize) {
        wszCodePage := wszCodePage is String ? StrPtr(wszCodePage) : wszCodePage

        result := ComCall(18, this, "ptr", wszCodePage, "uint", dwSize, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }
}
