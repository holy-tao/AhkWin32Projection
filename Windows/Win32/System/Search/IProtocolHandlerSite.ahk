#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Storage\IndexServer\IFilter.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for a protocol handler's IUrlAccessor object to query the Filter Daemon for the appropriate filter for the URL item.
 * @remarks
 * 
 * When a protocol handler encounters items with embedded documents, the protocol handler requests additional filters from the Filter Daemon by calling the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-iprotocolhandlersite-getfilter">IProtocolHandlerSite::GetFilter</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-iprotocolhandlersite
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IProtocolHandlerSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtocolHandlerSite
     * @type {Guid}
     */
    static IID => Guid("{0b63e385-9ccc-11d0-bcdb-00805fccce04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFilter"]

    /**
     * Retrieves the appropriate IFilteraccording to the supplied parameters.
     * @param {Pointer<Guid>} pclsidObj Type: <b>CLSID*</b>
     * 
     * Pointer to the CLSID of the document type from the registry. This is used for items with embedded documents to indicate the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a>to use for that embedded document.
     * @param {PWSTR} pcwszContentType Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string that contains the type of the document. This is used to retrieve <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a><b>s</b> that are mapped according to MIME type.
     * @param {PWSTR} pcwszExtension Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string that contains the file name extension, without the preceding period. This is used to retrieve <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a>objects that are mapped according to the file name extension.
     * @returns {IFilter} Type: <b>IFilter**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a>that the protocol handler uses.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-iprotocolhandlersite-getfilter
     */
    GetFilter(pclsidObj, pcwszContentType, pcwszExtension) {
        pcwszContentType := pcwszContentType is String ? StrPtr(pcwszContentType) : pcwszContentType
        pcwszExtension := pcwszExtension is String ? StrPtr(pcwszExtension) : pcwszExtension

        result := ComCall(3, this, "ptr", pclsidObj, "ptr", pcwszContentType, "ptr", pcwszExtension, "ptr*", &ppFilter := 0, "HRESULT")
        return IFilter(ppFilter)
    }
}
