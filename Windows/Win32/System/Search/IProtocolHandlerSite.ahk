#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Guid>} pclsidObj 
     * @param {PWSTR} pcwszContentType 
     * @param {PWSTR} pcwszExtension 
     * @param {Pointer<IFilter>} ppFilter 
     * @returns {HRESULT} 
     */
    GetFilter(pclsidObj, pcwszContentType, pcwszExtension, ppFilter) {
        pcwszContentType := pcwszContentType is String ? StrPtr(pcwszContentType) : pcwszContentType
        pcwszExtension := pcwszExtension is String ? StrPtr(pcwszExtension) : pcwszExtension

        result := ComCall(3, this, "ptr", pclsidObj, "ptr", pcwszContentType, "ptr", pcwszExtension, "ptr", ppFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
